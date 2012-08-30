
" a must-have
set nocompatible
set autoindent
set autoread "auto re-read changed file
set showcmd "show partial commands as you type them
set scrolloff=10

" set bg=dark
set backspace=
" set expandtab

" JavaScript
" autocmd FileType javascript set shiftwidth=4
" autocmd FileType javascript set tabstop=4

autocmd FileType thrift set syn=cpp

set shiftwidth=4
set tabstop=4

" set list
set listchars=tab:»·,trail:·

" shift tabs using TAB or Shift+TAB
map <tab> v>
map <S-tab> v<

map <F2> <esc>:tabprev<cr>
map <F3> <esc>:tabnext<cr>
map <F4> <esc>:TlistToggle<cr>
:let Tlist_Ctags_Cmd='/usr/bin/ctags'

map <F5> <esc>:set nolist<cr>
map <F6> <esc>:set list<cr>
" map <F7> <esc>:set background=light<cr>
" map <F8> <esc>:set background=dark<cr>
map <F8> <esc>o$self->_debug(  );<esc>hhi

map <F9> <esc>:set noautoindent<cr>
map <F10> <esc>:set autoindent<cr>
map <F11> <esc>:tabnew 
map <F12> <esc>:set enc=cp1251<cr>:edit<cr>

" comment/uncomment blocks of code (in vmode)

" Perl
" vmap () :s/^/# /gi<Enter>
" vmap )( :s/^# \=//gi<Enter>

" C++
" vmap {} :s/^/\/\/ /gi<Enter>
" vmap }{ :s/^\/\/ //gi<Enter>

" SQL
" vmap <> :s/^/-- /gi<Enter>
" vmap >< :s/^-- \=//gi<Enter>

" spaces
" vmap <> :s/^/ /gi<Enter>
" vmap >< :s/^ \=//gi<Enter>



" Perl smart (Eclipse)
vmap () :s/^/#/gi<Enter>
vmap )( :s!^\(\s*\)# \=!\1!gi<Enter>


vmap {} :s!^\(\s*\)!\1\/\/ !gi<Enter>
vmap }{ :s!^\(\s*\)\/\/ \=!\1!gi<Enter>

vmap <> :s!^\(\s*\)!\1-- !gi<Enter>
vmap >< :s!^\(\s*\)-- \=!\1!gi<Enter>

" dont use Q for Ex mode
map Q :q
map :Q :q
map W :w
map :W :w
map D "_d
map DD "_dd
nmap ss :so ~/.vimrc<cr>

:set enc=utf8
" :set enc=cp1251
" :edit

highlight MatchParen ctermbg=242 ctermfg=228

:set t_Co=16
:highlight OverLength ctermbg=238
:highlight Visual ctermbg=242
:match OverLength /\%79v.\+/
:sy on

:hi Search ctermbg=240
" :set hlsearch

" trying to make light colorscheme a darker one
:hi Comment        ctermfg=33
:hi Statement      ctermfg=214
:hi PreProc        ctermfg=133
