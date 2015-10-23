""
"" Plug.vim ""
""
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'docunext/closetag.vim'
Plug 'scrooloose/syntastic'
Plug 'groenewege/vim-less'
Plug 'digitaltoad/vim-jade'

""
"" Clojure ""
""

Plug 'guns/vim-clojure-static',    { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'tpope/vim-salve',            { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',        { 'for': 'clojure' }
Plug 'venantius/vim-eastwood',     { 'for': 'clojure' }
Plug 'vim-scripts/Paredit.vim',    { 'for': 'clojure' }
Plug 'luochen1990/rainbow',        { 'for': 'clojure' }

call plug#end()

""
"" SYNTAX HIGHLIGHTING
""
"" -- colors
""
set t_Co=256
syntax enable
colorscheme molokai

""
"" -- filetype exceptions
""
au BufRead,BufNewFile Podfile,Gemfile,*.podspec set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.zsh-theme set filetype=sh
au BufRead,BufNewFile *.less set filetype=css

""
"" KEYBINDINGS
""
imap <Up>    <NOP>
imap <Down>  <NOP>
imap <Left>  <NOP>
imap <Right> <NOP>
map  <Up>    <NOP>
map  <Down>  <NOP>
map  <Left>  <NOP>
map  <Right> <NOP>

""
"" -- plugins
""
noremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

""
"" EDITING 
""
set backspace=2

""
"" INDENTATION
""
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap

""
"" SPLITTING 
""
set splitbelow
set splitright

""
"" LINE NUMBERS 
""
set number
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

""
"" BACKUP/UNDO 
""
set backupdir=~/.vim/backup,/tmp
set backup

set undodir=~/.vim/undodir
set undofile

""
"" vim-airline
""
set laststatus=2

""
"" Syntastic 
""
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }

""
"" AUTOCOMPLETE 
""
"" -- closetag 
""
autocmd FileType html let b:closetag_html_style=1
autocmd FileType html source ~/.vim/plugged/closetag.vim/plugin/closetag.vim

"" TODO: not sure why ftplugin for closure isn't working
let g:rainbow_active = 1

