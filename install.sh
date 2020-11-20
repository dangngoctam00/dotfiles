#ln -s ~/dotfiles/zshrc ~/.zshrc
#ln -s ~/dotfiles/tmux.conf ~/.tmux.conf



#auto-load neovim
#curl -fLo ~/dotfiles/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim




#!/bin/bash
echo "Starting install"
# Utils
is_installed() {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}

install_macos() {
 # if [[ $OSTYPE != darwin* ]]; then
 #  return
 # fi
 # echo "MacOS detected"
 # xcode-select --install

  if [ "$(is_installed git)" == "0" ]; then
    echo "Installing Git"
    sudo apt install git-all
  fi

  if [ "$(is_installed zsh)" == "0" ]; then
    echo "Installing zsh"
    sudo apt-get install zsh
  fi

  if [ "$(is_installed ag)" == "0" ]; then
    echo "Installing The silver searcher"
    sudo  apt-get install silversearcher-ag
  fi

  if [ "$(is_installed fzf)" == "0" ]; then
    echo "Installing fzf"
    sudo apt-get install fzf
  fi

  if [ "$(is_installed tmux)" == "0" ]; then
    echo "Installing tmux"
    sudo apt install tmux
  fi


  if [ "$(is_installed node)" == "0" ]; then
    echo "Installing Node"
    sudo apt-get install nodejs
    sudo apt install npm
  fi
  echo "install nvim"
  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Install neovim"
    sudo apt install neovim
  fi

  sudo apt install ccls

  ##install font
  #cd ~/Downloads
  #wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
  #if [ ! -d "~/.fonts" ] ; then
      #mkdir ~/.fonts
  #fi
  #unzip 1.050R-it.zip 
  #cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
  #rm -rf source-code-pro* 
  #rm 1.050R-it.zip 
  #cd ~/
  #fc-cache -f -v
}

#function backup {
  # echo "Backing up dotfiles"
  # local current_date=$(date +%s)
  # local backup_dir=dotfiles_$current_date
  #
  #  mkdir ~/$backup_dir
  #
  #  mv ~/.zshrc ~/$backup_dir/.zshrc
  #  mv ~/.tmux.conf ~/$backup_dir/.tmux.conf
  # mv ~/.vim ~/$backup_dir/.vim
  # mv ~/.vimrc ~/$backup_dir/.vimrc
  # mv ~/.vimrc.bundles ~/$backup_dir/.vimrc.bundles
#}

link_dotfiles() {
  echo "Linking dotfiles"
cd ~
  ln -s ~/dotfiles/zshrc .zshrc
  ln -s ~/dotfiles/tmux.conf .tmux.conf
  
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


  if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions"
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
  fi


  curl -fLo $(pwd)/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

  git clone https://github.com/dracula/zsh.git
   cd ~/.oh-my-zsh/themes/
  ln -s ~/zsh/dracula.zsh-theme dracula.zsh-theme
  cd ~
 # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

 # rm -rf $HOME/.config/nvim/init.vim
 # rm -rf $HOME/.config/nvim
 # mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
 # ln -s $(pwd)/nvim $XDG_CONFIG_HOME/nvim
 # ln -s $(pwd)/nvim/init.vim $XDG_CONFIG_HOME/nvim/init.vim
}

while test $# -gt 0; do 
  case "$1" in
    --help)
      echo "Help"
      exit
      ;;
    --macos)
      install_macos
     # backup
      link_dotfiles
      zsh
      source ~/.zshrc
      exit
      ;;
    --backup)
      backup
      exit
      ;;
    --dotfiles)
      link_dotfiles
      exit
      ;;
  esac

  shift
done
