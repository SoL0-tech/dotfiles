" Use vim settings, rather than Vi (much better!)
set nocompatible
set t_Co=256

execute pathogen#infect()

set number                      "Line numbers are good
set relativenumber              " +1 for relative line numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set encoding=utf-8              " Encoding
set ttyfast                     " Rendering
set mouse=a
set whichwrap+=<,>,h,l
set matchpairs+=<:>             "For % matching
set history=1000                "Store lots of :cmdline history
set updatetime=100              "Reduce update time
set noesckeys                   "(hopefully) fix the delay returning to Normal mode
set ttimeout
set ttimeoutlen=1
set showcmd                     "Show incomplete cmds at the bottom
set showmode                    "Show current mode at the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set wildmenu                    "Better completion on command line
set wildmode=list:full          "What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set lazyredraw
set ttyfast
syntax on                       "Enable syntax highlighting
colorscheme ThemerVim           "Colorscheme
set hidden                      "Allow buffers in the background
set hid                         "A buffer becomes hidden when abandoned
let mapleader=","               "Remap the leader key

" == Turn off swapfiles ==
set noswapfile
set nobackup
set nowb

" == Persistent Undo ==
" Persist undo history across sessions
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" == Indentation ==
set autoindent
set cindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
" inoremap {<CR> {<CR>}<ESC>O      " Won't work with autoclose plugin

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Enable filetype plugins and indentation
filetype plugin indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set shiftround   "When at 3 spaces and I hit >>, go to 4, not 5.
set linebreak    "Wrap lines at convenient points

" == Folds ==
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" == Search ==
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set magic           " Turn magic on for regular expressions

" ====== LEADER COMMANDS ======

" Quick saving
nmap <leader>w :w!<cr>

" Make it easier to make life easier
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Surround word in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel

" ====== EASYMOTION CONFIG =======
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Use Silver Searcher instead of grep
set grepprg=ag

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0"

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Always show current position
set ruler
" Highlight current line
" set cursorline
" hi CursorLine   cterm=NONE ctermbg=23 ctermfg=white guibg=darkred guifg=white
" hi CursorLine   cterm=NONE ctermbg=29 ctermfg=white guibg=darkred guifg=white
" hi CursorLine   cterm=NONE ctermbg=59 ctermfg=white guibg=darkred guifg=white
hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
hi CursorLine   cterm=NONE ctermbg=23 ctermfg=white guibg=darkred guifg=white
" Height of the command bar
set cmdheight=1
" Extra margin to the left
"set foldcolumn=1
" Show matching brackets when indicator is over them
set showmatch
" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow
" Spaces over tabs
set expandtab
" Be smart with the tab action
set smarttab
inoremap <Tab> <C-P>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj
nnoremap H 0
nnoremap L $
nnoremap J G
nnoremap K gg

nnoremap vv 0v$

inoremap <leader><leader> <Esc>/<++><Enter>"_c4l

" Don't automatically continue comments after newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Return to last edit position when opening files :)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" ====== MAPPINGS ======
" Remap VIM 0 to first non-blank character
map 0 ^

" Esc remap in insert mode
inoremap jk <esc>

" Fix Alt-key mappings
for i in range(97,122)
  let c = nr2char(i)
    exec "map \e".c." <M-".c.">"
    exec "map! \e".c." <M-".c.">"
endfor " "

" File and Window Management 
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>

inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>

inoremap <leader>x <ESC>:x<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>e :Ex<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <∆> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <∆> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Duplicate the current lime and paste it below
imap <M-C-j> <Esc>Ypi
nmap <M-C-j> <Esc>Yp

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" ======== LANGUAGE-SPECIFIC CONFIG ===========

let g:typescript_indent_disable = 1

let g:javascript_plugin_jsdoc = 1

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
