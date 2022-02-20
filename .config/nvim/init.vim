"
" N(eo)vim Initialization File
" 
" :: Remarks
"   - This init.vim vimscript is not designed as a vimrc replacement, it is
"   designed to be a one-time startup generator
"       - Please edit the .vimrc/_vimrc file created in your {.vim|vimfiles} folder
"
" :: Author : Asura
" :: Created : 2022-01-27 13:22H
" :: Modified:
"       [0] 2022-01-27 13:22H, Asura
" :: Changelogs:
"       [0] v0.1a_20220127_1322H_c1
"           - Created Script File
"       [1] v0.2a_20220130_1543H_c1
"           - Added features to
"               1. Generate folders on launch (if does not exist)
"               2. Generate a default vimrc from a predefined syntax (editable in 'vimrc_lines' array list)
"       [2] v0.3a_
"	    - Moved [Local Variables] down below [OS Specifics]
"	    - Added line to create plugin-configs folder
"

set runtimepath+=data/nvim/.vim,data/nvim/.vim/after
set packpath+=data/nvim/.vim

"==============
" Variables
" NOTES:
"	- &variable : To call variables
"==============

" ---------------------
" Environment Variables
" ---------------------
let path_config=stdpath('config')
let path_data=stdpath('data')

"----------------------------
" Cross-OS System Validation
"----------------------------
if has('win32')
	" Windows
	let vimdir="/vimfiles"
else
	" Linux
	let vimdir="/.vim"
endif

" -----------------
" Local Variables
" -----------------
let nvim_data_root="data/nvim-data"
let nvim_root='data/nvim'
let path_autoload_plug=nvim_data_root . '/site/autoload'

let vim_plugin_dir=nvim_data_root . '/plugged'
let vimcfg_dir=nvim_root . vimdir
let vimrc=vimcfg_dir . '/' . '.vimrc'
let $MYPLUGDIRECTORY=nvim_data_root . '/plugged'

" Arrays
let fldrs_to_create=[
            \ vimcfg_dir . "/after", 
            \ vimcfg_dir . "/templates", 
            \ vimcfg_dir . "/configs/plug-configs", 
            \ vimcfg_dir . "/settings/plug-settings", 
            \ $MYPLUGDIRECTORY
            \ ]

let vimrc_lines=[
    \ "let plugins=[]",
    \ "",
    \ "\" Start Plugin",
    \ "call plug#begin()", 
    \ "",
    \ "\" List Plugins",
    \ "for plugin in plugins",
    \ "     let curr_plugin='''' . plugin . ''''",
    \ "     execute 'Plug ' . curr_plugin",
    \ "endfor",
    \ "",
    \ "\" End Plugin",
    \ "call plug#end()",
    \]	" Default lines for the template vimrc file

"-----------
" Vim Plugin
"-----------
let vim_plugin_manager="vim-plug"

" Vim Plugin Manager download commands
if vim_plugin_manager=="vim-plug"
	let autoload_plug=path_autoload_plug . '/plug.vim' " File paths
	let plugin_manager_filename="plug.vim"
	let plugin_manager_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

let cmd='!curl -fLo ' . autoload_plug . ' --create-dirs ' . plugin_manager_url

"==============
" Body
"==============

"-----------------------
" Checks and Validations
"-----------------------
"Check if folder exists
for fldr in fldrs_to_create
    "if !isdirectory(vimcfg_dir . "/after")
    "    " Check if 'after' directory is created
    "    call mkdir(vimcfg_dir . "/after", "p")
    "endif

    "if !isdirectory(vimcfg_dir . "/templates")
    "    " Check if 'templates' directory is created
    "    call mkdir(vimcfg_dir . "/templates", "p")
    "endif

    "if !isdirectory($MYPLUGDIRECTORY)
    "    " Check if plugin directory is created
    "    call mkdir($MYPLUGDIRECTORY)
    "endif
    if !isdirectory(fldr)
        echom 'Folder ' . fldr . ' does not exist, Creating...'
        call mkdir(fldr)
    endif
endfor

" Check if vim plugin manager exists
if !filereadable(autoload_plug)
	" Download plugin manager file if doesnt exist using curl
	echo "File does not exists"
	echo "Downloading " . plugin_manager_filename
	silent execute '!curl -fLo ' . autoload_plug . ' --create-dirs ' . plugin_manager_url

	" Check if download is successful
	if filereadable(autoload_plug)
		echo "File [" . plugin_manager_filename . "] Download completed."
	else
		echo "Error downloading [" . plugin_manager_filename . "]"
	endif
endif

"Check if files exist
if !filereadable(vimrc)
	"Create vimrc if doesnt exist
	
	" :: Parameters
	"	1. Lines to write, each index is 1 line (Array)
	" 	2. Output file name (String)
	" 	3. Open File Write Mode (String)
	call writefile(vimrc_lines, vimrc, "a")
	
	" Check if creation is successful
	if !filereadable(vimrc)
		echom "Error creating " . vimrc
	else
		echom vimrc . " created successfully."
	endif
endif

"-------------------------
" Attempt to Source
" - Source files for use
"-------------------------
exec 'source ' . vimcfg_dir . '/.vimrc'

