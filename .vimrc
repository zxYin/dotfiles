" =====================================================================
" URL: https://github.com/zxYin/dotfiles
" Filename: .vimrc
" Author: zxYin
" Email: yinzxpersonal@gmail.com
" License: MIT License
" =====================================================================

" Plugs: {{{
set nocompatible

call plug#begin('~/.vim/plugged')
  " UI
  Plug 'vim-airline/vim-airline'
  Plug 'wincent/terminus'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'sainnhe/gruvbox-material'
  " Tools
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'triglav/vim-visual-increment'
  Plug 'takac/vim-hardtime'
  " File
  Plug 'ryanoasis/vim-devicons'
  " Comment
  Plug 'preservim/nerdcommenter'
  " Complition
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " C++
  Plug 'puremourning/vimspector'
  Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'bfrg/vim-cpp-modern'
  " Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
  " Go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
" }}}
" Settings: {{{
" Performance: {{{
set hidden
set nobackup
set nowritebackup
set noswapfile
set updatetime=100
set bs=2
set ma
" }}}
" Python: {{{
let g:python3_host_prog = "/Users/yinzixin/opt/anaconda3/bin/python"
let g:python_host_prog = "/usr/bin/python"
" }}}
" Search: {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case

augroup ClearSearch " auto clear highlight
  autocmd!
  autocmd InsertEnter * let @/ = ''
augroup END
" }}}
" Tools: {{{
set clipboard+=unnamedplus
set nrformats=alpha
" }}}
" Spaces & Tabs: {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent
set smartindent
set cindent
set shiftround     " Use multiple of shiftwidth when indenting with > and <
" }}}
" UI Config: {{{
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
" set fillchars=vert:\ ,eob:\            " remove ~ at endBuffer
set fillchars=eob:\            " remove ~ at endBuffer
let g:golden_ratio_autocommand = 0 " dont resize automatically
" set noruler
" set statusline=\
" set laststatus=0
set showcmd
" }}}
" Window remap: {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}
" Color: {{{
syntax on
set t_Co=256
set termguicolors

set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

highlight CursorLineNr guifg=#A9B665 gui=bold guibg=none
highlight SignColumn guibg=none
highlight Normal guibg=none
highlight NonText guibg=none
highlight VertSplit guifg=#46413E

autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}
" Clear Space Ending: {{{
" set lcs+=space:·
" set list
" hi Whitespace guifg=#464741
autocmd BufWinLeave * call clearmatches() " for performance

func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc
" auto delete useless spaces
au BufWrite * :call DeleteTrailingWS()
" }}}
" }}}
" Plugs Settings: {{{
" HardTime: {{{
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]
let g:list_of_insert_keys = []
"}}}
" Smooth Scroll: {{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 4, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 4, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 1)<CR>
" }}}
" Git Color: {{{
highlight RedSign guibg=none
highlight GreenSign guibg=none
highlight BlueSign guibg=none
highlight PurpleSign guibg=none
highlight YellowSign guibg=none
highlight OrangeSign guibg=none
highlight AquaSign guibg=none
" }}}
" Go: {{{
let g:go_def_mapping_enabled = 0
" }}}
" Easy Align: {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" asynctasks & asyncrun" {{{
noremap <silent><F1> :AsyncTask file-build<CR>
noremap <silent><F2> :AsyncTask file-run<CR>
let g:asyncrun_open = 6
let g:asynctasks_term_pos = "bottom"
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
" }}}
" fzf: {{{
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nmap <c-p> :FZF<CR>
let g:fzf_colors = {
    \ 'border': ['border', '#32302F'],
    \ 'bg+': ['bg+', '#32302F'],
    \ 'info': ['info', '#CBB795'],
    \ 'fg': ['fg', 'Comment'] }
" }}}
" vim-cpp-modern: {{{
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1
" }}}
" nerdcommenter: {{{
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
nmap <silent><c-_> <leader>c<space>
vmap <silent><c-_> <leader>c<space>
" }}}
" file explorer: {{{
nnoremap <silent>- :CocCommand explorer --toggle --sources=buffer-,file+<CR>
" }}}
" Airline: {{{
function! Coc_get_error_warning()
  let errorMes = airline#extensions#coc#get_error()
  let warningMes = airline#extensions#coc#get_warning()
  if errorMes != '' && warningMes != ''
    return " ".errorMes."  ".warningMes." "
  elseif errorMes != ''
    return " ".errorMes." "
  elseif warningMes != ''
    return " ".warningMes." "
  else
    return ''
  endif
endfunction

let g:airline_extensions = ["tabline"]
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}
  \%#__restore__#%4l:%2c'
" let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}
"   \%4l:%2c%#__restore__#  %{strftime("%H:%M")}'
let g:airline_section_b                            = '%{Coc_get_error_warning()}'
" let g:airline#parts#ffenc#skip_expected_string     = 'utf-8[unix]'
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#formatter         = 'unique_tail_improved'
let g:airline_theme                                = 'gruvbox_material'
let g:airline_highlighting_cache                   = 1
let g:airline#extensions#tabline#tabs_label        = ''
let g:airline#extensions#tabline#buffers_label     = '%{strftime("%H:%M")}'

let g:airline#extensions#tabline#show_close_button = 0

let g:airline_left_alt_sep                         = ' '
let g:airline#extensions#tabline#left_alt_sep      = ' '
" }}}
" Vimspector: {{{
" let g:vimspector_enable_mappings = 'HUMAN'
nmap <silent><F5> <Plug>VimspectorContinue
nmap <silent><F3> :VimspectorReset<CR>
nmap <silent><F4> <Plug>VimspectorRestart
nmap <silent><F6> <Plug>VimspectorPause
nmap <silent><F9> <Plug>VimspectorToggleBreakpoint
nmap <silent><F10> <Plug>VimspectorStepOver
nmap <silent><F11> <Plug>VimspectorStepInto
nmap <silent><F12> <Plug>VimspectorStepOut

highlight VimSpectorBreakPoint guifg=#EA6962
sign define vimspectorBP text=● texthl=VimSpectorBreakPoint
sign define vimspectorBPDisabled text=◯ texthl=VimSpectorBreakPoint
sign define vimspectorPC text=▶ texthl=CursorLineNr
" }}}
" Coc: {{{
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

highlight CocErrorLine guibg=#504031
highlight CocWarningLine guibg=#534E3D
highlight! link CocWarningSign None
highlight! link CocInfoSign None
highlight! link CocHintSign None
highlight! link CocErrorSign None

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
" }}}
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
