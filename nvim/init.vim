call plug#begin()

" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" menu file
Plug 'scrooloose/nerdtree'

" Linter
Plug 'w0rp/ale'

" Utils
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'djoshea/vim-autoread'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-buftabline'
Plug 'easymotion/vim-easymotion'
Plug 'cohama/lexima.vim'

" Emmet
Plug 'mattn/emmet-vim'

"javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" python
Plug 'kh3phr3n/python-syntax'

" Colour Themes
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'kaicataldo/material.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'patstockwell/vim-monokai-tasty'


" Test Run
Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

" Determines filetype from name to allow intelligent auto-indenting, etc.
filetype plugin indent on

" Enable syntax highlighting
syntax on


"runtime macros/matchit.vim

" == == == == == == == == == == == == == == == == == == == =
"   GENERAL SETTINGS
" == == == == == == == == == == == == == == == == == == == =


"set cursorline  " hihgli line current
set backspace=indent,eol,start
set history=1000
set ruler
set showcmd
set autoindent
set showmatch
set nowrap "not spli line if long
set autoread
set autowrite
set backupdir=/tmp
set directory=/tmp
set viminfo +=!
set guioptions-=T
set laststatus=2
set scrolloff=3
set sidescrolloff=4
set hidden " Permitir cambiar de buffers sin tener que guardarlos
" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " Insertar espacios en lugar de < Tab > s
set regexpengine=1
" set relativenumber
set number "show number line
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase " Ignorar mayúsculas al hacer una búsqueda
set smartcase " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set mouse=a " show integration mouse
set shell=bash
set clipboard=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

" (Hopefully) removes the delay when hitting esc in insert mode
" set noesckeys
set ttimeout
set ttimeoutlen=1
"set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

"set list "show ocultos .
set nolist "show ocultos .

set ttyfast
" set lazyredraw
" set re=1

set path+=**
"set tags=./tags; /
set encoding=UTF-8
"set foldmethod=indent
set signcolumn=yes


" enable tags
set laststatus=2


" = == == == == == == == == == == == == == == == == == == =
"   AUTOCOMMANDS
" = == == == == == == == == == == == == == == == == == == =

if has("autocmd")
  augroup vimrcEx
    au!

    autocmd BufRead *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    autocmd BufRead * normal zR
    " autocmd BufWinLeave *.* mkview

    " autocmd BufWinEnter *.* silent loadview
    au BufNewFile,BufReadPost *.md set filetype=markdown
    au BufNewFile,BufReadPost *.vue syntax sync fromstart

    " autocmd FileType javascript set formatprg=prettier\ --stdin
    "autocmd BufLeave,FocusLost * silent! wall
    autocmd filetype crontab setlocal nobackup nowritebackup

  augroup END
endif


" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
"                      MAPPINGS
" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =

let g:mapleader=' '  " Definir espacio como la tecla líder

" save with control + s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i

" Reload vims configuration file
map <leader>vs :source $MYVIMRC<CR>
"Vimrc configuration
map <leader>vv :vsp $MYVIMRC<CR>
map <leader>vj :vsp ~/.config/nvim/UltiSnips/javascript.snippets<CR>

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>


" buffer move tab
"nnoremap <C-K>: bnext <CR>
"nnoremap <C-M>: bprev <CR>

" Moverse al buffer siguiente con < líder > + l
nnoremap <leader><Right> :bnext<CR>
" nnoremap <leader>l :bnext<CR>

" Moverse al buffer anterior con < líder > + j
nnoremap <leader><Left> :bprevious<CR>
" nnoremap <leader>j :bprevious<CR>

" Cerrar el buffer actual con < líder > + q
nnoremap <leader>q :bdelete<CR>

 "Guardar con < líder > + s
nnoremap <leader>s :w <CR>

" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Usar <líder> + p para pegar desde el portapapeles
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

nnoremap <C-Up> : move-2<CR>
nnoremap <C-DOWN> : move+1<CR>

vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-DOWN> :m '>+1<CR>gv=gv

inoremap <C-UP> <Esc>:m .-2<CR>==gi
inoremap <C-DOWN> <Esc>:m .+1<CR>==gi

