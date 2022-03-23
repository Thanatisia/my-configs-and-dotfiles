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
"   [7] : 2022-02-13 2347H, Asura
"   [8] : 2022-02-19 2318H, Asura
"   [9] : 2022-03-24 0117H, Asura
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
"   [7] : Version 0.35.a.2022-02-13_2347H
"       - Added remap to
"           - Refresh current file (:so %)
"           - Show Help
"           - Show VimRC Path/File
"       - Updated
"           - Buffer config remap with expr and input()
"           - Git config remap with expr and input()
"       - Moved Plugin-specific settings and remaps to the top under the plugin controls
"       - Moved Variables above Plugins for global use
"       - Added colorschemes
"           - monokai
"           - ayu
"       - Added 'set termguicolors'
"       - Added dictionary for plugin parameters
"       - Modified Plug to include dictionary (Additional Parameters for Plugins)
"       - Added Plugin 'autocomplete'
"           - Added setting to change coc's home path (g:coc_config_home)
"           - Added other settings to coc
"   [8] : Version 0.4.a.2022-02-19_2318H
"       - Created area [snippets]
"       - Seperated all the plugin-specific settings and remaps into
"           individual script files in 'plugin-configs' folder
"       - Added setting to remove all errorbell sounds (i.e. when pressing escape in insert mode)
"       - Moved plug install line of codes to 'plugin/experimental.vim' in a function
"   [9] : Version 0.5.a.2022-03-24_0117H
"       - Created a new Plugin segment 'Dependency-Specific' for Dependency-based plugins
"           - Plugins that requires a specific external program to exist in your system
"           - i.e.
"               - vim-pandoc
"               - lf
"               - vifm.vim
"               - fzf(.vim)
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
        
let g:vimcfg=vimhome . vimfldr

"Constants
	let mapleader=","
    "let &shell='cmd.exe'

"------------------------------------------------------------------------

"===========================
" Plugins
"===========================

" Start Plugin
	call plug#begin()

