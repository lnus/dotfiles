" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <Leader>bn :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
nnoremap <Leader>bp :bprevious<CR>
" Closes current buffer
nnoremap <Leader>bd :bd<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Go specific mapping
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
nmap <leader>r <Plug>(coc-rename)
nmap <leader>e <Plug>(coc-format)


" Vim related bindings
" Save file with leader w, faster
nnoremap <Leader>w :w!<CR>
" Resources the vimrc
map <Leader>vs :source $MYVIMRC<CR>
" Open vimrc in vertical tab
map <Leader>ve :e $MYVIMRC<CR>

map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFocus<CR>
map <Leader>, :noh<CR>

" fzf
map <Leader>ff :Files<CR>
map <Leader>fb :Buffer<CR>
map <Leader>ft :Tags<CR>
map <Leader>fg :GFiles<CR>
map <Leader>fc :Colors<CR>
map <Leader>fl :Lines<CR>
map <Leader>fk :BLines<CR>

" python specific bindings :)
" runs the currently opened buf. will only load in python bufs
autocmd BufEnter *.py nmap <leader>pr :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
