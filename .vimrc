let mapleader = ","
let maplocalleader = "\\"

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set nowrap      "dont wrap lines
set linebreak   "wrap lines at convenient points

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator

" RVM and Git status
"set statusline+=%{rvm#statusline()}
"set statusline+=\ %{fugitive#statusline()}

"set statusline+=\ %c,     "cursor column
"set statusline+=%l/%L     "cursor line/total lines
"set statusline+=\ %P      "percent through file
"set laststatus=2

" NerdTree
"autocmd vimenter * NERDTree | wincmd p   "opens nerdTree when vim starts and puts the curser in the main window
"autocmd vimenter * if !argc() | NERDTree | endif   "opens nerdTree even of no files are opened

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Pathogen (used to install nerdtree etc.)
call pathogen#infect()

" Solarized color theme for vim
set bg=dark
colorscheme solarized
let g:solarized_style="light"
let g:solarized_italic=0
let g:solarized_contrast="high"

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"disable left scrollbar
set guioptions-=L

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces
set list
set listchars=tab:\ \ ,extends:>,precedes:<

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"turn on syntax highlighting
syntax on

"hide buffers when not displayed
set hidden

"map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>

"map Q to something useful
noremap Q gq

"map ( " and , to autocomplete


"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" show line numbers
set number

" show tabs and trailing spaces by default
"set list
"set listchars=tab:·-,extends:>,precedes:<,trail:·

" some better visual cues in diffs
highlight diffRemoved guifg=#FF3366
highlight diffAdded guifg=#00FF66

" change font size quickly
" works if your guifont is set to something like "Monaco\ 10"
nnoremap <C-Up>   :let &guifont = substitute(&guifont, '\d\+$', '\=eval(submatch(0)+2)', '')<CR>
nnoremap <C-Down> :let &guifont = substitute(&guifont, '\d\+$', '\=eval(submatch(0)-2)', '')<CR>

" ignore some files for quick open
let g:fuzzy_ignore = "*.log;*.png;*.jpg;*.gif;*.xcf;*.ico;tmp/;cache/;vendor/**;node_modules/**"
let g:fuzzy_matching_limit = 25

" align assignments
map <Leader>ah  :Tab/=><CR>
map <Leader>a=  :Tab/=<CR>
map <Leader>a== :Tab/==<CR>
map <Leader>a:  :Tab/:\zs<CR>
map <Leader>a\| :Tab/\|<CR>

" wrap the cursor to prev/next line
set whichwrap=<,>,h,l,[,]

" do not save to register when deleting single characters
" note: put this also in after/plugin/yankring.vim
nnoremap <silent> x "_x
nnoremap <silent> X "_X

" project drawer
nnoremap <silent> <Leader>p :NERDTreeToggle<CR>

" fuzzy finder (disabled for now since i'm new)
"let g:fuf_modesDisable = []
"let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|vendor/|_site|node_modules|^tmp'
"nnoremap <silent> <Leader>t :FufCoverageFile<CR>
"nnoremap <silent> <Leader>T :FufBufferTagAll<CR>
"nnoremap <silent> <Leader>y :FufBuffer<CR>
"nnoremap <silent> <Leader>r :FufMruFile<CR>
"nnoremap <silent> <Leader>: :FufMruCmd<CR>
"nnoremap <silent> <Leader>m :FufChangeList<CR>
"nnoremap <silent> <Leader>F :FufRenewCache<CR>
"nnoremap <silent> <C-\> :FufBufferTagAllWithCursorWord!<CR>
"vnoremap <silent> <C-\> :FufBufferTagAllWithSelectedText!<CR>

" undo
nnoremap <silent> <Leader>u :GundoToggle<CR>

" new buffer
nnoremap <silent> <Leader>n :enew<CR>

" close current buffer
nnoremap <silent> <Leader>w :BD<CR>
nnoremap <silent> <Leader>W :BD!<CR>

" window bindings
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l
nnoremap <silent> <Leader>H <C-w>H
nnoremap <silent> <Leader>J <C-w>J
nnoremap <silent> <Leader>K <C-w>K
nnoremap <silent> <Leader>L <C-w>L
nnoremap <silent> <Leader>q <C-w>q
nnoremap <silent> <Leader>o :ZoomWin<CR>
nnoremap <silent> <Leader>s <C-w>s<C-w>j
nnoremap <silent> <Leader>ss <C-w>s<C-w>j
nnoremap <silent> <Leader>v <C-w>v<C-w>l
"nnoremap <silent> <Leader>' <C-W><C-W>

" vimdiff bindings
nnoremap <silent> <Leader>dgh :diffget //2<CR>
nnoremap <silent> <Leader>dgl :diffget //3<CR>

" cycle through open buffers
nnoremap <silent> <Leader>/ <C-^>

" change CWD to path of current file
nnoremap <silent> <Leader>c :cd %:p:h<CR>

" split line / split line and join next line
nnoremap SS i<CR><Esc>k$
nnoremap SJ i<CR><Esc>$J

" show changes since last save
nnoremap <C-D> :DiffChangesPatchToggle<CR>

" ruby
imap <silent> <A-=> <space>=><space>
au BufWritePost *.rb,*.rake silent! !ctags % &

" git
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit -v<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>gl :Git log --stat<CR>

" firefox
function! RefreshFirefox()
  silent !echo 'BrowserReload(); repl.quit();' | nc localhost 4240 2>&1
endfunction
nnoremap <silent> <Leader>fr :call RefreshFirefox()<CR>

" encryption
set cm=blowfish

" reload .vimrc
nnoremap <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

