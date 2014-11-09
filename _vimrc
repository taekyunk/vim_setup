" setup different location depending on window/unix
let s:is_windows = has('win32') || has('win64')
if s:is_windows
    let s:vimplug_location = $VIM . '/vim_plugged'
else
    let s:vimplug_location = '~/.vim_plugged'
endif
call plug#begin(s:vimplug_location)
call plug#begin('~/.vim_plugged')

" colorscheme
Plug 'godlygeek/csapprox'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/wombat256.vim'
Plug 'jnurmine/Zenburn'

" plugins
Plug 'Townk/vim-autoclose'
Plug 'bling/vim-airline'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'urso/haskell_syntax.vim'
Plug 'vim-scripts/ShowMarks'
Plug 'vim-scripts/matchit.zip'

" snipmate related install
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" personal plugin 
Plug 'taekyunk/vim-tk-snippets'
Plug 'taekyunk/vim-tk-filetype-setting'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hardware
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" system
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " no compatibility with VI
set backup		" keep a backup file
set history=200		" keep n lines of command line history
" disable bell/visual bell
" http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=

augroup vimrcEx
    autocmd!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" |
                \ endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" microsoft windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://superuser.com/questions/697847/cant-run-vimdiff-7-4-on-windows-7
set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            if empty(&shellxquote)
                let l:shxq_sav = ''
                set shellxquote&
            endif
            let cmd = '"' . $VIMRUNTIME . '\diff"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
        let &shellxquote=l:shxq_sav
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" insert mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My personal setup using default commands/values in VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file type
" Enable filetype detection and loads 'ftplugin.vim'
" http://vimdoc.sourceforge.net/htmldoc/filetype.html
filetype plugin on

" indent
filetype indent on
set autoindent

" Tab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4 " makes the spaces feel like real tabs

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" editor screen
set number " show line number
set ruler		" show the cursor position all the time
set cursorline " highlight current line
set showcmd		" display incomplete commands

" disable folding
set nofoldenable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gui
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme/theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

if has('gui_running')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
else
    colorscheme wombat256mod
endif

" let g:rehash256 = 1
" colorscheme molokai
"
" colorscheme zenburn

"let g:kolor_italic=1                    " Enable italic. Default: 1
"let g:kolor_bold=1                      " Enable bold. Default: 1
"let g:kolor_underlined=0                " Enable underline. Default: 0
"let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0
"colorscheme kolor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use 'magic' for search always
" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap / /\v
vnoremap / /\v

" Move by screen line without count, but move by actual line with count
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
vnoremap <expr> k v:count == 0 ? 'gk' : 'k'
vnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" Add blank line
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" Use space and backspace to navigate with C-f & C-b
nnoremap <space> <C-f>
nnoremap <backspace> <C-b>
nnoremap <S-space> <C-b>

" Select visual block again after decreasing or increasing indent
vnoremap < <gv
vnoremap > >gv

" move between split
" http://benmccormick.org/2014/07/07/learning-vim-in-2014-working-with-files/
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" equal splits when resized
autocmd VimResized * wincmd =

" http://hashrocket.com/blog/posts/8-great-vim-mappings
" quit using <leader>q
noremap <leader>q :q<cr>
" save using <leader>s
nnoremap <leader>s :w<cr>
inoremap <leader>s <esc>:w<cr>
" apply macro with Q. qq to create macro using register q, quit with q
" apply with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" close buffer
nnoremap <leader>w :bd<cr>
inoremap <leader>w <esc>:bd<cr>

" Clear all trailing white spaces
" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>W :%s/\v\s+$//<cr>:let @/ = ""<cr>

" Shortcut to rapidly toggle `set list`
" http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>-,eol:?

" fast edit vimrc
nmap <leader>v :edit $MYVIMRC<CR>

" Clear search terms
nnoremap <silent> <leader><space> :nohlsearch<cr>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" NERDTree toggle
" http://stackoverflow.com/questions/2413005/switching-between-tabs-in-nerdtree?rq=1
map <F2> :NERDTreeToggle<cr>

" force refresh or redraw screen
nnoremap <F5> :redraw!<cr>

" copy & paste from system clipboard: F8 to copy/yank, F9 to paste
vnoremap <F8> "+y
nnoremap <F8> gg"+yG<C-o><C-o>
inoremap <F8> <esc>gg"+yG<C-o><C-o>
nnoremap <F9> "+p
inoremap <F9> <esc>"+p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Replace extended ASCII characters by similar looking ASCII code
function! ToAscii()
    :silent! %s/\%x91/'/g
    :silent! %s/\%x92/'/g
    :silent! %s/\%x93/"/g
    :silent! %s/\%x94/"/g
    :silent! %s/\%x95/ - /g
    :silent! %s/\%x96/-/g
    :silent! %s/\%x97/--/g
    :silent! %s/\%x85/.../g
endfunction

nnoremap <silent> <leader>ta :call ToAscii()<CR>

" Script to make pipe table header similar to EMACS org-mode
function! MakePipeTableHeader()
    :silent! normal yyp
    :silent! s/\v[^\|]/-/g
    :silent! s/\v-\|-/-+-/g
endfunction

nnoremap <silent> <leader>mth :call MakePipeTableHeader()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin related setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically justify table with | using tabular plugin
" From https://gist.github.com/287147
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" prevent conflict with snipmate and supertab
" https://github.com/amix/vimrc/issues/17
let g:SuperTabDefaultCompletionType = "context"

" EasyAlign
" For visual mode (e.g. vip<Enter>)
vmap <Enter>   <Plug>(EasyAlign)
" For normal mode, with Vim movement (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" showmarks plugin
" Do not display automatically set marks
" http://stackoverflow.com/questions/8720313/show-marks-plugin-causes-marks-to-pop-in-after-around-4-seconds
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" vim-sneak
let g:sneak#s_next = 1
let g:sneak#streak = 1
let g:sneak#use_ic_scs = 1
" force streak mode
nmap s <Plug>(SneakStreak)
nmap S <Plug>(SneakStreakBackward)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selectively load spell checker for some file types
" http://jhshi.wordpress.com/2012/11/05/enabledisable-spell-checking-according-to-file-type-in-vim/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" global setting
set nospell

augroup spellCheck
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter *.tex setlocal spell spelllang=en_us
    autocmd BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_us
    " autocmd BufNewFile,BufRead,BufEnter *.md setlocal spell spelllang=en_us
augroup END


