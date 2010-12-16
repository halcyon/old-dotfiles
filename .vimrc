if $DISPLAY != ""
  gui
endif

if has("gui_running")
  colorscheme darkblue
  set guioptions-=T
  set gfn=Monaco\ 12
  set number
  highlight linenr guifg=white guibg=darkblue
endif

set shiftwidth=2
set tabstop=2
set expandtab

"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
let mapleader = "\\"
map <Leader>n :NERDTreeToggle<CR>
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>s :FufTag<CR>

autocmd FileType make setlocal noexpandtab
autocmd BufEnter *.patch setlocal noexpandtab
