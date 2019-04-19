" =-=-=--=-=-=-= PLUGIN CONFIGURATION =-=-=--=-=-=-=

" Rooter {{{
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['composer.json', 'package.json', '.git/']
let g:rooter_silent_chdir = 1
" }}}
" Ack {{{
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  set grepprg=rg\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
cnoreabbrev Ack Ack!
nnoremap \ :Ack!<Space>
" }}}
" CtrlP {{{
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|NerdTree'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" noremap <c-i> :CtrlPTag<CR>
noremap <silent> <c-b> :CtrlPBuffer<CR>
" }}}
" BufTabline {{{
let g:buftabline_numbers=1
let g:buftabline_indicators=1
" }}}
" Gutentags {{{
" let g:gutentags_cache_dir = '~/.vim/gutentags'
" let g:gutentags_project_root = ['composer.lock', 'package.json']
" let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
"       \ '*.phar', '*.ini', '*.rst', '*.md',
"       \ '*vendor/*/test*', '*vendor/*/Test*',
"       \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
"       \ '*var/cache*', '*var/log*', '*.vim']

" " Refresh the status bar when tagging has started/finished
" augroup MyGutentagsStatusLineRefresher
"   autocmd!
"   autocmd User GutentagsUpdating call airline#update_statusline()
"   autocmd User GutentagsUpdated call airline#update_statusline()
" augroup END
" }}}
" Sayonara {{{
let g:sayonara_confirm_quit = 0
" }}}
" IndentLine {{{
" let g:indentLine_char = '¦'
" let g:indentLine_setColors = 1
" let g:indentLine_enabled = 0
" let g:indentLine_setConceal = 2
" }}}
" Polyglot {{{
" e.g. g:polyglot_disabled = ['typescript']
" }}}
" Python {{{
let g:loaded_python_provider = 1
let g:python_host_skip_check= 1
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_skip_check = 1
let g:python3_host_prog = '/usr/local/bin/python3'
" }}}
" Matchup {{{
let g:loaded_matchparen = 1
" }}}
" DelimitMate {{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 0
let g:delimitMate_smart_quotes = 1
let g:delimitMate_smart_matchpairs = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_backspace = 1
" }}}
" Ultisnips {{{
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}
" Tmux Navigator {{{
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_save_on_switch = 1
" }}}
" LanguageClient {{{

  let g:LanguageClient_serverCommands = {
    \ 'typescript': ['typescript-language-server', '--stdio']
  \ }
  let g:LanguageClient_rootMarkers = ['.git']

" }}}
" COC {{{

  " " Use <TAB> to select the popup menu:
  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm complete
  inoremap <silent> <expr> <cr> (pumvisible() ? "\<C-y>" : "<C-R>=delimitMate#ExpandReturn()\<CR>")

  " Remap keys for gotos and quick actions
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> gt <Plug>(coc-type-definition)
  nnoremap <silent> gr <Plug>(coc-references)
  nnoremap <silent> gi <Plug>(coc-implementation)
  nnoremap <silent> <leader>rn :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>qf  <Plug>(coc-fix-current)

" }}}
" vim:foldmethod=marker:foldlevel=0
