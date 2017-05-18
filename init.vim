" Always use brew pythons
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

filetype off
set nocp

"==============================================================================
" Plug Setup
"==============================================================================

" Load vim-plug for first time
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" TODO Sort these
call plug#begin("~/.config/nvim/plugged")
" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-eunuch'
" Editing
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'matze/vim-move'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-sneak'
Plug 'Valloric/MatchTagAlways'
Plug 'mbbill/undotree'
Plug 'kana/vim-fakeclip'
Plug 'haya14busa/incsearch.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'terryma/vim-multiple-cursors'
" Text objects
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' " ae, ie
Plug 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
Plug 'kana/vim-textobj-line' " al, il
Plug 'kana/vim-textobj-indent' " ai, ii, aI, iI
Plug 'lucapette/vim-textobj-underscore' " a_, i_
Plug 'sgur/vim-textobj-parameter' " a, , i,
" Display
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-peekaboo'
Plug 'bronson/vim-trailing-whitespace'
Plug 'majutsushi/tagbar'
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Yggdroot/indentLine'
Plug 'roman/golden-ratio'
" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Programming
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
" Programming Languages
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
Plug 'elzr/vim-json'
Plug 'lepture/vim-jinja'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

call plug#end()

syntax on
filetype plugin indent on

"==============================================================================
" Builtin Settings
"==============================================================================
set backup backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/tmp
set omnifunc=syntaxcomplete#Complete
set number
set autoread
set expandtab smarttab
set shiftwidth=4 tabstop=8 softtabstop=4
set shiftround
set hidden
set incsearch
set hlsearch
set ignorecase
set magic
set ruler
set formatoptions+=j
set smartcase
set notildeop
set lazyredraw
set laststatus=2
set nostartofline
set nofoldenable
set history=10000
set backspace=eol,indent,start
set mouse=a
set shortmess+=I
set noshowmode
set showmatch matchtime=5
set showcmd
set printoptions=number:y,paper:letter
set tags=./tags;
set scrolloff=5
set wrap
set vb t_vb=
set t_Co=256
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid
set listchars=eol:¬,tab:→\ ,trail:·,extends:»,precedes:«
set list
set cursorline
" set completeopt=menuone,longest,preview
set completeopt=menuone,longest
set title
set wildmenu
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* "VCS directories
set wildignore+=*.pyc
set wildignore+=*.so,*.swp,*.pdf,*.dmg,*DS_Store*
au BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
            \     exe "normal! g`\"" |
            \ endif

if has("persistent_undo")
    set undodir=~/.vim/tmp undofile
endif

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"==============================================================================
" Deoplete settings
"==============================================================================
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

"==============================================================================
" Airline settings
"==============================================================================
let g:airline_theme = 'hybrid'
let g:airline#extensions#tabline#enabled = 1


"==============================================================================
" Javascript settings
"==============================================================================

"==============================================================================
" FZF settings
"==============================================================================
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
let $FZF_DEFAULT_COMMAND = 'ag -l'
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \                 <bang>0)

"==============================================================================
" vim-sneak settings
"==============================================================================
" let g:sneak#label = 1
" let g:sneak#target_labels = "arstdhneioqwfpgjluy;zxcvbkm/ARSTDHNEIOQWFPGJLUY:ZXCVBKM>"

"==============================================================================
" Python settings
"==============================================================================
let python_highlight_all = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#usages_command = "<leader>u"
let g:jedi#goto_command = "<leader>d"
let g:jedi#completions_enabled = 0
let g:jedi#force_py_version = 3
let g:jedi#show_call_signatures_delay = 0

"==============================================================================
" Golden-Ratio settings
"==============================================================================
let g:golden_ratio_exclude_nonmodifiable = 1

"==============================================================================
" vim-move settings
"==============================================================================
let g:move_key_modifier = 'C'

"==============================================================================
" Custom mappings
"==============================================================================
" Use space as leader everywhere
let mapleader        = " "
let g:mapleader      = " "
let maplocalleader   = " "
let g:maplocalleader = " "

"==============================================================================
" Normal Mode Mappings
"==============================================================================
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bd :lclose<CR>:bd<CR>
nnoremap <leader>bt :BTags<CR>
"CtrlP Bindings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fm :History<CR>
nmap ga <Plug>(EasyAlign)
" Fugitive bindings
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gg :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>sl :BLines<CR>
nnoremap <leader>sp :CtrlSF 
nnoremap <leader>sP :CtrlSF<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>* :CtrlSF <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>/ :Ag<CR>
noremap <silent> <C-l> :nohls<CR><C-l>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"==============================================================================
" Visual Mode Mappings
"==============================================================================
vmap <Enter> <Plug>(EasyAlign)

" TODO: replace with plugin
"  In visual mode when you press * or # to search for the current selection
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" Keep selection selected when indenting
vnoremap > >gv
vnoremap < <gv

"==============================================================================
" Insert Mode Mappings
"==============================================================================
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"==============================================================================
" Command Mode Mappings
"==============================================================================
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
