syntax on
syntax enable
call plug#begin('~/.vim/plugged')
"windows
Plug 'scrooloose/nerdtree',
Plug 'kien/ctrlp.vim'
"theme
Plug 'beikome/cosme.vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
"text
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'chun-yang/auto-pairs'
Plug 'sirver/ultisnips'
Plug 'scrooloose/syntastic'
" Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'w0rp/ale'
"find
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'

" Plug 'pearofducks/ansible-vim'
" Plug 'rhysd/vim-crystal'
" Plug 'slim-template/vim-slim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'kamykn/spelunker.vim'
"md
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-sensible'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }

Plug 'vim-scripts/BufOnly.vim'

Plug 'prettier/vim-prettier'

" Plug 'dhruvasagar/vim-table-mode'

call plug#end()
set autoread " To auto read when a file is changed from outside
set number
set relativenumber
highlight LineNr guifg=#ab9f9f
let g:mapleader=','
set laststatus=2
" Backup and swap
set noswapfile
set nobackup
set nowritebackup
set mouse=nicr
" exit to normal mode with 'jj'
"inoremap jk <ESC>
"paste ; at line end
nnoremap ; A;<ESC><CR>
"theme"
let g:materialmonokai_italic=1
set t_Co=256
set background=dark
set termguicolors
"colorscheme "material-monokai" 
" colorscheme "cosme"

colorscheme gruvbox
let g:airline_theme='minimalist'
" CtrlP
let g:ctrlp_regexp = 1
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 0
nmap <C-i> :CtrlPBuffer<cr>
let g:ctrlp_user_command =  ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_max_depth=1000
let g:ctrlp_custom_ignore = '\v[/].(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[/].(git|hg|svn)$',
\ 'file': '\v.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }
"UtilSnips
set nocompatible
filetype on
filetype plugin on
"set runtimepath+=~/.vim/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" Auto save
set autowrite
set autowriteall
autocmd FocusLost * :wa
autocmd CursorHold,CursorHoldI * update
nmap <C-s> :wa <CR>

"window settings
set cursorline

" Search options
set is
set hls
set ic

"show characters
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·,
set listchars=tab:¦·,trail:~,extends:>,precedes:<,space:·,
" set listchars=tab:°·,trail:~,extends:>,precedes:<,space:·,
set list

" Tab options
set tabstop=2
set shiftwidth=2
set et

set expandtab
set nosmarttab
" autocmd FileType jsx noexpandtab nosmarttab

" Insert empty lines in normal mode
nnoremap - o<esc>
nnoremap _ O<esc>

"emmet
let g:user_emmet_leader_key='<c-e>'

" Visual settings for gui
if has("gui_running")
  set guifont=dejavu\ sans\ mono\ 11
  set guioptions-=T
  set lines=50
  set columns=188
  winp 1 1
end
if has("gui_macvim")
  set guifont=Monaco:h16
end

" NERD tree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
nmap <leader>t :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
map <leader>r :NERDTreeFind<cr>
" remember cursor line (see /etc/vim/vimrc)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Search in typical rails project
command! -nargs=1 Fi :vim <args> app/assets/javascripts/** app/assets/stylesheets/** app/[b-z]*/** test/** spec/** config/** db/migrate/** lib/** doc/**

" Open file on linenumber
function! s:gotoline()
  let file = bufname("%")
  if (filereadable(file))
    return
  endif

  let names =  matchlist( file, '\(.\{-1,}\):\(\d\+\)')
  if empty(names)
    return
  endif

  let file_name = names[1]
  let line_num  = names[2] == ''? '0' : names[2]

  if filereadable(file_name)
    exec "edit " . file_name
    exec ":" . line_num
  endif
endfunction

autocmd! BufNewFile *:* nested call s:gotoline()
autocmd! BufRead *:* nested call s:gotoline()

" EasyBuffer
" nmap <leader>b :EasyBuffer<cr>

"easyMotion
map <Leader> <Plug>(easymotion-prefix)
"windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


nmap j gj
nmap k gk
"nnoremap <C-h> :call WinMove('h')<CR>
"nnoremap <C-j> :call WinMove('j')<CR>
"nnoremap <C-k> :call WinMove('k')<CR>
"nnoremap <C-l> :call WinMove('l')<CR>
"
"
"function! WinMove(key)
"  let t:curwin = winnr()
"  exec "wincmd ".a:key
"  if (t:curwin == winnr())
"    if (match(a:key, '[jk]'))
"      wincmd w
"    else
"      wincmd s
"    endif
"    exec "wincmd ".a:key
"  endif
"endfunction

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>
"ident guide
""let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray ctermbg=08
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=232

"syntastic

let syntastic_javascript_checkers = ['eslint'] 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"ale - lint jsx
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '💣' " Less aggressive than the default '>>'
let g:ale_sign_warning = '►'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'typescriptreact': ['tsserver', 'tslint'],
\}
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'typescriptreact': ['prettier', 'eslint'],
\    'css': ['prettier'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1
" let b:ale_linters = ['eslint', 'jshint']
let g:ale_linters_explicit = 1
let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_typescript_tslint_config_path = ''
let g:ale_typescript_tslint_executable = 'tslint'
let g:ale_typescript_tslint_ignore_empty_files = 0
let g:ale_typescript_tslint_rules_dir = ''
let g:ale_typescript_tslint_use_global = 0
let g:ale_typescript_tsserver_config_path = ''
let g:ale_typescript_tsserver_executable = 'tsserver'
let g:ale_typescript_tsserver_use_global = 0
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

"markdown md
let g:mkdp_auto_close = 0
"russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
inoremap jj <C-^>
"insert one char
nnoremap <Space> i_<Esc>r
"copy
nnoremap <C-y> "+y
vnoremap <C-y> "+y
"copy path
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>
"clean buffers
nmap ,bc :BufOnly<CR>
"go to previous buffer
nmap <leader>b :bp<cr>
"folding (open cloze blocks)
"set foldenable " отклключить фолдинг по умолчанию
"set foldmethod=syntax " определять блоки на основе синтаксиса файла
"set foldmethod=indent " определять блоки на основе отступов
"set foldnestmax=10       "deepest fold is 3 levels
"set nofoldenable
""set foldcolumn=10 " показать полосу для управления сворачиванием
"set foldlevel=3 " Первый уровень вложенности открыт, остальные закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в них
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.js,*.jsx,*.json,*.md,*.ts,*tsx call spelunker#check()
augroup END

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-json', 
  \ ]

  " \ 'coc-pairs',
  " \ 'coc-tsserver',
  " \ 'coc-eslint', 
  " \ 'coc-prettier', 



" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup
" Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-c> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

