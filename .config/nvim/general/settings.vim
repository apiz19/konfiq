" set leader key
let g:mapleader = "\<Space>"

set autoread " trigger `autoread` when files changes on disk
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  " autocmd FileChangedShellPost * " notification after file change
  "   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
set complete+=kspell                    " set spell spelllang=en_gb
syntax on                               " Enables syntax highlighing
set path+=**
set hidden                              " Required to keep multiple buffers open multiple buffers
"set nowrap                              " Display long lines as just one line
set linebreak                           " Prenents words from breaking over line
set breakindent                         " Indent wrapped lines
  let &showbreak='  '                   " Indent amount
set encoding=UTF-8                      " The encoding displayed
" set guifont=Hack\ Nerd\ Font\ 11        " Set font
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow splitright               " Horizontal splits will automatically be at rightbelow
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set expandtab                           " Converts tabs to spaces
set tabstop=4                           " Insert 4 spaces for a tab
" set softtabstop=2                       "
set shiftwidth=2                        " Change the space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set autoindent                          " Good auto indent
set smartindent                         " Makes indenting smart
set laststatus=2                        " Always display the status line
set relativenumber                      " Relative Line numbers
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set cursorcolumn                        " Enable highlighting of the current column
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" met background=dark                     " tell vim what the background color looks like
" set showtabline=0                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT --
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
" set backupdir=~/.config/nvim/backup
" set directory=~/.config/nvim/swap//
set scrolloff=7

" let &backupdir = expand('~/.config/nvim/backup//') " Folder for backup files
" if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory
set nocompatible
filetype plugin on
filetype on

" makes vim look for filetype specific settings in nvim/ftplugin/ and
" sets indenting by file type
filetype plugin indent on

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" For highlighting yanked text in nvim (but didn't work)
" augroup highlight_yank
"     autocmd!
"     au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
" augroup END

" set wildmenu                            " autocomplete in command mode
set wildmode=longest,full                  " settings for wildmenue
" set indentexpr= '-'
" set comments=fb:*,fb:-,fb:+,n:>
" set formatoptions=tcroqn
" let g:vim_indent_cont = shiftwidth() * 3

let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

" ----------------------------------------- "
" This setting stolen from Luke's config    "
" ----------------------------------------- "

" Check file in shellcheck:
	" map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	" map <leader>b :vsp<space>$BIB<CR>
	" map <leader>r :vsp<space>$REFER<CR>

" Open corresponding .pdf/.html or preview
	" map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre *.[ch] %s/\%$/\r/e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Set spell check Indonesian
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=id
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=id

" opening nonvim ext. with xdg-open
  " augroup nonvim
  "    au!
  "    au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
  "    au BufRead *.ppt*,*.doc*,*.rtf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
  " augroup end
