set shiftwidth=2
set tabstop=2
set expandtab

if $DISPLAY != ""
  gui
endif

if has("gui_running")
  colorscheme darkblue
  set guioptions-=T
endif


autocmd FileType make setlocal noexpandtab
