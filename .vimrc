syntax on
syntax enable
call plug#begin('~/.vim/plugged')
"windows
Plug 'scrooloose/nerdtree',
Plug 'kien/ctrlp.vim'
"theme
Plug 'crusoexia/vim-monokai'
Plug 'beikome/cosme.vim'
"text
"Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'chun-yang/auto-pairs'
Plug 'sirver/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
"find
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'

Plug 'pearofducks/ansible-vim'
Plug 'rhysd/vim-crystal'
Plug 'slim-template/vim-slim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
"md
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }

Plug 'vim-scripts/BufOnly.vim'

Plug 'prettier/vim-prettier'
Plug 'mxw/vim-jsx'

Plug 'dhruvasagar/vim-table-mode'

call plug#end()
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
colorscheme "cosme"
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

set noexpandtab
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
let g:ale_linters = {'javascript': ['eslint']}

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

