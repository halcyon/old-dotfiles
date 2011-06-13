" Teach vim to syntax highlight Vagrantfile as ruby
"
" Install: $HOME/.vim/plugin/vagrant.vim
" Author: Brandon Philips <brandon@ifup.org>

augroup erb
	au!
	au BufRead,BufNewFile *.erb set filetype=ruby
augroup END
