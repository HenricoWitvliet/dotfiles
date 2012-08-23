"------------------------------------------------------------
" Features {{{1
"
" use pathogen for plugins
call pathogen#infect()
call pathogen#helptags()

let mapleader = ','

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc

set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" General settings {{{1

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Search settings {{{1
"
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smarttab

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


set history=1000
set wildmenu
set wildmode=list:longest
set title
set nowrap
set showmatch

"---------------------------------
" extra opties

" Better Completion
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Unfuck my screen
nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Source
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Quick editing  {{{1

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" volgende van quickfix window (openen met :copen), voor gebruik met
" :vim /regex/ files*
nnoremap <C-N> :cn<cr>zzzv

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" set working directory to current file's directory and show it
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

set backupdir=$HOME/.vim/.temp//
set directory=$HOME/.vim/.temp//


if has("gui_macvim")
    " kopieren van en naar clipboard
    " Alleen F2, kopieren naar clipboard is echt nodig
    nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
    imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
    nmap <F2> :.w !pbcopy<CR><CR>
    vmap <F2> :w !pbcopy<CR><CR>
    set guifont=Monaco:h14
    set fuopt+=maxhorz 
"    set fu
" elseif has("unix")
"     "
" elseif has("gui_win32")
"     "
endif
" 
"------------------------------------------------------------
