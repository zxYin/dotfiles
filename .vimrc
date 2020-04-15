set nocompatible
set bs=2

" Python
if has('nvim')
  let g:python3_host_prog = "/Users/yinzixin/opt/anaconda3/bin/python"
  let g:python_host_prog = "/usr/bin/python"
endif

call plug#begin('~/.vim/plugged')
  " UI
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'wincent/terminus'
  Plug 'terryma/vim-smooth-scroll'
  " Tools
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'voldikss/vim-floaterm'
  " File
  Plug 'ryanoasis/vim-devicons'
  Plug 'majutsushi/tagbar'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Comment
  Plug 'preservim/nerdcommenter'
  " Complition
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'skywind3000/gutentags_plus'
  " C++
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'puremourning/vimspector'
  " Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
  " TypeScript
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Shougo/vimproc.vim', { 'build': 'make -f make_mac.mak' }
call plug#end()

" Performance
set hidden
set nobackup
set nowritebackup
set noswapfile
set updatetime=100

" Search
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case
                    " case-sensitive otherwise
augroup ClearSearch " auto clear highlight
  autocmd!
  autocmd InsertEnter * let @/ = ''
augroup END

" Clipboard
set clipboard+=unnamedplus

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
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
set shortmess+=c             " don't pass messages to ins-completion-menu
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
set showcmd

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
highlight CursorLineNr guifg=#a7e004 gui=bold guibg=bg
if has('nvim')
  highlight SignColumn guibg=bg
  highlight LineNr guibg=bg guifg=#75715f
  " highlight TabLineFill guifg=bg
  " highlight TabLineSel gui=bold guifg=#75715f guibg=#2D2E27
  " highlight TabLine guifg=bg guibg=#75715f
  highlight StatusLineNC guifg=#2D2E27 guibg=#75715f
  highlight StatusLine guifg=#2D2E27 guibg=#75715f
  highlight Error guifg=white guibg=#F92772
  " highlight VertSplit guifg=bg guibg=bg
endif

" Git Color
highlight DiffDelete guibg=bg guifg=#F97CA9
highlight DiffAdd guibg=bg guifg=#BEE275
highlight DiffChange guibg=bg guifg=#96E1EF
highlight DiffText guibg=bg guifg=#CEB2FF
autocmd FileType json syntax match Comment +\/\/.\+$+

" Font
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

" Smooth Scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 1)<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nmap <c-p> :FZF<CR>
let g:fzf_colors = {
    \ 'border': ['border', '#272822'],
    \ 'bg+': ['bg+', '#272822'],
    \ 'fg': ['fg', 'Comment'] }

" floaterm
let g:floaterm_wintitle = v:false
let g:floaterm_height = 0.7
let g:floaterm_width = 0.7
let g:floaterm_keymap_toggle = '<Leader>fn'

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

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

" file explorer
nnoremap <silent>- :CocCommand explorer --toggle --sources=buffer-,file+<CR>
highlight CocExplorerFileDirectory guifg=#999999
highlight CocExplorerFileDirectoryCollapsed guifg=#999999

" Dev icon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsDefaultFolderOpenSymbol = '-'
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Markdown-preview
nnoremap <c-m> :MarkdownPreview<CR>

" Airline
let g:airline#extensions#ale#enabled          = 1
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#formatter    = 'unique_tail_improved'
let g:airline#extensions#bufferline#enabled   = 1
let g:airline#extensions#gutentags#enabled    = 1
let g:airline_theme                           = 'superdark'
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_left_alt_sep                    = ' '

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

" Coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

highlight CocErrorLine guibg=#382b23
highlight CocWarningLine guibg=#3c3923
highlight CocErrorFloat guifg=#F92772
highlight CocWarningFloat guifg=#E6DB74
" highlight CocErrorHighlight cterm=None gui=None ctermfg=None guifg=None
" highlight CocWarningHighlight cterm=None gui=None ctermfg=None guifg=None

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Coc snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
