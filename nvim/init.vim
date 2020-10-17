filetype plugin on
filetype indent off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'iCyMind/NeoSolarized'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'neomake/neomake'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }
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
Plug 'w0rp/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

"Plug 'Shougo/deoplete.nvim'
"Plug 'mhartington/nvim-typescript'


call plug#end()
"let g:deoplete#enable_at_startup = 1

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
set number
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

" linter
let g:ale_linters = {
\   'typescript': ['tsserver', 'eslint'],
\   'javascript': ['eslint']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint']
\}
" let g:ale_sign_error = 'ERR'
" let g:ale_sign_warning = 'WAR'
" let g:neomake_javascript_enabled_makers = ['eslint']

"call neomake#configure#automake('w')
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_open_list = 2

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nnoremap <C-p> :FuzzyOpen<CR>

let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1). '`]'

" YouCompleteMe
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yR :YcmCompleter GoToReferences<CR>
nnoremap <leader>yr :YcmCompleter RefactorRename 
nnoremap <leader>yf :YcmCompleter FixIt<CR>

" UndoTree
nnoremap <leader>u :MundoToggle<CR>
" UndoTree persistence
set undofile
set undodir=~/.vim/undo
