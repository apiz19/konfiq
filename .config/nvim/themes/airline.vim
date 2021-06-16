" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme='base16_gruvbox_dark_hard'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
" set noshowmode

" Human readable Line number
function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})

let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

" Overriding the inactive statusline
" function! Render_Only_File(...)
"   let builder = a:1
"   let context = a:2

"   call builder.add_section('file', '!! %F')

"   return 0   " the default: draw the rest of the statusline
"   return -1  " do not modify the statusline
"   return 1   " modify the statusline with the current contents of the builder
" endfunction
" call airline#add_inactive_statusline_func('Render_Only_File')
