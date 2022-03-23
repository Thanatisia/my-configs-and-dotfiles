"
" Coc.nvim
" - Configs, Settings, Remaps
"

"===========
" Functions 
"===========

"=================
" Plugin Settings
"=================
    if has('win32') 
        "let g:coc_config_home = './data/nvim/coc' "Set coc's config home path to make it portable
        let g:coc_config_home = g:vimcfg . "/settings/plug-settings/coc"
    endif

    " Set COC extensions
        let g:coc_global_extensions = [
                    \ 'coc-snippets',
                    \ 'coc-pairs',
                    \ 'coc-eslint',
                    \ 'coc-prettier',
                    \ 'coc-json',
                    \ 'coc-html',
                    \ 'coc-css',
                    \ 'coc-tsserver',
                    \ 'coc-explorer',
                    \ 'coc-phpls',
                    \ 'coc-pyright',
                    \ 'coc-vimlsp',
                    \ 'coc-webview',
                    \ 'coc-markdown-preview-enhanced'
                    \ ]

    " coc-explorer

    " coc-snippets
        " let g:coc_snippet_next = '<c-s>n'
        " let g:coc_snippet_prev = '<c-s>p'

"================
" Plugin Remaps
"================
    " Coc package management
        " Install Coc packages
            nnoremap <expr> <leader>coci ':CocInstall ' . input("CocInstall > Package to install : ") . '<CR>'
        " Update Coc packages
            nnoremap <leader>cocu :CocUpdate <CR>
        " Uninstall Coc packages
            nnoremap <expr> <leader>cocuni ':CocUninstall ' . input("CocUninstall > Package to uninstall : ") . '<CR>'
    " Show 
        " Coc Config
            nnoremap <leader>cocc :CocConfig<CR>
        " Help
            nnoremap <leader>cocl :CocList<CR>
            nnoremap <leader>cocle :CocList extensions<CR>
    " CocCommands
        " coc-explorer
            nnoremap <leader>e :CocCommand explorer<CR>
            nnoremap <leader>efl :CocCommand explorer --preset floating<CR>
            nnoremap <expr> <leader>es ':CocCommand explorer --sources=' . input("Sources: ") . ' ' . input("Path: ") . '<CR>'
            nnoremap <expr> <leader>ef ':CocCommand explorer ' . input("Path: ") . '<CR>'

        " coc-snippets

        " FileType specific
            " Markdown-Typed
                " coc-markdown-preview-enhanced
                    autocmd FileType md nnoremap <leader>cocmp :CocCommand markdown-preview-enhanced.openPreview<CR>

