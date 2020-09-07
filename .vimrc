syntax on
syntax enable
call plug#begin('~/.vim/plugged')
"windows
Plug 'scrooloose/nerdtree',
"theme
Plug 'morhetz/gruvbox'
"text
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
"find
Plug 'easymotion/vim-easymotion'

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/BufOnly.vim'

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
nnoremap ; A;<ESC><CR>
"theme"
let g:materialmonokai_italic=1
set t_Co=256
set background=dark
" set termguicolors

colorscheme gruvbox
let g:airline_theme='minimalist'

" Auto save
set autowrite
set autowriteall
autocmd FocusLost * :wa
autocmd CursorHold,CursorHoldI * update
nmap <C-s> :wa <CR>

"fzf
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>p :Buffers<CR>

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

"easyMotion
map <Leader> <Plug>(easymotion-prefix)
"windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


nmap j gj
nmap k gk

"russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
inoremap jj <C-^>
"insert one char
nnoremap <leader><Space> i_<Esc>r
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

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-json', 
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-jest',
  \ ]

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