" List Plugins
" - Dynamically Plug all plugins specified in the list [plugins]
" - Makes it easy to modify the plugins by commenting out the package in the
"   list, or uncommenting it in the list
" Syntax : Plug 'author/project', { 'key' : 'value' }

    " Language-support
    " Colorscheme
    Plug 'morhetz/gruvbox'
    Plug 'crusoexia/vim-monokai'
    Plug 'ayu-theme/ayu-vim'
    Plug 'kyoz/purify', {'rtp' : 'vim'}
    Plug 'pgdouyon/vim-yin-yang'
    " Tree File Browser 
    Plug 'scrooloose/nerdtree'
    " Font Pack
    "Plug 'be5invis/Iosevka'
    "Plug 'ryanoasis/nerd-fonts'
    " Icon Pack
    Plug 'ryanoasis/vim-devicons'
    " Git Utility
    Plug 'airblade/vim-gitgutter'
    " Fuzzy File Finder
    Plug 'ctrlpvim/ctrlp.vim'
    " Multiline Commenter
    Plug 'scrooloose/nerdcommenter'
    " Status Line
    Plug 'vim-airline/vim-airline'  
    " Auto/Tab Completion
    Plug 'ervandew/supertab'       
    Plug 'neoclide/coc.nvim', {'branch' : 'release'}
    " Floating Terminal
    Plug 'voldikss/vim-floaterm'
    " Programming Utility
        " Web Development
            Plug 'mattn/emmet-vim'
    " General Utility
    Plug 'liuchengxu/vim-which-key'
    Plug 'vimwiki/vimwiki'
    " Plug 'mg979/vim-visual-multi', {'branch' : 'master'}
    Plug 'Yggdroot/indentLine'
    Plug 'mbbill/undotree'
    Plug 'junegunn/goyo.vim'
    " Expansion Plugin
        " NERDTree Expansion Plugin
            Plug 'Xuyuanp/nerdtree-git-plugin'
            Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        " nerd font
            Plug 'lambdalisue/nerdfont.vim'
        " Vim-airline
            Plug 'vim-airline/vim-airline-themes'
    " Dependency-required
        " Tree File Browser
            Plug 'ptzz/lf.vim'
            Plug 'istib/vifm.vim'
        " Fuzzy File Finder
            Plug 'junegunn/fzf', { 'dir' : g:vimcfg . '/plugins/.fzf' , 'do' : { -> fzf#install() } }
            Plug 'junegunn/fzf.vim'
        " General Utility
            Plug 'kyoh86/vim-ripgrep'
    " Editor/Vim-flavor Specific
    if has('nvim')
        " Neovim Specific

        " Dependencies
    endif

" End Plugin
   	call plug#end()

"=========================
" VimRC - Plugin Settings
"=========================

" Place just the plugin name here
let plugin_names = [
            \ 'ayu',
            \ 'coc',
            \ 'ctrlp',
            \ 'fzf',
            \ 'fzf-vim',
            \ 'goyo',
            \ 'indentLine',
            \ 'lf-vim',
            \ 'nerdtree',
            \ 'purify',
            \ 'supertab',
            \ 'undotree',
            \ 'vim-floaterm',
            \ 'vifm',
            \ 'vim-airline',
            \ 'vim-airline-themes',
            \ 'vim-ripgrep',
            \ 'vimwiki',
            \ 'vim-visual-multi',
            \ 'which-key',
            \ ]

let plugin_cfg_path = g:vimcfg . '/configs/plug-configs/'

" Check if folder exists
if !isdirectory(plugin_cfg_path)
    " If directory does not exist
    " make directory
    call mkdir(plugin_cfg_path, "p")
endif

" Source all plugin configs stated in list [plugin_names] if exists
for plugin in plugin_names
    let curr_plugin_cfg_file = plugin_cfg_path . plugin . '.vim'
    if !filereadable(curr_plugin_cfg_file)
        " If file doesnt exist
        " - Create
        let file_contents = [
                    \ '"'                       ,
                    \ '" ' . plugin             ,
                    \ '"'                       ,
                    \ ''                        , 
                    \ '"================='      ,
                    \ '" Plugin Settings '      ,
                    \ '"================='      ,
                    \ ''                        ,
                    \ '"==================='    ,
                    \ '" Plugin Remappings '    ,
                    \ '"==================='
                    \ ]
	    call writefile(file_contents, curr_plugin_cfg_file, "a")
    endif

    " File Exists/Created
    " - Source
    execute 'source ' . curr_plugin_cfg_file
endfor

"======================
" VimRC - Plugin Remaps 
"======================

" Plugin Manager
    " Install Plugin
        nmap <leader>pi :so %<CR><esc>:PlugInstall<CR>
    " Upgrade Plugin
        nmap <leader>pu :PlugUpdate<CR>
    " Clean Plugin
        nmap <leader>pc :PlugClean<CR>

"-----------------------------------------------------------------------

" ===========================
" VimRC - Set Global Settings
" ===========================

"General Settings
    set nocompatible
    filetype on
    filetype plugin on
    filetype indent on
	syntax enable
"Set Font
    "set guifont=Terminal
    set guifont="Hack"
    "set guifont="Iosevka"
    set encoding=UTF-8
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
"Set for auto/tab completion
    set wildmode=list:longest,full
    set wildmenu
    set completeopt+=menu,longest
"Set Toggles
    set pastetoggle=<F3>
"Disable Options
	set noautoindent
	set nowrap
	set noerrorbells
    set noeb vb t_vb=
	set nobackup
	set noswapfile
	set noundofile

"Set Colorscheme
    set termguicolors
    set t_Co=256
    " :colorscheme gruvbox
    " :colorscheme ayu
    " :colorscheme monokai
    :colorscheme purify

"GUI-Specific
if has('gui_running')
    "Turn off GUI White Popup in Neovim-Qt
        GuiPopupmenu 0
endif

"------------------------------------------------------------------------

"===========================
" Remapping
"===========================

" General
    " Center the screen
        nnoremap <leader><Space> zz
" Important
    " Reload Current File
        silent nnoremap <leader>rf :e!<CR>
    " Re-source Current File
        silent nnoremap <leader>rs :so %<CR> 
    " Re-source VimRC
        silent nnoremap <expr> <leader>rvimrc ':so ' . vimcfg . '/.vimrc <CR>'
    " Refresh File
        nnoremap <leader><F5> :e!<CR>
" Bug-Fixing
" Quality of Life
    " Wrap selected texts in Quotation Marks '"'
        vnoremap " <esc>`>a"<esc>`<i"<esc>
    " Clear last search highlighting
        nnoremap <leader>shc :noh<CR>
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
    vnoremap <C-z> <esc>u
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
        nnoremap <expr> <leader>sft ":sb#" . input("Tab Number: ") . "<CR>"
" Open File/Tree Explorer
	nmap <leader>ne :Explore /path/to/file
	nmap <leader>n :Explore<CR>
	nmap <leader>ns :Sexplore<CR>
	nmap <leader>nv :Vexplore<CR>
	nmap <leader>nt :Texplore<CR>
" Compilation - via makefile
    nmap <leader>mf :!make<CR>
" Version Control : Git
    nnoremap <expr> <leader>ga ":!git add " . input("Git Files (Default: *): ")
    nnoremap <expr> <leader>gc ":!git commit -m \"" . input("Git Commit Message: ") . "\""
    nnoremap <leader>gs :!git status<CR>
    nnoremap <leader>gv :!git --version<CR>
" User Control
" Find
    nmap <C-f>f :find ./
" Keybindings
    nmap <leader>mm :map<CR>
    nmap <leader>mi :imap<CR>
    nmap <leader>mn :nmap<CR>
    nmap <leader>mv :vmap<CR>
" Show
    " Vim & VimRC
        nnoremap <leader>svim :echo $VIM<CR>
        nnoremap <leader>svimrt :echo $VIMRUNTIME<CR>
        nnoremap <leader>svimrc :echo $MYVIMRC<CR>
    " Help
        nnoremap <expr> <leader>shelp ":help " . input("Help Topic: ") . "<CR>"
    " Fetch
        nnoremap <expr> <leader>fetch ":echo 'Desktop Name :' $COMPUTERNAME '\|' <CR>"
" File-type Control
    " Change File type
        nnoremap <expr> <leader>cft ":set filetype=" . input("File Type: ") . "<CR>"
        nnoremap <expr> <leader>cfthtml ":set filetype=html<CR>"
        nnoremap <expr> <leader>cftphp ":set filetype=php<CR>"

"===========================
" Operating System-specific 
"===========================

" File Type-specific Remap

" C-based : Compile the current source file with gcc
    augroup CKeys autocmd FileType c
        execute 'nnoremap <buffer> ' . key_Compile . ' :w<CR>:!gcc "%" -o "%:r".exe && echo " Compilation Successful." <CR>'
        execute 'nnoremap <buffer> ' . key_Run . ' :!"%:r".exe<CR>'
        execute 'nnoremap <buffer> ' . key_Compile_Run . ' :w<CR>:!gcc "%" -o "%:r".exe<CR> :!%:r.exe<CR>'
    augroup END
" C++-based : Compile the current source file with g++
    augroup CPPKeys autocmd FileType cpp
        execute 'nnoremap <buffer> ' . key_Compile . ' :w<CR>:!g++ "%" -o "%:r".exe && echo " Compilation Successful." <CR>'
        execute 'nnoremap <buffer> ' . key_Run . ' :!"%:r".exe<CR>'
        execute 'nnoremap <buffer> ' . key_Compile_Run . ' :w<CR>:!g++ "%" -o "%:r".exe<CR> :!"%:r".exe<CR>'
    augroup END
" Python-based : Run with python the current source file without arguments
    augroup PythonKeys autocmd FileType python 
        execute 'nnoremap <buffer> ' . key_Run . ' :w<CR>:!python "%"<CR>'
    augroup END
" Shellscript : Run the current source file without arguments with Shell (Bash)
    augroup ShellscriptKeys autocmd FileType sh
        execute 'nnoremap <buffer> ' . key_Run . ' :w<CR>:!./"%"<CR>'
    augroup END
" Batch-based : Run the current source file without arguments with batch
    augroup BatchKeys autocmd FileType dosbatch
        execute 'nnoremap <buffer> ' . key_Run . ' :w<CR>:!"%"<CR>'
    augroup END

" Templates
" - read : Read from the file and put into the buffer
"   Optionals:
    "   -1read : Change line by 1 (- : Remove | + : Add) when inserted
    "   3jwf>a : Positions the cursor exactly in the middle of the title brackets

" Copy and Insert a file from a filepath of your choice
    "execute 'nnoremap <leader>cp ' . ':-1read ' . input("File Path: ") . '<CR>' . '3jwf>a'
    nnoremap <expr> <leader>cp ':-1read ' . input("File Path: ") . '<CR>' . '3jwf>a'
" Insert template based on current file
    " execute 'noremap <leader>sc ' . ':-1read ' . vimcfg . '/templates/skeleton.' . expand('%:e') . '<CR>' . '3jwf>a'
    nnoremap <expr> <leader>sc ':-1read ' . g:vimcfg . '/templates/skeleton.' . expand('%:e') . '<CR>' . '3jwf>a'
" Insert html template from 'skeleton.html'
    " execute 'noremap <leader>chtml ' . ':-1read ' . vimcfg . '/templates/skeleton.html' . '<CR>' . '3jwf>a'
    nnoremap <expr> <leader>chtml ':-1read ' . vimcfg . '/templates/skeleton.html' . '<CR>' . '3jwf>a'
" Insert php template from 'skeleton.php'
    " execute 'noremap <leader>cphp ' . ':-1read ' . vimcfg . '/templates/skeleton.php' . '<CR>'
    nnoremap <expr> <leader>cphp ':-1read ' . vimcfg . '/templates/skeleton.php' . '<CR>' . '3jwf>a'
" Insert c template from 'skeleton.c'
    " execute 'noremap <leader>cc ' . ':-1read ' . vimcfg . '/templates/skeleton.c' . '<CR>'
    nnoremap <expr> <leader>cc ':-1read ' . vimcfg . '/templates/skeleton.c' . '<CR>' . '3jwf>a'
" Insert cpp template from 'skeleton.cpp'
    " execute 'noremap <leader>ccpp ' . ':-1read ' . vimcfg . '/templates/skeleton.cpp' . '<CR>'
    nnoremap <expr> <leader>ccpp ':-1read ' . vimcfg . '/templates/skeleton.cpp' . '<CR>' . '3jwf>a'
" Insert python template from 'skeleton.py'
    " execute 'noremap <leader>cpy ' . ':-1read ' . vimcfg . '/templates/skeleton.py' . '<CR>'
    nnoremap <expr> <leader>cpy ':-1read ' . vimcfg . '/templates/skeleton.py' . '<CR>' . '3jwf>a'

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

" Automatically Leave Insert Mode after 'updatetime' milliseconds of inactivity
    autocmd CursorHoldI * stopinsert

"------------------------------------------------------------------------

"==========
" Snippets
"==========
" Python Snippets Group
    augroup PythonSnippets autocmd FileType python
        iabbrev ifmain <CR>
                \if __name__ == "__main__":<CR>
                \main()
    augroup END

" Shellscript Snippets Group
    augroup ShellscriptSnippets autocmd FileType sh
        iabbrev ifmain <CR>
                \if "${BASH_SOURCE[0]}" == "$0"; then
                \main()
                \fi
    augroup END

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
