let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
    \'a'    : '#S',
    \'c'    : ['#(whoami)', '#(uptime  | cut -d " " -f 1,2,3)'],
    \'win'  : ['#I', '#W'],
    \'cwin' : ['#I', '#W', '#F'],
    \'x'    : '#(date)',
    \'y'    : ['%R', '%a', '%Y'],
    \'z'    : '#H'}
let g:tmuxline_preset = 'righteous'

let g:tmuxline_separators = {
  \ 'left' : '',
  \ 'left_alt': '>',
  \ 'right' : '',
  \ 'right_alt' : '<',
  \ 'space' : ' '}

let g:tmuxline_status_justify = 'left'

" tmux_conf_theme_status_left=" #{prefix}#{mouse} #S | "
" tmux_conf_theme_status_right=" #{pairing}#{synchronized}, %I:%M%p , %d %b | #{username}#{root} |"
