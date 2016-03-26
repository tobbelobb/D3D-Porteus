set nocompatible " Disable vi-compatibility
set backspace=2
filetype plugin on
filetype indent on
set encoding=utf-8

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set scrolloff=1
set incsearch
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set nu
set undofile
set ignorecase
set smartcase
set gdefault
syntax on
set wrap
set textwidth=170
set formatoptions=qrn1
"set colorcolumn=85
set laststatus=2 " Always show the statusline
set autochdir
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" color torte
" color vividchalk
color peachpuff
nmap ø :
vmap ø :
"cmap ø <Esc>
imap øø <Esc>
nmap Ø :w<Esc>
nmap ö :
vmap ö :
imap öö <Esc>
"cmap ö <Esc>
nmap Ö :w<Esc>
nmap ä :
vmap ä :
"cmap ä <Esc>
inoremap ää <right><Esc>
nmap Ä :w<Esc>
nmap æ :
vmap æ :
"cmap æ <Esc>
inoremap ææ <right><Esc>
nmap Æ :w<Esc>
inoremap ø- <right><Return>
inoremap ö- <right><Return>
set winaltkeys=no
set clipboard=unnamedplus
set notitle
" λ lambda
inoremap <C-l> <C-v>u3bb<Space>
let g:clang_library_path="/usr/lib/llvm-3.5/lib"
" Shift-j/k inserts blank line below/above
nnoremap <S-k> m`O<esc>``
nnoremap <S-j> m`o<esc>``
"inoremap <S-j> <esc>m`o<esc>``a
"inoremap <S-k> <esc>m`O<esc>``a
" page up, page down...
nnoremap <C-k> <C-b>
nnoremap <C-j> <C-f>
" Vsplit ordnung
set splitright
"Spellchecking
"set spell
"setlocal spelllang=en
"setlocal spelllang=nb
setlocal spelllang=sv
" lisp stuff
let g:lisp_rainbow=1
" The command to start swank. Helping slimv a bit
let g:slimv_swank_cmd = '! xterm -e sbcl --load /home/torbjorn/.vim/slime/start-swank.lisp &'
" Other possible swanks
" let g:slimv_swank_cmd = '! xterm -e sbcl --load  /usr/share/common-lisp/source/slime/start-swank.lisp &'
" let g:slimv_swank_cmd = '! xterm -e sbcl --load  /home/torbjorn/quicklisp/dists/quicklisp/software/slime-20131211-cvs/start-swank.lisp &'
let paredit_mode=0
" A little larger blocks is faster when lots of data is sent, and not very slow otherwise
let g:swank_block_size = 65536
" Don't want to eval on every <Cr> in REPL
let g:slimv_repl_simple_eval=0
" Don't echo lines!
let g:slimv_echolines=0
" Jump to the last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal g'\"" | endif
endif
" Try a little bit harder to get highlighting of multiline comments and
" strings right...
" syntax sync minlines=500
" Try even harder to get highlightning right...
autocmd BufEnter * :syntax sync fromstart
" Autoreload this file on save...
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" Save folds and restore when file is re-opened
au BufWinLeave * mkview
au BufWinEnter * silent loadview
" Base html-indenting on <p> as well...
let g:html_indent_inctags = "p"
" Don't indent on &! Never!
setlocal indentkeys-=\&
" Tab to next window. Ctrl-w means quit in Chrome
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

""""""""""""""" MESSING AROUND WITH DIRECTORIES """"""""""""""""""
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup
" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
""""""""""" DONE MESSING AROUND WITH DIRECTORIES """"""""""""

"autocmd BufReadPost,BufReadPost *.mod,*.dat set filetype=ampl

" Make Vim get Alt- keybindings even when invoked in terminal
" Think this breaks macros...
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
"set timeout ttimeoutlen=50

"Latex Indentation rules defined in /usr/share/vim/vim74/indent/tex.vim
" Make items in enumerate etc indent nicely
"let g:tex_indent_items = 0
" Don't jump on me everytime I write {
"let g:tex_indent_brace = 0
" Don't try do indent my columns
"let g:tex_indent_and = 0

" For quick Python compilation. I actually never use Python...
" map <F2> :w\|!python % <Return>

" Increase numbers by 0, 1, 2, ...
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
" Think Ascendning
vnoremap <C-a> :call Incr()<CR>

" Tab shortcut
inoremap <S-Tab> <C-V><Tab>

" Often type spit when I mean split. This autocorrects for me
cnoreabbrev spit split

" For hyphened lists
" - like
" - this
" The b stipulates that there must be a blank after the hyphen
set com=b:-

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Use colors to signify if we're in insert mode or nor
au InsertEnter * hi StatusLine ctermfg=Red
au InsertLeave * hi StatusLine ctermfg=Green
hi StatusLine ctermfg=Green
