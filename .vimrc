" Auto load / install plugin manager

if !1 | finish | endif

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif


set laststatus=2
set t_Co=256
syntax on
filetype plugin indent on
syntax enable
"set background=dark


"""Custom tabulations
""Modify tab into space
"set expandtab 
"le tab vaut 2 espaces
set tabstop=2 
set shiftwidth=2

""" Affichage des tab via un pipe, IMPORTANT il y a un espace a la fin !
set list lcs=tab:\|\ 

"""hybride numero de ligne
:set number rnu

:set mouse=a

set cursorcolumn

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

          
" VimPlug 
call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-solarized8'

""" vim_current_word
Plug 'dominikduda/vim_current_word'

"""" Ctrl + p recherche fichier
Plug 'ctrlpvim/ctrlp.vim'

"""" completion via tab
Plug 'ervandew/supertab'

"""" lightline
Plug 'itchyny/lightline.vim'

Plug 'kien/rainbow_parentheses.vim'

Plug 'yorokobi/vim-splunk'


call plug#end()
" Required:
filetype plugin indent on


"""""'lifepillar/vim-solarized8'
set background=dark
colorscheme solarized8_flat
"""error : E185: Cannot find color scheme 'solarized'
""workaround : mkdir .vim/colors && cp .vim/plugged/vim-solarized8/colors/solarized8* .vim/colors/


""""""vim_current_word
"" lien couleurs : https://jonasjacek.github.io/colors/
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
"""" The word under cursor:
let g:vim_current_word#highlight_current_word = 1
let g:vim_current_word#highlight_delay = 0
"""Couleur du mot en cours
hi CurrentWord ctermbg=63
"""couleur de l occurence du mot dans le fichier
hi CurrentWordTwins ctermbg=239


"""""lightline
set laststatus=2
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ }  

:set cursorline
:hi CursorLine   cterm=NONE ctermbg=31 ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred
"guifg=white

"""""RainbowParentheses
let g:rainbow_active = 1
":RainbowParenthesesToggle       " Toggle it on/off
":RainbowParenthesesLoadRound    " (), the default when toggling
":RainbowParenthesesLoadSquare   " []
":RainbowParenthesesLoadBraces   " {}
":RainbowParenthesesLoadChevrons " <>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


set showtabline=2
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [ 'bufnum'] ] }
let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2"  }
let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }
let g:netrw_browse_split = 3


let s:palette = g:lightline#colorscheme#powerline#palette
"tab actif
"let s:palette.tabline.tabsel = [ [ '#3a95b8', '#5f87ee', 255, 196, 'bold' ] ]
let s:palette.tabline.tabsel = [ [ '#3a95b8', '#5f87ee', 31 , 255, 'bold' ] ]
"fond de la barre onglet sans onglet
let s:palette.tabline.left = [ [ '#3a95b8', '#5f87ee',  255, 31 ] ]

"fond du la barre d onglet ou il y a des onglets
let s:palette.tabline.middle = [ [ '#3a95b8', '#5f87ee', 255 , 74 ] ]
"let s:palette.tabline.right = [ [ '#3a95b8', '#5f87ee', 255 , 74 ] ]
unlet s:palette
