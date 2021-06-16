
let g:startify_custom_header = [
 \ '     ___         ___         ___                                ___     ',
 \ '    /__/\       /  /\       /  /\          ___      ___        /__/\    ',
 \ '    \  \:\     /  /:/_     /  /::\        /__/\    /  /\      |  |::\   ',
 \ '     \  \:\   /  /:/ /\   /  /:/\:\       \  \:\  /  /:/      |  |:|:\  ',
 \ ' _____\__\:\ /  /:/ /:/_ /  /:/  \:\       \  \:\/__/::\    __|__|:|\:\ ',
 \ '/__/::::::::/__/:/ /:/ //__/:/ \__\:\  ___  \__\:\__\/\:\__/__/::::| \:\',
 \ '\  \:\~~\~~\\  \:\/:/ /:\  \:\ /  /:/ /__/\ |  |:|  \  \:\/\  \:\~~\__\/',
 \ ' \  \:\  ~~~ \  \::/ /:/ \  \:\  /:/  \  \:\|  |:|   \__\::/\  \:\      ',
 \ '  \  \:\      \  \:\/:/   \  \:\/:/    \  \:\__|:|   /__/:/  \  \:\     ',
 \ '   \  \:\      \  \::/     \  \::/      \__\::::/    \__\/    \  \:\    ',
 \ '    \__\/       \__\/       \__\/           ~~~~               \__\/    ',
 \]

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

function! s:list_commits()
    let git = 'git -C ~/doc/TGA/Workspaces/latex-skripsi'
    let commits = systemlist(git .' log --oneline | head -n10')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_bookmarks = [
            \ { 'w': '~/vimwiki/index.wiki' },
            \ '~/doc/TGA/Workspaces/latex-skripsi'
            \ ]

let g:startify_enable_special = 0
