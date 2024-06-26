" =-=-=--=-=-=-= GENERAL CONFIG =-=-=--=-=-=-=

" Colors {{{
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
set background=dark
syntax enable

" Transparent background
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" TODO Sift through these overrides and decide for colorscheme
" Make it more obvious which paren I'm on
" hi MatchParen cterm=bold ctermbg=NONE ctermfg=yellow
" Split bar styles
" hi VertSplit cterm=NONE ctermbg=Black ctermfg=Gray
" hi HorizontalSplit cterm=NONE ctermbg=Black ctermfg=Gray
" Search highlight colors
" hi Search cterm=bold ctermbg=Yellow ctermfg=Black

hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

" }}}
" Spaces and Tabs {{{
" set tabstop=2                       " Number of visual spaces per tab
" set softtabstop=2                   " Number of spaces for tab when editing
" set expandtab                       " Tabs are spaces
set nolist
" set list listchars=tab:»·,trail:·   " Display tabs and trailing spaces visually
" }}}
" File Options {{{

  " Don't mess with the file's original EOL situation
  set nofixeol

  " Return to last edit position when opening files :)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " If file is already open, edit anyway and warn user
  autocmd SwapExists * let v:swapchoice = "e" | echomsg "Concurrent editing"

" }}}
" Editing {{{
  augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END

  set formatoptions=tn21

  " Make sure the undo stack retains changes past the first level
  set cpoptions-=u
  set undofile
  set undodir=$HOME/.vim/undo
" }}}
" Netrw {{{
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide = netrw_gitignore#Hide()
" }}}
" UI Config {{{
set number                      " Line numbers are good...
set relativenumber              " Relative numbers ftw
set nocursorline                " Don't highlight the current line
set noshowmode                  " Status bar already shows mode
set cmdheight=1                 " Height of the command bar
set showmatch                   " Highlight matching pairs
set matchpairs+=<:>             " Add some pair definitions
set diffopt+=vertical           " Use vertical split for Git diffs
set mouse=nv                    " Enable mouse only in normal and visual modes
set splitbelow                  " Open horizonal splits below
set splitright                  " Open vertical splits to the right
" }}}
" Searching {{{
set hlsearch          " Highlight search results
set ignorecase        " Ignore case when searching...
set smartcase         " ...unless we type a capital
set magic             " Turn magic on for regular expression
set inccommand=split  " Show live previews for substitutions
set grepprg=ag        " Use ag instead of grep for vim-search
set wildignore+=*/.git/*,*/node_modules/*   " Ignore some folders when searching
" }}}
" Folding {{{
set foldenable          " Enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set modelines=1         " Allow modelines to override settings per file
set foldmarker={{{,}}}
" }}}
" Line Wrapping {{{
set nowrap                      " Don't wrap lines
set whichwrap+=<,>,h,l          " Allow specified keys to move over wrapped lines
set linebreak                   " When wrapping is on, wrap lines at sensible points
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set updatetime=100              " How often to write swapfile to disk
" }}}
" Performance {{{
set lazyredraw                  " Redraw only when we need to
set hidden                      " Allow buffers to stay open in the background
" }}}
" Miscellaneous {{{
set visualbell                  " No sounds
" allow moving cursor just after the last chraracter of the line
set virtualedit=onemore
" }}}

" vim:foldmethod=marker:foldlevel=0
