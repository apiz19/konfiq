let g:vimwiki_markdown_link_ext = 1
let g:zettel_format = "%y%m%d-%H%M-%title"
let g:zettel_default_mappings = 0
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_fzf_options = ['--exact', '--tiebreak=end']
let g:zettel_backlinks_title = "Backlinks"
let g:zettel_link_format="[%title](%link)"
let g:nv_search_paths = ['~/vimwiki/']
" This is basically the same as the default configuration
" augroup filetype_vimwiki
"   autocmd!
"   autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
"   autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
"   autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
"   autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
" augroup END
