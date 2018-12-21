" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

set nocompatible

"Tabs
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set scrolloff=8
set autoindent " Same indentation as previous line

"GVIM no menu
set guioptions=agitc

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"highlight of white space
highlight ExtraWhiteSpace ctermbg=1 guibg=red
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"Highligt over 120 chars
set colorcolumn=120

"Line numbers
set number
set relativenumber

"Colors
colorscheme happy_hacking

"Font (size only gvim, vim use terminal size)
set guifont=Monospace\ 9

"Tabs
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew

"Misc
if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif

set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Also switch on highlighting the last used search pattern.
set hlsearch

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" For all text files set 'textwidth' to 120 characters.
autocmd FileType text setlocal textwidth=120

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.

"autocmd BufReadPost *
"
"  \ if line("'\"") > 1 && line("'\"") <= line("$") |
"  \   exe "normal! g`\"" |
"  \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

" Cool stuff
nnoremap <F9> :!python %<CR>
nnoremap <F10> :!pylint % \| tee pyres<CR>
nnoremap <F11> :tabnew pyres<CR>
nnoremap <F12> :source ~/.vimrc<CR>
set tags=./tags,tags;$HOME
