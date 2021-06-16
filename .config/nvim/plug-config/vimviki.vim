" Ensure files are read as what I want:
	" map <leader>v :VimwikiIndex
	" let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.wiki'}]
	" let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  " let g:vimwiki_customwiki2html=$HOME.'/.config/nvim/autoload/plugged/vimwiki/customwiki2html.sh'

" ~~~~~ Ensure files are read as what I want in vimwiki:
" https://github.com/tallguyjenks/.dotfiles/blob/master/nvim/.config/nvim/init.vim
  let g:vimwiki_global_ext = 0
  " let g:vimwiki_markdown_link_ext = 1
  let g:vimwiki_root = '~/vimwiki'
  let g:vimwiki_listsyms = '✗○◐●✓'
  let g:vimwiki_list = [
      \{'path': '~/vimwiki',
      \'syntax': 'markdown',
      \'ext': '.wiki'}]
  let g:vimwiki_ext2syntax = {'.md': 'markdown',
        \'.markdown': 'markdown',
        \'.mdown': 'markdown'}
  let g:taskwiki_markdown_syntax = 'markdown'
      " \{'path': '~/vimwiki/pendidikan', 'syntax': 'markdown', 'ext':'.md'},
      " \{'path': '~/vimwiki/sosbud', 'syntax': 'markdown', 'ext':'.md'},
      " \{'path': '~/vimwiki/spirituil', 'syntax': 'markdown', 'ext':'.md'},
      " \{'path': '~/vimwiki/sci', 'syntax': 'markdown', 'ext':'.md'},
      " \{'path': '~/vimwiki/sci/linux', 'syntax': 'markdown', 'ext':'.md'},
      " \{'path': '~/vimwiki/sci/bash', 'syntax': 'markdown', 'ext':'.md'},
      " \{'path': '~/vimwiki/sci/latex', 'syntax': 'markdown', 'ext':'.md'},
      " \{'path': '~/vimwiki/sci/tech', 'syntax': 'markdown', 'ext':'.md'}]

" let g:vimwiki_use_calendar=1
" let g:vimwiki_folding='expr'
" let g:vimwiki_table_mappings = 0

" syntax match todoCheckbox '\v.*\[\ \]'hs=e-2 conceal cchar=
" syntax match todoCheckbox '\v.*\[X\]'hs=e-2 conceal cchar=
" setlocal conceallevel=2
" hi Conceal guibg=NONE
