"
" undotree
"

"=================
" Plugin Settings 
"=================

"===================
" Plugin Remappings 
"===================

" Toggle
    nnoremap <leader>undo :UndotreeToggle<CR>

"==================
" Plugin Functions
"==================

if has("persistent_undo")
    let undodir_path = g:vimcfg . '/.undodir'
    let target_path = expand(undodir_path)

    " Create the directory and any parent directories
    " - if the location does not exist
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)  " Create undo directory and all parent directories, set permission to 0700
    endif

    let &undodir = target_path
    set undofile
endif
