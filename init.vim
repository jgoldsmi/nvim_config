" Always use brew pythons
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

filetype off
set nocp

"==============================================================================
" Plug Setup
"==============================================================================
set runtimepath+=/Users/jonathan/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/jonathan/.config/nvim/dein')
  call dein#begin('/Users/jonathan/.config/nvim/dein')

  " Let dein manage dein
  call dein#add('/Users/jonathan/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
" Navigation
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')
  call dein#add('justinmk/vim-dirvish')
  call dein#add('dyng/ctrlsf.vim')
  call dein#add('tpope/vim-eunuch')
  " Editing
  call dein#add('tpope/vim-fugitive')
  call dein#add('jreybert/vimagit')
  call dein#add('matze/vim-move')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('justinmk/vim-sneak')
  call dein#add('Valloric/MatchTagAlways')
  call dein#add('mbbill/undotree')
  call dein#add('kana/vim-fakeclip')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('mileszs/ack.vim')
  " Text objects
  call dein#add('terryma/vim-expand-region')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-entire') " ae, ie
  call dein#add('kana/vim-textobj-lastpat') " a/, i/, a?, i?
  call dein#add('kana/vim-textobj-line') " al, il
  call dein#add('kana/vim-textobj-indent') " ai, ii, aI, iI
  call dein#add('lucapette/vim-textobj-underscore') " a_, i_
  call dein#add('sgur/vim-textobj-parameter') " a, , i,
  " Display
  call dein#add('mhinz/vim-startify')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('junegunn/vim-peekaboo')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('majutsushi/tagbar')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('mhinz/vim-signify')
  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('roman/golden-ratio')
  " Completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('carlitux/deoplete-ternjs', { 'build': 'npm install -g tern' })
  " Programming
  call dein#add('benekastah/neomake')
  call dein#add('editorconfig/editorconfig-vim')
  " Programming Languages
  call dein#add('vim-python/python-syntax', { 'on_ft': 'python' })
  call dein#add('hynek/vim-python-pep8-indent', { 'on_ft': 'python' })
  call dein#add('davidhalter/jedi-vim', { 'on_ft': 'python' })
  call dein#add('elzr/vim-json')
  call dein#add('lepture/vim-jinja')
  call dein#add('mxw/vim-jsx')
  call dein#add('isRuslan/vim-es6')
  call dein#add('tpope/vim-markdown', { 'on_ft': 'markdown' })

  call dein#end()
  call dein#save_state()
endif

syntax on
filetype plugin indent on

"==============================================================================
" Builtin Settings
"==============================================================================
set backup backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/tmp
set omnifunc=syntaxcomplete#Complete
set relativenumber
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
set clipboard=unnamed
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
" Startify settings
"==============================================================================
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

"==============================================================================
" Neomake settings
"==============================================================================
autocmd! BufWritePost,BufEnter * Neomake
augroup my_neomake_highlights
    au!
    autocmd ColorScheme *
                \ hi link NeomakeError SpellBad |
                \ hi link NeomakeWarning SpellCap
augroup END
colorscheme hybrid

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

"==============================================================================
" vim-sneak settings
"==============================================================================
let g:sneak#label = 1
let g:sneak#target_labels = "arstdhneioqwfpgjluy;zxcvbkm/ARSTDHNEIOQWFPGJLUY:ZXCVBKM>"

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
" vim-move settings
"==============================================================================
let g:move_key_modifier = 'C'


" Use ag if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

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
