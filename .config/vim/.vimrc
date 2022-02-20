"======================================================================================
" VimRC Cross-Platform 
" - Still a WIP
" Author : Asura
" Created: 2022-01-26 1558H
" Modified: 
"	[0] : 2022-01-26 1558H, Asura
"	[1] : 2022-01-27 2247H, Asura
"	[2] : 2022-01-28 1503H, Asura
"	[3] : 2022-01-29 0037H, Asura
"   [4] : 2022-01-29 1657H, Asura
"   [5] : 2022-01-30 0021H, Asura
"   [6] : 2022-02-09 2004H, Asura
" Changelogs:
"	[0] : Version 0.1.a.2022-01-25_2206H
"		- Commented out gVim Windows default command (Uncomment to use)
"		- Added some vim keybindings, remapping etc.
"	[1] : Version 0.2.a.2022-01-27_2247H
"		- Formatted vimrc for readability
"		- Added autocmds - file type specific keybinds
"	[2] : Version 0.3.a.2022-01-28_1503H
"		- Moved Positions
"	[3] : Version 0.31.a.2022-01-29_0037H
"		- Copied from gVim Windows
"		- Modified colorscheme to run gruvbox
"		- Re-added the last 3 lines as there was a W15 '^M' line error (Fixed)
"   [4] : Version 0.32.a.2022-01-29_0037H
"       - Added Operating System Checking & Operating System-specific variables
"       - Added File Template copying key remappings
"       - Reorganized Custom OS Remapping to be dynamic based on variable (Neater) 
"   [5] : Version 0.33.a.2022-01-30_0021H
"       - Converted Plugs from static addition (Manually adding Plug 'author/package')
"                           to dynamic addition (Just need to modify the plugins list)
"   [6] : Version 0.34.a.2022-02-09_2004H
"       - Added remap for split - to move split from vertical to horizontal and vice versa
"       - Added mouse compatibility
"       - Added automatic center of screen when
"           - Entering Insert Mode
"           - Opening File
"       - Added Remap to
"           - Wrap selected lines with quotation marks
"           - Move lines up and down
"==========================================================================================

"===========================
" Table of Contents
"===========================

" OS-checking
" Plugins
" VimRC settings
" Remappings
" Autocommands
" VimRC Functions

"------------------------------------------------------------------------

"===========================
" OS-checking
"===========================

"set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"--- Set Windows-specific VimRC configs
"Make vim follow linux vim's keybinding and config styles (ignore mswin.vim)
	:behave xterm

"------------------------------------------------------------------------

"===========================
" Plugins
"===========================
"let plugins=[
            ""\ Colorscheme
            "\'morhetz/gruvbox',
            ""\ Autocompletion            
            ""\ neoclide/coc.nvim
            ""\ File Browser
            "\'scrooloose/nerdtree',
            ""\ NERDTree Expansion Plugin
            "\'Xuyuanp/nerdtree-git-plugin',
            "\'tiagofumo/vim-nerdtree-syntax-highlight',
            ""\ Font pack
            "\'ryanoasis/vim-devicons',
            ""\ Git Utility
            "\'airblade/vim-gitgutter',
            ""\ File Fuzzy Finder
            "\'ctrlpvim/ctrlp.vim',
            ""\ Multiline Commenter
            "\'scrooloose/nerdcommenter',
            ""\ Status Line
            "\'vim-airline/vim-airline',
            "\]

" Start Plugin
	call plug#begin()

" List Plugins
" - Dynamically Plug all plugins specified in the list [plugins]
" - Makes it easy to modify the plugins by commenting out the package in the
"   list, or uncommenting it in the list
" Syntax : Plug 'author/project'
    "for plugin in plugins
        "" Plug 'morhetz/gruvbox'
        "let curr_plugin='''' . plugin . ''''
        "execute 'Plug ' . curr_plugin
    "endfor
    Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'

" End Plugin
   	call plug#end()

"------------------------------------------------------------------------

" =========
" Variables
" =========

" Check vim variant (n|g|base)vim
if has('nvim')
    " Is nvim
    let vimhome=stdpath('config')
else
    " Is vim
    let vimhome=$HOME
endif

" Check Operating System
if has('win32')
    " Windows
    "------------
    " Variables
    "------------
    let vimfldr='/vimfiles'
    let key_Compile='<leader>c'
    let key_Run='<leader>r'
    let key_Compile_Run='<leader>cr'
else
    " *NIX
    "-----------
    " Variables
    "-----------
    let vimfldr='/.vim'
    let key_Compile='<F5>'
    let key_Run='<F6>'
    let key_Compile_Run='<F7>'
endif
        
let vimcfg=vimhome . vimfldr

"-----------------------------------------------------------------------

" ===========================
" VimRC - Set Global Settings
" ===========================

"Constants
	:let mapleader=","
"Enable
	syntax enable
"Set Font
"set guifont=Terminal
    set guifont="Roboto Mono"
