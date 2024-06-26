call plug#begin('~/.vim/plugged')

  " A collection of sensible defaults that nobody should object to
  Plug 'tpope/vim-sensible'
  " cd to project root when opening a buffer
  Plug 'airblade/vim-rooter'
  " Editor Config support for Vim
  Plug 'editorconfig/editorconfig-vim'

  " Search enhancements
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  " Project-wide search with rg
  Plug 'mhinz/vim-grepper'
    let g:grepper = {}
    let g:grepper.tools = ["rg"]
    " runtime autoload/grepper.vim
    let g:grepper.jump = 1
    nnoremap \ :GrepperRg<Space>
    nnoremap g* :Grepper -cword -noprompt<CR>
    xmap g* <plug>(GrepperOperator)
  " Make * useful in visual mode
  Plug 'bronson/vim-visual-star-search'
  " More sensible behaviour of f, F, t and T
  Plug 'rhysd/clever-f.vim'
    let g:clever_f_across_no_line = 1
    let g:clever_f_chars_match_any_signs = ';'

  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'
    let g:smoothie_base_speed = 10

  " UI / Theme
  " Theme
  Plug 'morhetz/gruvbox'
  " Shows in the gutter lines added/modified/removed since last commit
  Plug 'airblade/vim-gitgutter'
  " Provides a simple visual list of open buffers
  Plug 'ap/vim-buftabline'
  " Highlight matching pairs and provide better % functionality
  Plug 'andymass/vim-matchup'
  " Syntax highlighting for all
  Plug 'sheerun/vim-polyglot'

  " Useful keybindings for easier closing of buffers/windows
  Plug 'mhinz/vim-sayonara'

  " Tighter tmux integration
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'christoomey/vim-system-copy'
  Plug 'benmills/vimux'

  " Provides a motion to easily sort lines
  Plug 'christoomey/vim-sort-motion'

  " Useful keybindings for working with comments
  Plug 'tpope/vim-commentary'
  " Overrides default . functionality to work for some more complex atomic actions
  Plug 'tpope/vim-repeat'
  " Provides mappings to easily delete/change/add surrounding pairs
  Plug 'tpope/vim-surround'
  " Various useful [x and ]x pair bindings
  Plug 'tpope/vim-unimpaired'
  " Provides some nice Git integration for Vim
  Plug 'tpope/vim-fugitive'
  " Heuristically set buffer options (indent, tabs etc)
  Plug 'tpope/vim-sleuth'
  " Add some common UNIX commands within vim
  Plug 'tpope/vim-eunuch'

  " Text Objects
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-entire'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'terryma/vim-expand-region'
  Plug 'wellle/targets.vim'

  " Better definitions of w and b for camelCase and snake_case variables
  Plug 'chaoren/vim-wordmotion'

  " Better indenting for p, P
  Plug 'sickill/vim-pasta'
    let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml']
    let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']

  " Smart completion of matching pairs in insert mode
  Plug 'Raimondi/delimitMate'
  " Code completion framework. Supports LSP
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " Snippets manager
  Plug 'SirVer/ultisnips'
  " Show sensible snippets for various languages
  Plug 'honza/vim-snippets'

  " Save buffers automatically
  Plug '907th/vim-auto-save'
    let g:auto_save = 1
    let g:auto_save_silent = 1
    let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

  Plug 'TaDaa/vimade'

  " --------------------
  " Plugins on Trial
  " --------------------

  " Let's stop using hjkl so much
  " Plug 'takac/vim-hardtime'
  " Let's try indent guides again
  " Plug 'nathanaelkane/vim-indent-guides'
  "   let g:indent_guides_auto_colors = 0
  "   let g:indent_guides_enable_on_vim_startup=1
  "   " let g:indent_guides_guide_size=1
  "   let g:indent_guides_start_level=2
  "   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black


call plug#end()
