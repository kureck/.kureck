set nocompatible
set encoding=utf8
set backspace=indent,eol,start
set shortmess+=c

"Pathogen
execute pathogen#infect()
syntax on
"filetype plugin indent off

highlight BadWhitespace ctermbg=red guibg=red

set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" VCS plugins
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/paredit.vim'
Plugin 'bhurlow/vim-parinfer'

" Python and Go
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/swap-parameters'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ihacklog/HiCursorWords'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'marcindziedzic/vim-numbertoggle'

" HTML5 and JavaScript
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Always show statusline
set laststatus=2
set t_Co=256 "Term Colors

colorscheme molokai

set ruler "Cursor Position
set nu "Line numbers
set cursorline "Cursor Line
set cursorcolumn "Cursor Column
set tabstop=4 "Set tab space size

if has('mouse') "Hide mouse
       	set mousehide  " Hide mouse after chars typed
	set mouse=a "use in all modes
endif

nmap <silent> <Leader>p :NERDTreeToggle<CR>

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc,*.class,*/tmp/*,*.so,*.swp,*.zip,*.gif,*.jpeg,*.jpg,*.png "stuff to ignore when tab completing

set backupdir=~/.lett/.vim/tmp
set directory=~/.lett/.vim/tmp

set clipboard=unnamed

nmap <silent> <Leader>c :.w !pbcopy<CR><CR>
nmap <silent> <Leader>v :r !pbpaste<CR>

set iskeyword-=_

"#inoremap  <Up>     <NOP>
"#inoremap  <Down>   <NOP>
"#inoremap  <Left>   <NOP>
"#inoremap  <Right>  <NOP>
"#noremap   <Up>     <NOP>
"#noremap   <Down>   <NOP>
"#noremap   <Left>   <NOP>
"#noremap   <Right>  <NOP>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Toggle Paredit
nmap <Leader>} :PareditToggle<CR>

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" move vertically by visual line
nnoremap j gj
nnoremap k gk

map Y y$

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Python tabspace PEP8
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" Same for js and html
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

" 
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.c match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.h match BadWhitespace /\s\+$/

let g:ycm_python_binary_path = '/usr/bin/python3'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Go related mappings ,docummentation
" https://github.com/fatih/vim-go/blob/master/README.md
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Ag
let g:ag_working_path_mode= 'r'
