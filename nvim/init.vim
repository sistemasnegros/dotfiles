call plug#begin()

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
"Plug 'Shougo/neocomplete.vim'

Plug 'prettier/vim-prettier', {'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}
Plug 'w0rp/ale'
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
"Plug 'junegunn/fzf'
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'gorkunov/smartpairs.vim'
Plug 'djoshea/vim-autoread'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-buftabline'

"Plug 'vim-python/python-syntax'
Plug 'kh3phr3n/python-syntax'

" Colour Themes
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'kaicataldo/material.vim'
"Plug 'dracula/vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'patstockwell/vim-monokai-tasty'

" Test Run
Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}

" Initialize plugin system
call plug#end()

" Determines filetype from name to allow intelligent auto-indenting, etc.
filetype plugin indent on

" Enable syntax highlighting
syntax on


"runtime macros/matchit.vim

" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
"                 GENERAL SETTINGS
" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =


set cursorline  " hihgli line current
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
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

set list "show ocultos .

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


" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
"                    AUTOCOMMANDS
" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =

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

    autocmd FileType javascript set formatprg=prettier\ --stdin
    "autocmd BufLeave,FocusLost * silent! wall
    autocmd filetype crontab setlocal nobackup nowritebackup

  augroup END
endif


" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
"                      MAPPINGS
" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =

let g:mapleader=' '  " Definir espacio como la tecla líder

" save with control + s
nnoremap <C-s> : w<CR>

" Reload vims configuration file
map <leader>vs :source $MYVIMRC<CR>
"Vimrc configuration
map <leader>vv :vsp $MYVIMRC<CR>

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>


" buffer move tab
"nnoremap <C-K>: bnext <CR>
"nnoremap <C-M>: bprev <CR>

" Moverse al buffer siguiente con < líder > + l
nnoremap <leader><Right>: bnext<CR>

" Moverse al buffer anterior con < líder > + j
nnoremap <leader><Left>: bprevious<CR>

" Cerrar el buffer actual con < líder > + q
nnoremap <leader>q: bdelete<CR>

 "Guardar con < líder > + s
nnoremap <leader>s: w<CR>

"Usar < líder > + y para copiar al portapapeles
vnoremap <leader>y "+ y
nnoremap <leader>y "+ y

" Usar < líder > + d para cortar al portapapeles
vnoremap <leader>d "+ d
nnoremap <leader>d "+ d

" Usar < líder > + p para pegar desde el portapapeles
nnoremap <leader>p "+ p
vnoremap <leader>p "+ p
nnoremap <leader>P "+ P
vnoremap <leader>P "+ P

"Vim move
let g:move_key_modifier='C'
"<C-k > Move current line/selections up
"<C-j > Move current line/selections down
nnoremap <C-Up>: move-2<CR>
nnoremap <C-DOWN>: move+1<CR>


let g:lexima_enable_basic_rules=1


" Use deoplete.
let g:python3_host_prog='/usr/local/bin/python3.7'
let g:deoplete#enable_at_startup=1


" NERDTree
"nnoremap <leader> q: NERDTreeToggle <CR>
nnoremap <C-B> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=0
let NERDTreeIgnore=['\.pyc$','\~$'] "ignore files in NERDTree
let NERDTreeShowHidden=1

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
" let g:user_emmet_settings={'javascript.jsx': {'extends': 'jsx'}}
" let g:user_emmet_leader_key='<C-t>'

" Tag Autoclose
let g:closetag_filenames='*.html,*.xhtml,*.phtml,*.vue'

" Layout switcher
let g:XkbSwitchLib='/usr/local/lib/libInputSourceSwitcher.dylib'
let g:XkbSwitchEnabled=1

" Prettier
nmap <Leader>p <Plug>(Prettier)
let g:prettier#exec_cmd_async=1
let g:prettier#config#print_width=80
let g:prettier#config#tab_width=2
let g:prettier#config#use_tabs='false'
let g:prettier#config#semi='true'
let g:prettier#config#single_quote='false'
let g:prettier#config#bracket_spacing='true'
let g:prettier#config#jsx_bracket_same_line='false'
let g:prettier#config#trailing_comma='none'
let g:prettier#config#parser='babylon'
let g:prettier#config#config_precedence='prefer-file'
let g:prettier#config#prose_wrap='preserve'
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Ale linter
let g:ale_set_highlights=0
"nmap <silent><Leader>nn<Plug>(ale_previous_wrap)
"nmap <silent><Leader>np<Plug>(ale_next_wrap)
let g:ale_linters={
\   'javascript': ['eslint'],
\   'ruby': [],
\}
let g:ale_sign_error='✘'
let g:ale_sign_warning='⚠'
" Check Python files with flake8 and pylint.
"let b:ale_linters=['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers={
\  "python":['autopep8'],
\}
" Disable warnings about trailing whitespace for Python files.
"let b:ale_warn_about_trailing_whitespace=0
"let g:ale_fix_on_save=1
"let g:ale_lint_on_enter=0
"let g:ale_lint_on_text_changed='never'
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow


" FZF
nnoremap <leader>f: GFiles<CR>
nnoremap <leader>t: Files<CR>
nnoremap <leader>.: Buffers<CR>

" CONTROL+P
let g:ctrlp_map='<c-p>'
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.git,*.hg,*.svn,*.DS_Store,._*,Thumbs.db,desktop.ini,.atom*,*.pyc,*_env
"let g:ctrlp_mruf_case_sensitive=0

" == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
"
"                      APPEARENCE
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

 func! Multiple_cursors_before()
      if deoplete#is_enabled()
        call deoplete#disable()
        let g:deoplete_is_enable_before_multi_cursors=1
      else
        let g:deoplete_is_enable_before_multi_cursors=0
      endif
    endfunc
    func! Multiple_cursors_after()
      if g:deoplete_is_enable_before_multi_cursors
        call deoplete#enable()
      endif
    endfunc

" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
