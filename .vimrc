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
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'wincent/terminus'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'sainnhe/gruvbox-material'
  Plug 'ryanoasis/vim-devicons'
  " Tools
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'triglav/vim-visual-increment'
  Plug 'takac/vim-hardtime'
  Plug 'justinmk/vim-sneak'
  " Comment
  Plug 'preservim/nerdcommenter'
 " General
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'puremourning/vimspector'
  Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'
  " C++
  Plug 'bfrg/vim-cpp-modern'
  " Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
  " Go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
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
let tabsize=4
let &tabstop=tabsize       " numdiffChangedber of visual spaces per TAB
let &softtabstop=tabsize   " number of spaces in tab when editing
let &shiftwidth=tabsize    " number of spaces to use for autoindent
set expandtab              " tabs are space
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
set laststatus=2             " always show status line
set showtabline=2            " always show tab line
set shortmess+=c             " don't pass messages to ins-completion-menu
set colorcolumn=81           " set guide line
set linebreak                " set line break
set breakindent              " get same indent as before
set numberwidth=5            " make the line number column wider
set signcolumn=yes           " always show signcolumns
set scrolloff=6              " Keep 10 lines above/below cursor
set noshowmode               " remove mode
" set fillchars=vert:\ ,eob:\            " remove ~ at endBuffer
set fillchars=eob:\            " remove ~ at endBuffer
let g:golden_ratio_autocommand = 0 " dont resize automatically
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
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 0

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
" Sneak: {{{
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
let g:sneak#s_next = 1
let g:sneak#label = 1
let g:sneak#t_reset = 1
highlight! link SneakScope DiffText
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
" Lightline: {{{
let g:lightline = {
  \ 'colorscheme' : 'gruvbox_material',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'cocInfo' ],
  \     [ 'readonly', 'relativepath' ]
  \   ],
  \   'right': [
  \     [ 'indexinfo' ],
  \     [ 'fileencoding' ],
  \     [ 'filetype' ]
  \   ]
  \ },
  \ 'tabline': {
  \   'left': [ [ 'buffers'] ],
  \   'right': [ [ 'time' ] ]
  \ },
  \ 'inactive': {
  \   'right': [ [ 'indexinfo' ] ]
  \ },
  \ 'component_function': {
  \   'fileencoding': 'LightlineFileEncoding',
  \   'filetype': 'LightlineFiletype',
  \   'cocInfo': 'LightlineCocInfo'
  \ },
  \ 'component_expand': {'buffers': 'lightline#bufferline#buffers' },
  \ 'component_type': { 'buffers': 'tabsel' },
  \ 'component_raw': { 'buffers': 1 },
  \ 'component': {
  \   'indexinfo': '%3p%% ☰  %3l:%2c ',
  \   'time': '%{strftime("%H:%M")}'
  \ },
\ }

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#clickabl = 1
let g:lightline#bufferline#unnamed = '[No Name]'

function! LightlineFileEncoding()
  return ' '.(winwidth(0) > 70 ? &fileencoding.' ' : '').WebDevIconsGetFileFormatSymbol().' '
endfunction

function! LightlineFiletype()
  return (winwidth(0) > 70 ? &filetype.' ' : '').WebDevIconsGetFileTypeSymbol().' '
endfunction

function! CocGetInfo(type) abort
  let _backup = get(g:, 'coc_stl_format', '')
  let is_err = (a:type  is# 'error')

  let info = get(b:, 'coc_diagnostic_info', {})
  let cnt = get(info, a:type, 0)
  if empty(info) || empty(cnt) | return '' | endif

  if !empty(_backup)
    let g:coc_stl_format = _backup
  endif

  return (a:type  is# 'error' ? 'E:' : 'W:').cnt
endfunction

function! LightlineCocInfo()
  let errorMes = CocGetInfo('error')
  let warningMes = CocGetInfo('warning')

  let msg = ''
  if errorMes != ''
    let msg = msg.' '.errorMes.' '
  endif

  if warningMes != ''
    let msg = msg.' '.warningMes.' '
  endif
  return msg
endfunction
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

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

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
