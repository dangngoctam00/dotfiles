for f in split(glob('~/dotfiles/nvim/configs/*.vim'), '\n')
   exe 'source' f
endfor
