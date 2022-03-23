"
" fzf-vim
"

"=================
" Plugin Settings 
"=================

" Append Fzf to PATH settings
    let &runtimepath .= ',' . g:vimcfg . '/plugins/.fzf/bin/'

" Set prefix to type behind the command
    let g:fzf_command_prefix = 'Fzf'

"===================
" Plugin Remappings 
"===================
nnoremap <leader>fzf :FzfFiles<CR>

