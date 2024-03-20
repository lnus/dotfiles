if empty(glob('~/.vim/autoload/plug.vim')) && !has("nvim")
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if empty(glob('~/.config/nvim/autoload/plug.vim')) && has("nvim")
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" File Explorer
Plug 'scrooloose/NERDTree'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'honza/vim-snippets'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" GitHub Copilot
Plug 'GitHub/copilot.vim'

" LaTeX
Plug 'lervag/vimtex' 

" stuff (should document this)
Plug 'easymotion/vim-easymotion'
Plug 'bluz71/vim-moonfly-colors'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'

call plug#end()
