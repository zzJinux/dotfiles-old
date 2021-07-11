so ~/.vim/normalize.vim
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')

Plug 'plasticboy/vim-markdown'

" looking
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'myusuf3/numbers.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

" colorschemes
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

" editing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" formatting
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'

" command extension
Plug 'wellle/targets.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'

" utils
Plug 'kassio/neoterm'
Plug 'sjl/gundo.vim'
Plug 'chrisbra/NrrwRgn'

" files navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eugen0329/vim-esearch'

" language-specifics
" Plug 'mattn/emmet-vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

" file encodings and EOLs
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-kr,cp949,latin-1
set fileformat=unix
set fileformats=unix,dos,mac

" Some useful settings
set foldenable
set foldmethod=indent "folding by indent
set foldlevel=99
set ignorecase        "ignore the case when search texts
set smartcase         "if searching text contains uppercase case will not be ignored

" Lookings
set number           "line number
set cursorline       "highlight the line of the cursor
set cursorcolumn     "highlight the column of the cursor
set nowrap           "no line wrapping
set list
set listchars=tab:\|\ ,trail:-,nbsp:+


set exrc

let g:is_posix = 1 " Treat #!/bin/sh as POSIX-compliant
augroup indentation
  au FileType vim,yaml,sh,bash,zsh,markdown set expandtab sw=2
  au FileType go,cpp set ts=4 sw=0
augroup END

if !has('gui_running')

  let g:gruvbox_italic = 1
  colorscheme gruvbox

  if has('nvim')
    ;
  else
    if &term =~ 'xterm'

      " Enable italis
      let &t_ZH="\e[3m"
      let &t_ZR="\e[23m"

      augroup ResetCursorShape
        " Prevent the cursor from showing falsy style on resume
        au VimEnter * :normal! :startinsert :stopinsert
        au TabEnter * :normal! :startinsert :stopinsert
        au VimResume * :normal! :startinsert :stopinsert " not working on VimResume!
      augroup END
      let &t_SI="\e[5 q" "SI = INSERT mode
      let &t_SR="\e[4 q" "SR = REPLACE mode
      let &t_EI="\e[1 q" "EI = NORMAL mode (ELSE)
    endif

    if g:os == 'Darwin'
      let c='a'
      while c <= 'z'
        exec "set <M-".c.">=\e".c
        " exec "imap \e".c." <M-".c.">"
        let c = nr2char(1+char2nr(c))
      endw
    endif
  endif
endif



" change the color of chars over the width of 80 into blue
" (uncomment to enable it)
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"

" DEFAULT SHORTCUTS
"
" \\ => go to command mode
imap <leader><leader> <esc>:
" <c-h/j/k/l> => hjkl in normal mode (but there is a bug mapping <c-h>)
imap <c-h> <left>
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>
" \cl => redraw the screen
nmap <leader>l <c-l><c-l>
imap <leader>l <esc><leader>la

" <space> => fold/unfold current code
" tips: zR => unfold all; zM => fold all
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" \o => open current file by system apps (only available in osx)
nmap <leader>o :!open "%"<cr>
imap <leader>o <esc><leader>o

" ,, => escape to normal mode
imap ,, <Esc>
tmap ,, <Esc>

" <esc> => go back to normal mode (in terminal mode)
tnoremap <Esc> <C-\><C-n>

" use t{h,j,k,l} to switch between different windows
noremap tk <c-w>k
noremap tj <c-w>j
noremap th <c-w>h
noremap tl <c-w>l
nmap twj :resize +5<cr>
nmap twk :resize -5<cr>
nmap twh :vertical resize -5<cr>
nmap twl :vertical resize +5<cr>