" Change word
nnoremap <leader>w ciw
nnoremap <leader>* *Nciw
" resalta la linea palabra
nnoremap <leader>n n.
" remplace el text in selection
nnoremap <leader>r yiw:%s/\<<C-r>"\>//g<left><left>
" disable hl
nnoremap <Leader><Enter> :nohl  <CR>

"Insert \n
nnoremap <Enter> i<CR><Esc>
" Delete line
nnoremap <Del> dd


"nnoremap <silent> <space> :nohl<Bar>:echo<CR>
" duplicate line
nnoremap <leader>e mzyyp`zj
"nnoremap <leader>v :set invpaste paste?<CR>
"nnoremap <leader>V V`]
"nnoremap <leader>I V`]=
" select all
nnoremap <leader>a ggVG
"nnoremap <leader>r :syntax sync fromstart<CR>
"nmap k gk
"nmap j gj

" tabulaciones
vnoremap > >gv
vnoremap < <gv

nnoremap gp :silent %!prettier --trailing-comma none --parser babel --stdin-filepath %<CR>


"================================
" Load Config Plugin
"================================
"
" load config coc
source ~/.config/nvim/configPlugin/coc.vim

" visual-multi
source ~/.config/nvim/configPlugin/vim-visual-multi.vim

" Ale linter
source ~/.config/nvim/configPlugin/ale.vim

" Prettier
"source ~/.config/nvim/configPlugin/prettier.vim

" NERDTree
source ~/.config/nvim/configPlugin/nerdtree.vim

" Lightline
let g:lightline = { 'colorscheme': 'material_vim' }

" Easymotion
nmap S <Plug>(easymotion-s2)
nmap s <Plug>(easymotion-s)

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Vue
" let g:vue_disable_pre_processors=1

" Markdown
let g:markdown_fenced_languages=['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" JSX
let g:jsx_ext_required=0
let g:javascript_enable_domhtmlcss=1
let g:used_javascript_libs='underscore,react'

" Emmet
" let g:user_emmet_settings={'javascript': {'extends': 'jsx'}}
let g:user_emmet_leader_key='<C-t>'
let g:user_emmet_install_global=0
autocmd FileType html,css,jsx,javascript EmmetInstall

" Tag Autoclose
let g:closetag_filenames='*.html,*.xhtml,*.phtml,*.vue,*.js'

" Layout switcher
let g:XkbSwitchLib='/usr/local/lib/libInputSourceSwitcher.dylib'
let g:XkbSwitchEnabled=1



" FZF
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>. :Buffers<CR>



" CONTROL+P
"let g:ctrlp_map='<c-p>'
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.git,*.hg,*.svn,*.DS_Store,._*,Thumbs.db,desktop.ini,.atom*,*.pyc,*_env
"let g:ctrlp_mruf_case_sensitive=0
let g:ctrlp_use_caching = 0



" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
"   APPEARENCE
" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =

"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

"colorscheme cobalt2

" set best es6 javascript
let g:material_terminal_italics = 1
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
let g:material_theme_style = 'palenight'
colorscheme material


let python_highlight_all=1
let python_self_cls_highlight=1
let python_no_operator_highlight=1
"let python_no_parameter_highlight=1

if has("gui_running")
  "set guifont=Operator\ Mono: h18
  set guifont=Input\ Mono: h18
  set linespace=6
  set guioptions -= r
  colorscheme material
  let g:material_theme_style='default' " 'palenight' | 'dark'
  let g:material_terminal_italics=1
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https: // github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


" Activa true colors en la terminal
if (has("termguicolors"))
  set termguicolors
endif


" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
"                      CUSTOM FUNCTIONS
" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =

" Create folders on file save
" == == == == == == == == == == == == == =

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" Remove whitespaces on save saving cursor position
" == == == == == == == == == == == == == == == == == == == == == == == == =

function! <SID>StripTrailingWhitespaces()
    let l=line(".")
    let c=col(".")
    %s /\s\+$//e
    call cursor(l, c)
endfun


" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
