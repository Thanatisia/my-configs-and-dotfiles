"
" vimwiki
"

"=================
" Plugin Settings 
"=================

" Set vimwiki settings
    let g:vimwiki_list = [
                    \ {
                    \    'path' : g:vimcfg . '/settings/plug-settings/vimwiki',
                    \    'syntax' : 'markdown',
                    \    'ext' : '.md'    
                    \ }
                \ ]

"===================
" Plugin Remappings 
"===================

" Open Vimwiki
    nnoremap <leader>vw <Leader>ww
