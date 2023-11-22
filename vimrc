" The default vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Jun 13
"
" This is loaded if no vimrc file was found.
" Except when Vim is run with "-u NONE" or "-C".
" Individual settings can be reverted with ":set option&".
" Other commands can be reverted as mentioned below.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif


"**************************************************************************
"COSAS AGREGADAS POR MI:


"Para que las indentaciones sean de 4 CARACTERES espacio (en vez de una
"tabulacion con tama;o de 4 espacios), pero ingresados con la tecla TAB.

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

"tabstop: es el ancho de un caracter TAB "real".

"shiftwidth: tama;o de una indentacion. se mide en espacios

"softtabstop: si se iguala a un valor != 0 distinto de tabstop, hace que la
"tecla TAB (en modo INSERTAR) inserte una combinacion de espacios (y a veces
"TAB) para simular tabulaciones en este ancho.

"expandtab: hace que la tecla TAB (en modo INSERTAR) inserte espacios en vez
"de caracteres tab.

"smarttab: pone indentaciones cuando tiene que ponerlas.

" Mejores indentaciones supuestamente (comentarla si da problemas)
filetype plugin indent on
" Si abro vim sin nombre de archivo, y escribo :set filetype=python, por ejemplo, me activa la sintaxis
" de python y las indentaciones automáticas.

"CUIDADO: Los archivos makefile TIENEN que tener hard-tabs cuando se usan, no
"valen los espacios!!!! En caso de que use vim para hacer un makefile,
"desactivar expandtab.

"Para que aparezcan los numeros de lineas.
set number

"Para que se pueda usar el mouse para seleccionar.
set mouse=a
"set mouse=r
" Si activo set mouse=r, no funciona set mouse=a. No recuerdo que hace set mouse=r, pero lo agregué en ubuntu
" En windows no parece que haga nada, pero no se.

"Para poder pegar cosas desde el portapapeles
set clipboard=unnamed

"Para "comprimir" bloques de codigo
set foldmethod=manual

"Para que si me voy de la ventana, que NO siga abajo.
set nowrap

"Para que no se creen swapfiles
set noswapfile

"Para busqueda incremental
set incsearch

"Agrega una linea para usar de delimitador
:set colorcolumn=80

"Para que el lenguaje sea ingles
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"**********************************************************************
" ELIMINAR A PARTIR DE ACA SI ME DA PROBLEMAS

"PLUGINS!! Comentarlos si no los quiero mas.
"Ejecutar el comando :PlugInstall para instalarlos
call plug#begin('~/vimfiles/plugged')
  Plug 'dracula/vim/', {'as': 'dracula'}
  Plug 'morhetz/gruvbox'
  Plug 'jcherven/jummidark.vim'
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/gruvbox-material'
  
  "NERDTree
  Plug 'preservim/nerdtree'
  
  "Emmet (abreviaturas para HTML por ejemplo). Se usa con (ctrl+y), (con la coma incluida)
  " Por ejemplo, escribo html:5 y despues (ctrl+y),
  Plug 'mattn/emmet-vim'
  
  " Para cerrar etiquetas de HTML y JSX automáticamente
  Plug 'alvan/vim-closetag'
  
  " Syntax highlighting para varios lenguajes (por alguna razón tiene conflicto con indentline)
  " Plug 'sheerun/vim-polyglot'
  
  " Agrega marcas para las indentaciones. Pueden modificarse (ver el repo en git https://github.com/Yggdroot/indentLine)
  Plug 'Yggdroot/indentLine'

  " React highlights e indentaciones
  Plug 'maxmellon/vim-jsx-pretty'
  
  " Permite hacer un seguimiento del repo en GIT
  if has('nvim') || has('patch-8.0.902')
	Plug 'mhinz/vim-signify'
  else
	Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
  endif
  
  " Para agregar comentarios fácilmente. Se puede agregar soporte para más lenguajes (ver el repo en git)
  " El comango gcc comenta una linea. gc comenta lo que está seleccionado.
  Plug 'tpope/vim-commentary'
  " Uno parecido a este es scrooloose/nerdcommenter
  
  " Agrega una barra inferior más linda. En el repo hay muchas opciones de configuración.
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Un buscador para la linea de comandos. En el repo hay mucha documentación
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Se usa junto con fzf para asegurarme de que busque en el directorio del
  " proyecto
  Plug 'airblade/vim-rooter'
  
  " Comandos de GIT para usar directamente desde VIM
  Plug 'tpope/vim-fugitive'
  
  " Muestra errores y warnings de forma asincrónica. 
  " Con el comando :ALEFixSuggest se muestran sugerencias para mejorar el código
  " Con :ALEHover se puede ver más información sobre un símbolo poniendo el cursor encima.
  " Se puede usar el comando :help seguido de alguna función para obtener ayuda, por ejemplo :help ale-hover
  Plug 'dmerejkowsky/vim-ale'
  let g:ale_set_signs = 0
  
  " Ayuda para escribir código en C#
  Plug 'OmniSharp/omnisharp-vim'
  
  " Permite rodear código con determinado caracter (paréntesis, llaves etc) fácilmente.
  Plug 'tpope/vim-surround'
  
  " Permite autocompletado usando TAB entre otras cosas
  Plug 'ervandew/supertab'
  
  " Habilita la tecla de . para que se puedan repetir acciones que no son nativas de VIM.
  " O sea, permite repetir cosas teniendo en cuenta los pluings.
  " Sin esto, si la ultima tarea que hice es de alguno de los plugins soportados, no va a repetir esa, sino
  " la última tarea nativa de VIM
  Plug 'tpope/vim-repeat'
  
call plug#end()

" Shortcuts para NERDTree:

"ctrl+t para abrir y cerrar.
nnoremap <C-t> :NERDTreeToggle<CR>


"COLORSCHEMES CONFIG

syntax enable


" Supuestamente no es necesario cuando uso ColorSchemes
set background=dark
"set background=light

"IMPORTANT!!
if has('termguicolors')
    set termguicolors
endif

"Comentar todo menos el colorscheme que quiero.

"colorscheme dracula

"colorscheme elflord
"colorscheme slate

"let g:gruvbox_contrast_dark = 'medium'
"colorscheme gruvbox

" Gruvbox con contraste mas tranqui
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'

"colorscheme jummidark

"**********************************************************************
"Para sonokai

"The configuration options should be placed before 'colorscheme sonokai'
"DESCOMENTAR SOLO EL ESTILO QUE QUIERO
"let g:sonokai_style = 'default'
"let g:sonokai_style = 'atlantis'
"let g:sonokai_style = 'andromeda'
"let g:sonokai_style = 'shusia'
"let g:sonokai_style = 'maia'
"let g:sonokai_style = 'espresso'

"let g:sonokai_better_performance = 1
"let g:sonokai_enable_italic = 1
"let g_sonokai_disable_italic_comment = 1
"colorscheme sonokai
"let g:airline_theme = 'sonokai'
"**********************************************************************

" Para pintar el numero de linea actual
" Es posible que algún colorscheme tenga su propia configuración, en ese caso comentar esto.
highlight CursorLineNr guifg=#efefef
set cursorline
"set cursorlineopt=number

" Cambia el color de la linea horizontal
highlight CursorLine cterm=NONE guibg=#282828


" Markdown (tpope markdown, que ya viene con las versiones nuevas de Vim)
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java', 'javascript', 'csh', 'c', 'cpp', 'css']
