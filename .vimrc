if $DISPLAY != ""
  gui
endif

if has("gui_running")
  colorscheme darkblue
  set guioptions-=T
endif

set shiftwidth=2
set tabstop=2
set expandtab

autocmd FileType make setlocal noexpandtab
