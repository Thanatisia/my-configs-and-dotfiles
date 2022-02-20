"
" vim-which-key
" - Keybinding popup display utility for vim/nvim
" Author: liuchengxu
"

"=================
" Plugin Settings
"=================
let g:which_key_map = {}
let g:which_key_map.t = {
            \ 'name' : '+terminal',
            \ ';' : [   ':FloatermNew --wintype=popup --height=6',      'terminal'  ],
            \ 'n' : [   ':FloatermNew node',                            'node'      ],
            \ 't' : [   ':FloatermToggle',                              'toggle'    ]
            \ }

"======================
" Plugin Command Calls
"======================
call which_key#register('<Leader>', "g:which_key_map")

"===================
" Plugin Remappings
"===================
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>' <CR>
