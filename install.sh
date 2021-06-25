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

install_manjaro() {
 echo "flag"
  if [ "$(is_installed git)" == "0" ]; then echo "Installing Git" sudo pacman -Syu git-all
  fi

  if [ "$(is_installed zsh)" == "0" ]; then
    echo "Installing zsh"
    sudo pacman -Syu zsh
  fi

  if [ "$(is_installed ag)" == "0" ]; then
    echo "Installing The silver searcher"
    sudo  pacman -Syu the_silver_searcher
  fi

  if [ "$(is_installed fzf)" == "0" ]; then
    echo "Installing fzf"
    sudo pacman -Syu fzf
  fi

  if [ "$(is_installed tmux)" == "0" ]; then
    echo "Installing tmux"
    sudo pacman -Syu tmux
  fi


  if [ "$(is_installed node)" == "0" ]; then
    echo "Installing Node"
    sudo pacman -Syu nodejs
    sudo pacman -Syu npm
  fi
  echo "install nvim"
  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Install neovim"
    sudo pacman -Syu neovim
  fi

  sudo pacman -S ccls
}


link_dotfiles() {
cd ~
  echo "Installing oh-my-zsh"
  #sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "Installing zsh-autosuggestions"
  git clone git://github.com/zsh-users/zsh-autosuggestions .oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  curl -fLo ~/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Linking dotfiles"
  rm ~/.zshrc
  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

  git clone https://github.com/dracula/zsh.git
  ln -s ~/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
  chsh -s $(which zsh)
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
    --manjaro)
      install_manjaro
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

