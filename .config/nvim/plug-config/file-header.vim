let g:fileheader_auto_add = 0
let g:fileheader_auto_update = 1
let g:fileheader_author = 'Hafiz C.'
let g:fileheader_default_email = 'kopishitam@disroot.org'
let g:fileheader_show_email = 1
let g:fileheader_by_git_config = 0
let g:fileheader_new_line_at_end = 1

 let g:fileheader_delimiter_map = {
   \ 'markdown': { 'begin': '---', 'char': '', 'end': '---' },
   \ 'tex': { 'begin': '%%', 'char': '%', 'end': '%%' }
   \ }

 let g:fileheader_templates_map = {
   \ 'markdown': [
     \ 'author: {{author}}',
     \ 'created_date: {{created_date}}',
     \ 'modified_date: {{modified_date}}',
     \ 'title: this is title',
     \ ]
   \ }
