call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:coc_global_extensions = [
			\ 'coc-css',
            \ 'coc-html',
			\ 'coc-sh',
			\ 'coc-markdownlint',
			\ 'coc-rust-analyzer'
			\ ]
call plug#end()

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" " utf-8 byte sequence
set encoding=utf-8
" " Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
"
" " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" " delays and poor user experience
set updatetime=300
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved
set signcolumn=yes

set number
set hlsearch
set splitbelow
set splitright

set expandtab    " Use spaces instead of tabs
set tabstop=4    " Number of spaces a tab in the file counts for
set shiftwidth=4 " Number of spaces to use for each step of (auto)indent

let mapleader = ","

" tab navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" scroll up and scroll down with mousewheel

" split navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" resize splits
noremap H <C-W>2<
noremap L <C-W>2>
noremap J <C-W>2-
noremap K <C-W>2+

" save
noremap <leader>s :wall<cr>
" save all
inoremap <C-s> <Esc>:w<cr>
noremap <C-s> :w<cr>
" exit
inoremap <C-q> <Esc>:q<cr>
noremap <C-q> :q<cr>

xnoremap <leader>c "+y
"xnoremap <leader>r <<D--v>

" Use tab for trigger completion with characters ahead and navigate
" " NOTE: There's always complete item selected by default, you may want to
" enable
" " no select by `"suggest.noselect": true` in your configuration file
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:seoul256_background = 233
colo seoul256

" Turns background transparent. Needs to come after colo
hi Normal guibg=NONE ctermbg=NONE

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> <C-9> :call CocAction('doHover')<CR>

" Documentation or diagnostics for Coc tools
" function! ShowDocIfNoDiagnostic(timer_id)
" 	if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
" 		silent call CocActionAsync('doHover')
" 	endif
" endfunction

" function! s:show_hover_doc()
" 	call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction
"
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

" FZF to find files
nmap <C-P> :Files<CR>

let g:rg_command = '
		\ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
		\ -g "*.{js,jsz,ts,tsx,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,rs,toml,sh,yaml,sql}"
		\ -g "!*.{min.js,swp,o,zip}" 
		\ -g "!{.git,node_modules,vendor,target,build,tmp,venv}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

