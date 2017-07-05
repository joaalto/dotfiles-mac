let g:airline#extensions#bufferline#overwrite_variables = 0
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My bundles here:
"
" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fireplace'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Chiel92/vim-autoformat'
Plugin 'einars/js-beautify'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'marijnh/tern_for_vim'
Plugin 'wincent/Command-T'
Plugin 'derekwyatt/vim-scala'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'hydrozen/solarized', {'rtp': 'vim-colors-solarized'}
Plugin 'ElmCast/elm-vim'
"Plugin 'lambdatoast/elm.vim'

filetype plugin indent on

syntax on
syntax enable

" Use 16 colors to enable solarized
set t_Co=16

"colorscheme zenesque
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

"set foldcolumn=2
"highlight! link FoldColumn Normal
"set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Use smart case in searches
set ignorecase
set smartcase

set shell=zsh

let mapleader = "-"

nnoremap <Leader>n :bn<cr>
nnoremap <Leader>p :bp<cr>
nnoremap <Leader>bw :bw<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader>x :x<cr>
nnoremap <Leader>xa :xa<cr>
nnoremap <Leader>wq :wq<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>qa :qa<cr>
nnoremap <Leader>wqa :wqa<cr>
nnoremap <F3> :set number<cr>
nnoremap <F4> :set nonumber<cr>
nnoremap <F2> :Autoformat<cr> 

" Don't need these with unimpaired
"nnoremap <Leader><s-cr> O<Esc
"nnoremap <Leader><CR> o<Esc> k

" Reload .vimrc automatically
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

set timeoutlen=500
set autoread
au CursorHold * checktime

" Show current file path
set statusline=%F
set laststatus=2

set number
set noro

set diffopt=filler,vertical

" autoread and autowrite
augroup save
  au!
  au InsertLeave * wall
augroup END
set nohidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set autowrite
set autowriteall


" persistent-undo
set undodir=~/.vim/undo
set undofile

noremap <leader>r :silent w !sonic_pi<CR>
noremap <leader>S :call system("sonic_pi stop")<CR>
