" Teach vim to syntax highlight Vagrantfile as ruby
"
" Install: $HOME/.vim/plugin/vagrant.vim
" Author: Brandon Philips <brandon@ifup.org>

augroup buildr
	au!
	au BufRead,BufNewFile Buildfile set filetype=ruby
augroup END
