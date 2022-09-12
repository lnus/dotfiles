" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    "autocmd VimEnter * PlugInstall
    "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" File Explorer
Plug 'scrooloose/NERDTree'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" Go language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" stuff (should document this)
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/vim-which-key'
Plug 'whatyouhide/vim-gotham'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'mhinz/vim-startify'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Unity
Plug 'OmniSharp/omnisharp-vim' 

" LaTeX
Plug 'lervag/vimtex' 

call plug#end()