"Set Tab Spaces to 4 spaces
	set expandtab
	set tabstop=4
	set shiftwidth=4
"Set Options
    set titlestring=%t 
    set confirm
    "set autoindent
	set smartindent
	set linebreak
	set number
	set relativenumber
	set title
	set ruler
	set background=dark
	set hlsearch
	set textwidth=0
	set backspace=indent,eol,start
	set clipboard=unnamed
    set path+=**                        " ** indicates to search all files and directories and in all subdirectories of that directory
    set cursorline                      " Highlight current line
    set mouse=a
"Set Toggles
    set pastetoggle=<F3>
"Disable Options
	set noautoindent
	set nowrap
	set noerrorbells
	set nobackup
	set noswapfile
	set noundofile

"Filetype specific
"    filetype on
"    filetype plugin on
"    filetype indent on

"Set Colorscheme
    set t_Co=256
    :colorscheme gruvbox

"let &shell='cmd.exe'

"=========================
" VimRC - Plugin Settings
"=========================

" COC settings
    let g:coc_global_extensions = [
                \ 'coc-snippets',
                \ 'coc-pairs',
                \ 'coc-eslint',
                \ 'coc-prettier',
                \ 'coc-json',
                \ ]


"------------------------------------------------------------------------

"===========================
" Remapping
"===========================

" General
    " Center the screen
    nnoremap <leader><Space> zz
" Quality of Life
    " Wrap selected texts in Quotation Marks '"'
        vnoremap " <esc>`>a"<esc>`<i"<esc>vnoremap " <esc>`>a"<esc>`<i"<esc>
" Movement
	vnoremap J :m '>+1<CR>gv=gv		
	vnoremap K :m '<-2<CR>gv=gv		
	inoremap <C-j> <esc>:m .+1<CR>==	
	inoremap <C-k> <esc>:m .-2<CR>==	
	nnoremap <leader>j :m .+1<CR>==		
	nnoremap <leader>k :m .-2<CR>==		
" Tab Backwards : Shift + Tab [Normal Mode (No Remap)]
	nnoremap <S-Tab> <<
" Tab backwards : Shift + Tab [Insert Mode (No Remap)] 
	inoremap <S-Tab> <C-d>
" Select All
	nmap <C-a> ggvG
	imap <C-a> <Esc>ggvG
" Undo
	nmap <C-Z> u
	imap <C-Z> <Esc>ui
" Redo
	nmap <C-R> <c-r>
	imap <C-R> <Esc><c-r>i
" Save : Control + S
	nmap <C-S> :w<CR>
	imap <C-S> <Esc>:w<CR>a
" Save and Quit
	nmap <F2> :wq<CR>
	imap <F2> <Esc>:wq<CR>
" Copy
	nmap <C-c> yy
	imap <C-c> <Esc>yyi
	vmap <C-c> y
" Cut
	nmap <c-x> dd
	imap <c-x> <Esc>ddi
	vmap <c-x> d
" Paste
	nmap <c-v> p
	imap <c-v> <Esc>pi
	vmap <c-v> p
" Close Vim
	nmap <c-w> :q<CR>
	nmap <c-w>f :q!<CR>
" Split 
    " Create Vertical
	    "nmap <leader>sv :vnew<CR>
        "nmap <leader>sv :vsp [filename]
        noremap <leader>sv <c-w>v
    " Create Horizontal
        "nmap <leader>sh :sp [filename]
        noremap <leader>sh <c-w>s
    " Close
        noremap <leader>sq <c-w>q  
    " Movement - Use 'ctrl-[hjkl] to select the active split
        nmap <c-k> :wincmd k<CR>
        nmap <c-j> :wincmd j<CR>
        nmap <c-h> :wincmd h<CR>
        nmap <c-l> :wincmd l<CR>
    " Movement - Use '<leader>sm{lr}' to move split window from left to right and vice versa
    " Movement - Use '<leader>sml' to rotate windows up/left
        nnoremap <leader>sml <c-w>R
    " Movement - Use '<leader>smr' to rotate windows down/right
        nnoremap <leader>smr <c-w>r
    " Movement - Use '<leader>srfr' to rotate current focused window with the closest window to the right
        nnoremap <leader>srfr <c-w>x
    " Movement - Use '<leader>sm{vh}' to move split from vertical to horizontal and vice versa
        nnoremap <leader>smv <c-w>K
        nnoremap <leader>smh <c-w>H
" Tabs 
    " Change Next : Shift + T
	    nmap <S-T> :tabn<CR>
    " Change Previous : Leader + T
	    nmap <leader>t :tabp<CR>
    " Create New : Control + Tab
	    nmap <C-T> :tabnew<CR>
    " Close Tab : Leader + w
	    nmap <leader>w :tabc<CR>
    " Close Tab (Force) : Leader + w + f
	    nmap <leader>wf :tabc!<CR>
" Split-Tab
    " Open Buffers
        nnoremap <leader>sb :buffers<CR>
    " Movement - Move from Splits to Tab (Split from Tab)
        nnoremap <leader>sft :sb#buffer_ID
