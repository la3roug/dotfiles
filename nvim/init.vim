filetype plugin on
filetype indent off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'iCyMind/NeoSolarized'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'neomake/neomake'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cloudhead/neovim-fuzzy', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'simnalamburt/vim-mundo'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'AndrewRadev/tagalong.vim'
Plug 'metakirby5/codi.vim'
Plug 'tomlion/vim-solidity'

call plug#end()

set guifont=Ubuntu\ Mono\ derivative\ Powerline,\ Regular\ 16
set tabpagemax=100
set laststatus=2
set background=dark
set t_Co=256
colorscheme NeoSolarized
let g:solarized_termcolors=256
set cc=100
set showcmd
set incsearch
set number relativenumber
set cursorline
set cursorcolumn
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:¤·
set list
set showtabline=2
set autoindent
set wrap
set mouse=a
set termguicolors

let mapleader = "\<Space>"

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>& :tabp<CR>
nnoremap <leader>é :tabn<CR>
nnoremap <leader>² :tabnew<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
noremap <leader>l <C-w><
noremap <leader>k <C-W>-
noremap <leader>j <C-W>+
noremap <leader>h <C-w>>

" Maps All] to horizontal and vertical split respectively
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>

" Maps All] for moving next and previous window respectively
noremap <leader>n <C-w><C-w>
noremap <leader>p <C-w><S-w>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"call neomake#configure#automake('w')
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_open_list = 2

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nnoremap <C-p> :FuzzyOpen<CR>

let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1). '`]'

" UndoTree
nnoremap <leader>u :MundoToggle<CR>
" UndoTree persistence
set undofile
set undodir=~/.vim/undo

" Coc
set updatetime=300
let g:coc_global_extensions = [
\   'coc-tsserver',
\   'coc-eslint'
\]

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent><leader>ck :call CocActionAsync('doHover')<CR>
nmap <silent><leader>cn <Plug>(coc-diagnostic-next)
nmap <silent><leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent><leader>cd <Plug>(coc-definition)
nmap <silent><leader>cD <Plug>(coc-type-definition)
nmap <silent><leader>ci <Plug>(coc-implementation)
nmap <silent><leader>cr <Plug>(coc-rename)
nmap <silent><leader>cR <Plug>(coc-references)
nmap <leader>cq <Plug>(coc-fix-current)
nmap <leader>ca <Plug>(coc-codeaction)
autocmd FileType sass setl iskeyword+=@-@

" Floding
" set foldmethod=indent

" Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

" XXX fix storybook watch freeze at 95%
set backupcopy=yes

" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
