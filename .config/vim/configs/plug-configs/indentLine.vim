"
" indentLine
"

"=================
" Plugin Settings 
"=================

" Show First Indent Delimiter
    "let g:indentLine_showFirstIndentLevel = 1

" Indent Line File Type Exclude
    let g:indentLine_fileTypeExclude = ["vimwiki", "coc-explorer", "help", "undotree", "diff"]

" Indent Line Buffer Type Exclude
    let g:indentLine_bufTypeExclude = ["help", "terminal"]

" Conceal Settings
    let g:indentLine_setConceal = 1
    let g:indentLine_concealcursor = "inc"
    let g:indentLine_conceallevel = 2

" Lists
    let g:indentLine_char_list = [ '|', '¦', '┆', '┊']

" Leading Spaces
    let g:indentLine_leadingSpaceEnabled = 1
    let g:indentLine_leadingSpaceChar = "•"

" Disable by default
    let g:indentLine_enabled = 0


"===================
" Plugin Remappings 
"===================

" Toggle Enable/Disable indentLine
    nnoremap <leader>ilt :IndentLinesToggle<CR>
    nnoremap <leader>ile :IndentLinesEnable<CR>
    nnoremap <leader>ild :IndentLinesDisable<CR>