" Open File/Tree Explorer
	nmap <leader>ne :Explore /path/to/file
	nmap <leader>n :Explore<CR>
	nmap <leader>ns :Sexplore<CR>
	nmap <leader>nv :Vexplore<CR>
	nmap <leader>nt :Texplore<CR>
" Compilation - via makefile
    nmap <leader>mf :!make<CR>
" Version Control : Git
    nmap <leader>ga :!git add
    nmap <leader>gc :!git commit -m "new commit"
    nmap <leader>gs :!git status<CR>
    nmap <leader>gv :!git --version<CR>
" User Control
" Find
    nmap <C-f>f :find ./
" Keybindings
    nmap <leader>mm :map<CR>
    nmap <leader>mi :imap<CR>
    nmap <leader>mn :nmap<CR>
    nmap <leader>mv :vmap<CR>

"======================
" Remap - VimRC Plugin 
"====================== 
" Open NERDTree
    nmap <C-n> :NERDTreeToggle<CR>
" Toggle Commenting and Uncommenting
    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle


"===========================
" Operating System-specific 
"===========================

" File Type-specific Remap

" C-based : Compile the current source file with gcc
    autocmd FileType c execute 'nnoremap <buffer> ' . key_Compile . ' :w<CR>:!gcc % -o %:r.exe && echo " Compilation Successful." <CR>'
    autocmd FileType c execute 'nnoremap <buffer> ' . key_Run . ' :!%:r.exe<CR>'
    autocmd FileType c execute 'nnoremap <buffer> ' . key_Compile_Run . ' :w<CR>:!gcc % -o %:r.exe<CR> :!%:r.exe<CR>'
" C++-based : Compile the current source file with g++
    autocmd FileType cpp execute 'nnoremap <buffer> ' . key_Compile . ' :w<CR>:!g++ "%" -o "%:r".exe && echo " Compilation Successful." <CR>'
    autocmd FileType cpp execute 'nnoremap <buffer> ' . key_Run . ' :!"%:r".exe<CR>'
    autocmd FileType cpp execute 'nnoremap <buffer> ' . key_Compile_Run . ' :w<CR>:!g++ "%" -o "%:r".exe<CR> :!"%:r".exe<CR>'
" Python-based : Run with python the current source file without arguments
    autocmd FileType python execute 'nnoremap <buffer> ' . key_Run . ' :w<CR>:!python %<CR>'
" Shellscript : Run the current source file without arguments with Shell (Bash)
    autocmd FileType sh execute 'nnoremap <buffer> ' . key_Run . ' :w<CR>:!./%<CR>'
" Batch-based : Run the current source file without arguments with batch
    autocmd FileType dosbatch execute 'nnoremap <buffer> ' . key_Run . ' :w<CR>:!%<CR>'

" Templates
" - read : Read from the file and put into the buffer
"   Optionals:
    "   -1read : Change line by 1 (- : Remove | + : Add) when inserted
    "   3jwf>a : Positions the cursor exactly in the middle of the title brackets

" Insert html template from 'skeleton.html'
    execute 'noremap <leader>chtml ' . ':-1read ' . vimcfg . '/templates/skeleton.html' . '<CR>' . '3jwf>a'
" Insert php template from 'skeleton.php'
    execute 'noremap <leader>cphp ' . ':-1read ' . vimcfg . '/templates/skeleton.php' . '<CR>'
" Insert c template from 'skeleton.c'
    execute 'noremap <leader>cc ' . ':-1read ' . vimcfg . '/templates/skeleton.c' . '<CR>'
" Insert cpp template from 'skeleton.cpp'
    execute 'noremap <leader>ccpp ' . ':-1read ' . vimcfg . '/templates/skeleton.cpp' . '<CR>'
" Insert python template from 'skeleton.py'
    execute 'noremap <leader>cpy ' . ':-1read ' . vimcfg . '/templates/skeleton.py' . '<CR>'

"------------------------------------------------------------------------

"======================================================================
" Autocommands
" Syntax:
"	autocmd {event-type} {pattern} {event}
" Options
"	event types:
"		BufWritePre		: Before writing to a file
"		BufWritePro		: After writing to a file
"		BufRead			: When reading an existing file
"		BufNewFile		: When opening a new file
"		BufNewFile,BufRead	: Run Command regardless of where file exists
"		References:
"			https://vimhelp.org/autocmd.txt.html
" Notes:
"	- Please seperate all multivalues with delimiter ','
"======================================================================

" Automatically Center the screen
    " When opening a file
        autocmd BufEnter * :normal zz

    " When entering insert mode
        " autocmd InsertEnter * :normal zz

" Reindent the current file
    " Before entering the file
        " autocmd BufWritePre * :normal gg=G

"------------------------------------------------------------------------

"===============================
" VimRC - Functions
"===============================


"===============================
" VimRC - Functions (Predefined)
"===============================
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"------------------------------------------------------------------------
