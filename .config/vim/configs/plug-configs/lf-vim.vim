"
" lf-vim
"

"=================
" Plugin Settings 
"=================

" Enable (1) / Disable (0) Default Key Mappings
    let g:lf_map_keys = 0

" Set Floating Windows Width/Height
    "let g:lf_width = 
    "let g:lf_height = 

" Replace netrw as the default directory folder 
    let g:NERDTreeHijackNetrw = 0   " Add this line if you use NERDTree
    let g:lf_replace_netrw = 1      " Open lf when vim opens a directory

"===================
" Plugin Remappings 
"===================

" Opening lf
    nnoremap <leader>lf :Lf<CR>

" Opening file in new tab
    nnoremap <leader>lft :LfNewTab<CR>