" config.Startify
command! -nargs=1 -complete=file CD cd <args> | Startify
autocmd User Startified setlocal cursorline
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_lists = [
      \ { 'type': 'dir', 'header': ['   MRU within this dir:'] },
      \ { 'type': 'files', 'header': ['   MRU:'] },
      \ { 'type': 'sessions', 'header': ['   Sessions:'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks:'] },
      \ ]
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ 'plugged/.*/doc',
      \ '/data/repo/neovim/runtime/doc',
      \ 'init.vim',
      \ '.vimrc',
      \ '.gvimrc',
      \ 'nyaovimrc.html',
      \ ]
let g:startify_bookmarks = [
      \ { 'c': '~/.vimrc' },
      \ { 'g': '~/.gvimrc' },
      \ ]
let g:startify_custom_footer =
      \ ['', "   I like it!", '']
highlight StartifyFooter  ctermfg=240




" config.IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 239


" config.Numbers
nnoremap <F3> :NumbersToggle<CR>




" config.Vim-Airline
"
" t[number] => switch to the file showed in the top tabs
" t[ t] => prev tab/next tab
nmap t1 <Plug>AirlineSelectTab1
nmap t2 <Plug>AirlineSelectTab2
nmap t3 <Plug>AirlineSelectTab3
nmap t4 <Plug>AirlineSelectTab4
nmap t5 <Plug>AirlineSelectTab5
nmap t6 <Plug>AirlineSelectTab6
nmap t7 <Plug>AirlineSelectTab7
nmap t8 <Plug>AirlineSelectTab8
nmap t9 <Plug>AirlineSelectTab9
nmap t[ <Plug>AirlineSelectPrevTab
nmap t] <Plug>AirlineSelectNextTab

let g:airline_highlighting_cache = 1
let g:airline_extensions = []
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif




" config.EasyMotion
" go => go to anywhere
nmap go <Plug>(easymotion-jumptoanywhere)
" z + [fFtTwWbBeE(ge)(gE)jknNs] => easy motion
map zf <Leader><Leader>f
map zF <Leader><Leader>F
" map zt <Leader><Leader>t
map zT <Leader><Leader>T
map zw <Leader><Leader>w
map zW <Leader><Leader>W
" map zb <Leader><Leader>b
map zB <Leader><Leader>B
map ze <Leader><Leader>e
map zE <Leader><Leader>E
map zge <Leader><Leader>ge
map zgE <Leader><Leader>gE
map zj <Leader><Leader>j
map zk <Leader><Leader>k
map zn <Leader><Leader>n
map zN <Leader><Leader>N
map zs <Leader><Leader>s
xmap zA zm$<cr>A

hi EasyMotionTarget ctermfg=9 guifg=red
hi EasyMotionTarget2First ctermfg=9 guifg=red
hi EasyMotionTarget2Second ctermfg=9 guifg=lightred
hi link EasyMotionShade Comment




" config.EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)




" config.Sleuth
let b:sleuth_automatic = 0




" config.Neoterm
" <s-enter> => toggle the terminal
if exists('nyaovim_version')
  nnoremap <silent> <s-cr> :Ttoggle<cr>
else " in terminal use t<enter>
  nmap t<CR> :Ttoggle<CR>
endif
" tt => type the command for the terminal
nnoremap tt :T<space>
" te => send current line/selected lines to the terminal
nnoremap <silent> te :TREPLSend<CR>
xnoremap <silent> te :TREPLSend<CR>
" tE => send the thole current file to the terminal
nnoremap <silent> tE :TREPLSendFile<CR>
" \t => goto normal mode and press t (e.g. \t<enter> to toggle the terminal)
imap <leader>t <esc>t

let g:neoterm_size=20
" toogle the terminal
" kills the current job (send a <c-c>)
nnoremap <silent> tc :call neoterm#kill()<cr>




" config.Gundo
" tg => toogle the gundo
nnoremap tg :GundoToggle<CR>




" config.NrrwRgn
" zn => NrrwRgn in normal/visual mode
nmap zn :NR<CR>
xmap zn :NR<CR>




" config.NerdTree
" <F4> => popup the file tree navigation)
nmap <F4> :NERDTreeToggle<CR>




" config.ESearch
let g:esearch = {
      \ 'adapter':    'ack',
      \ 'backend':    'nvim',
      \ 'out':        'win',
      \ 'batch_size': 1000,
      \ 'use':        ['visual', 'hlsearch', 'last'],
      \}




" config.Emmet
let g:user_emmet_leader_key = ',z'





" Automatics
augroup myautocmds
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  au BufRead,BufNewFile,BufEnter \@!(term://)* cd %:p:h
  au FileType json set nocursorcolumn
augroup END
