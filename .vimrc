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

" Show whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Disable whitespace display of tabs in html and xml
"if has('autocmd')
"  autocmd filetype html,xml set listchars-=tab:>.
"end

nmap <silent> ,/ :nohlsearch<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"Necessary for vim-textobj-rubyblock
runtime macros/matchit.vim
filetype plugin indent on


"Necessary for nerdtree and vim-fuzzyfinder
let mapleader = "\\"
map <Leader>n :NERDTreeToggle<CR>
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>s :FufTag<CR>


if has('autocmd')
  "Disable expandtab on make and patch files
  autocmd FileType make setlocal noexpandtab
  autocmd BufEnter *.patch setlocal noexpandtab
endif


"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
