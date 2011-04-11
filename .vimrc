"Necessary for pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if $DISPLAY != ""
  gui
endif

if &t_Co > 2 || has("gui_running")
  syntax on        " switch syntax highlighting on, when the terminal has colors
endif

if &t_Co >= 256 || has("gui_running")
  colorscheme mustang
  highlight linenr guibg=black "set numberbar colors
  set guioptions-=T " disable GUI toolbar
  set gfn=Monaco\ 12

  "colorscheme darkblue
  "highlight linenr guifg=white guibg=darkblue "set numberbar
endif


set hidden


"set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type


set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
"set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set expandtab
set cursorline

set pastetoggle=<F2>

" save keystrokes by removing need to press shift to produce : in command mode
nnoremap ; :


" Use Q for formatting the current paragraph (or selection)
set textwidth=77
vmap Q gq
nmap Q gqap

" Force your newbie friends to stop using the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Makes the down key no longer jump over wrapped lines
nnoremap j gj
nnoremap k gk

nmap <silent> ,/ :nohlsearch<CR>

" Give vim control of mouse - use F12 to toggle control to terminal
set mouse=a

" Run sudo
cmap w!! w !sudo tee % >/dev/null

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
match OverLength /\%78v.\+/

"Necessary for vim-textobj-rubyblock
runtime macros/matchit.vim
filetype plugin indent on


let mapleader = ","
"rebind my favorite commands from Git.vim for Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gu :Git pull<cr>

"Max Files command-t can list
let g:CommandTMaxFiles=20000

" Activate LustyJuggler
nmap <silent> <Leader>b :LustyJuggler<CR>

" Toggle spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" Tim Pope's Automatic Tabularization of | https://gist.github.com/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Show whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has('autocmd')
  " Enter directory of file opened in buffer
  " disabled because it causes issues with vim-fugitive
  " autocmd BufEnter * lcd %:p:h

  " Disable whitespace display of tabs in html and xml
  autocmd FileType html,xml set listchars-=tab:>.

  "Disable expandtab on make and patch files
  autocmd FileType make setlocal noexpandtab
  autocmd BufEnter *.patch setlocal noexpandtab
endif


"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
