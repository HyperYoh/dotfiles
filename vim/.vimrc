""""""""""""""""""""""""""""""""""""""""""""""""""
" Start!
""""""""""""""""""""""""""""""""""""""""""""""""""
"
" ~/.vimrc
"
" Description:
"   This is the .vimrc file
"
" Maintener:
"   HyperYoh
"
" Complete Version:
"   Complete Configuration
"   Including All Plugins
"   Are Other Place In Repo
"
" Acknowledgements:
"   WIP
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-sensible
"Plugin 'tpope/vim-sensible'

" https://github.com/takac/vim-hardtime
" Bundle 'takac/vim-hardtime'
"Plugin 'takac/vim-hardtime'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" runtime! plugin/sensible.vim
" runtime! plugin/hardtime.vim
" runtime! tabmerge.vim

""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Config
""""""""""""""""""""""""""""""""""""""""""""""""""

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Parameters
""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on    " required
syntax on

set encoding=utf-8 fileencodings=

" Real Tabs
autocmd Filetype make setlocal noexpandtab
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4

set list listchars=tab:»·,trail:·
set backspace=indent,eol,start

set hlsearch
set number
set relativenumber
set colorcolumn=80
set scrolloff=12

set showmatch
set showmode
set showcmd
set cursorline

set mouse=a

" Windows (GVim) Only
set clipboard=unnamed
set guifont=Lucida_Console:h12:cANSI:qDRAFT
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps
""""""""""""""""""""""""""""""""""""""""""""""""""

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Subtitue character befor cursor, to be consistent with X
nnoremap S Xi

" clipboard with Ctrl+c (Linux Only)
map <C-c> :w !xsel -i -b<CR><CR>

" Clang-Format (May fix path)
map <C-K> :pyf ~/afs/Tools/clang_format/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/afs/Tools/clang_format/clang-format.py<cr>

" toggle highlight search
noremap <F7> :set hlsearch!<cr>:set hlsearch?<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviate
""""""""""""""""""""""""""""""""""""""""""""""""""

ia mainx int main(int argc, char *argv[])<cr>{}<Left>
ia fori for (int i = 0; i < n; i++)<cr>{}<Left>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""

" Best Colorscheme
colorscheme pablo
" Special [char] in red
highlight Special ctermfg=9 guifg=#ff0000

""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""

" MoveToTab ~ TabMerge
function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    vert topleft split
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    vert topleft split
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

" execute "set <M-,>=\e,"
" nnoremap <A-,> :call MoveToPrevTab()<CR>
" execute "set <M-;>=\e;"
" nnoremap <A-;> :call MoveToNextTab()<CR>

nnoremap <C-P> :call MoveToPrevTab()<CR>
nnoremap <C-N> :call MoveToNextTab()<CR>

" DON't LEAVE THE FUCKING HOME RAW !
fun! HJKL()
    nnoremap <Left> :echo "No left for you!"<CR>
    vnoremap <Left> :<C-u>echo "No left for you!"<CR>
    inoremap <Left> <C-o>:echo "No left for you!"<CR>

    nnoremap <Right> :echo "No right for you!"<CR>
    vnoremap <Right> :<C-u>echo "No right for you!"<CR>
    inoremap <Right> <C-o>:echo "No right for you!"<CR>

    nnoremap <Up> :echo "No up for you!"<CR>
    vnoremap <Up> :<C-u>echo "No up for you!"<CR>
    inoremap <Up> <C-o>:echo "No up for you!"<CR>

    nnoremap <Down> :echo "No down for you!"<CR>
    vnoremap <Down> :<C-u>echo "No down for you!"<CR>
    inoremap <Down> <C-o>:echo "No down for you!"<CR>
endf

command! HJKL call HJKL()


" A Save Function
"function! Formatonsave()
"  let l:formatdiff = 1
"  pyf ~/llvm/tools/clang/tools/clang-format/clang-format.py
"endfunction
"autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Over.
""""""""""""""""""""""""""""""""""""""""""""""""""
