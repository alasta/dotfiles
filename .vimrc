" Auto load / install plugin manager

if !1 | finish | endif

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif


"Affiche la statusbar
set laststatus=2

"Gestion des couleurs
set t_Co=256

"Activation de la colorisation syntaxique
syntax on
syntax enable

"gestion pour la syntaxe/indentation
filetype plugin indent on

"gestion de la couleur de backgroud
"set background=dark


"""Custom tabulations
""Modify tab into space
"set expandtab 
"le tab vaut 2 espaces

"Nb d espace du tab
set tabstop=2 

"nb d espace de l indentation auto
set shiftwidth=2

""" Affichage des tab via un pipe, IMPORTANT il y a un espace a la fin !
set list lcs=tab:\|\ 

"""hybride numero de ligne
:set number rnu

"affichage de la colonne curseur
set cursorcolumn

"changement de couleur du numero de ligne
highlight CursorLineNr ctermfg=red

"Gestion de la souris
:set mouse=a

"Check si le dossier de plugins est existant ce qui veut dire que les plugins
"sont present
if isdirectory(expand("~/.vim/plugged/"))  
    "Gestion de chargement des plugins
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

    " Syntastic  
    " https://github.com/scrooloose/syntastic
    "Plug 'scrooloose/syntastic'

    " Surround
    " surround.vim: quoting/parenthesizing made simple
    " https://github.com/tpope/vim-surround
    "Plug 'tpope/vim-surround'
    "Plug 'Yggdroot/indentLine'
    "let g:indentLine_char = '|'


    call plug#end()
    " Required:
    filetype plugin indent on



    """""'lifepillar/vim-solarized8'
    "gestion du theme par plugin
    set background=dark
    colorscheme solarized8_flat
    """error : E185: Cannot find color scheme 'solarized'
    ""workaround : mkdir .vim/colors && cp .vim/plugged/vim-solarized8/colors/solarized8* .vim/colors/


    """"""vim_current_word 
    "Gestion de la couleurs des mots via plugin
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


    "Affichage de la barre d onglet
    set showtabline=2

    "Gestion/theme de la barre insert/visual/ ....
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

    "couleurs pour les tab/onglet
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
endif

"Gestion du colapse sur des sections base sur l indetation
set foldmethod=indent
set foldlevel=4
" Enable folding with the spacebar
nnoremap <space> za


"""Gestion copier avec "y" hors mode insertion
set clipboard=unnamed
