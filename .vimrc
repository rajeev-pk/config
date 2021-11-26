" Vim settings
syntax on
set noerrorbells
set visualbell
set nu
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=UTF-8
set numberwidth=5
set laststatus=2
set t_Co=256
let NERDTreeMapOpenInTab='<C-y>'

" Nerdtree settings
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'posva/vim-vue'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim' 
Plug 'nelsyeung/twig.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'dense-analysis/ale'

call plug#end()

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

augroup fileTypes
	au!
	autocmd BufNewFile,BufRead *.commands set syntax=bash
	autocmd BufNewFile,BufRead *.html.twig set tabstop=4 
	autocmd BufNewFile,BufRead *.twig set tabstop=4 
	autocmd BufNewFile,BufRead *.html set tabstop=4 
	autocmd BufNewFile,BufRead *.twig set filetype=html 
	autocmd BufNewFile,BufRead *.css set tabstop=4 
	autocmd BufNewFile,BufRead *.scss set tabstop=4 
	autocmd BufNewFile,BufRead *.php set tabstop=4 
	autocmd BufNewFile,BufRead *.js set tabstop=4 
	autocmd BufNewFile,BufRead *.ts set tabstop=4 
	autocmd BufNewFile,BufRead *.jsx set tabstop=4 
augroup END

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
