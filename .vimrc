set nocompatible
set bs=2

" Python
if has('nvim')
  let g:python3_host_prog = "/Users/yinzixin/opt/anaconda3/bin/python"
  let g:python_host_prog = "/usr/bin/python"
endif

call plug#begin('~/.vim/plugged')
Plug 'wincent/terminus'
" Brackets Complete
Plug 'jiangmiao/auto-pairs'
" File
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
" Comment
Plug 'preservim/nerdcommenter'
" Complition
Plug 'Valloric/YouCompleteMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
" C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'puremourning/vimspector'
" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/vimproc.vim', { 'build': 'make -f make_mac.mak' }
" Git
Plug 'airblade/vim-gitgutter'
call plug#end()

" Performance
set hidden
set nobackup
set nowritebackup
set noswapfile
set updatetime=10

" Search
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case
                    " case-sensitive otherwise

" Clipboard
set clipboard+=unnamedplus

" Spaces & Tabs
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent
set shiftround     " Use multiple of shiftwidth when indenting with > and <

" UI Config
set number                   " show line number
set relativenumber           " show relative line number
set cursorline               " highlight current line
set wildmenu                 " visual autocomplete for command menu
set laststatus=2             " window will always have a status line
set colorcolumn=81           " set guide line
set linebreak                " set line break
set breakindent              " get same indent as before
set numberwidth=5            " make the line number column wider
set signcolumn=yes           " always show signcolumns
set scrolloff=6              " Keep 10 lines above/below cursor
set noshowmode               " remove status line
set fillchars=vert:\ ,eob:\            " remove ~ at endBuffer
let g:golden_ratio_autocommand = 0 " dont resize automatically
" set noruler
" set statusline=\
" set laststatus=0
" set noshowcmd

" Window remap
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
colorscheme monokai
set termguicolors
set t_Co=256
highlight CursorLineNr guifg=#a7e004
if has('nvim')
  highlight SignColumn guibg=bg
  highlight LineNr guibg=bg guifg=#75715f
  highlight TabLineFill guifg=bg
  highlight StatusLineNC guifg=#2D2E27 guibg=#75715f
  highlight StatusLine guifg=#2D2E27 guibg=#75715f
  " highlight VertSplit guifg=bg guibg=bg
endif

" Font
" set guifont=Monaco:h14
set guifont=Monaco:h14

" Ending Spaces
highlight ExtraWhitespace ctermbg=white guibg=#75715f
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches() " for performance

func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc
" auto delete useless spaces
au BufWrite * :call DeleteTrailingWS()
map <leader>W :call DeleteTrailingWS()<CR>
" delete spaces in empty line
map <F3> :%s/\s*$//g<CR>:noh<CR>''<CR>

" auto-pairs
" enter coflicts with ycm completion
let g:AutoPairsMapCR = 0
inoremap {<CR> {<CR>}<ESC>O

"" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

" git gutter
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 1
highlight GitGutterDelete guifg=#F97CA9
highlight GitGutterAdd    guifg=#BEE275
highlight GitGutterChange guifg=#96E1EF

" ycm
let g:ycm_use_clang=1
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = "/usr/local/bin/python3"
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
nnoremap <leader>gt :YcmCompleter GoTo<CR>
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_error_symbol='\ '
let g:ycm_warning_symbol='\ '
highlight YcmErrorLine guibg=#382b23
highlight YcmWarningLine guibg=#3c3923
if has('nvim')
  highlight YcmErrorSign guibg=gb guifg=#f92772
  highlight YcmWarningSign guibg=bg guifg=#e6db74
endif

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
nmap <silent>// <leader>c<space>
vmap <silent>// <leader>c<space>

" NerdTree
nnoremap <silent>- :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let loaded_netrwPlugin = 1
let NERDTreeStatusline = ""

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '+'
let g:DevIconsDefaultFolderOpenSymbol = '-'
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" change cwd color
highlight NERDTreeCWD guifg=#E6DB74
" change + and - color
highlight NERDTreeFlags guifg=#75715E
" change all files color to gray
highlight NERDTreeDir guifg=#E8E8E8
highlight NERDTreeUp guifg=#E8E8E8
highlight NERDTreePart guifg=#E8E8E8
highlight NERDTreeExecFile guifg=#E8E8E8
highlight NERDTreeFile guifg=#E8E8E8
highlight NERDTreeIgnore guifg=#E8E8E8
highlight NERDTreeBookmark guifg=#E8E8E8
highlight NERDTreeLink guifg=#E8E8E8
highlight hideBracketsInNerdTree guifg=#E8E8E8
highlight NERDTreeNodeDelimiters guifg=#E8E8E8

" gutentags
noremap <leader>tb :TagbarToggle<CR>
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
" generate datebases in cache directory, prevent gtags files polluting my project
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" if cache/tags file doesn't exist, create it
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_plus_nomap = 1

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
