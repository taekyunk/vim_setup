" setup different location depending on window/unix
let s:is_windows = has('win32') || has('win64')
if s:is_windows
    let s:plugin_location = $VIM . '/vim_plugged'
else
    let s:plugin_location = '~/.vim_plugged'
endif

call plug#begin(s:plugin_location)

" colorscheme
Plug 'godlygeek/csapprox'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/wombat256.vim'
Plug 'jnurmine/Zenburn'

" plugins
Plug 'Townk/vim-autoclose'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
" Need tabular to align pipe table automatically later
Plug 'godlygeek/tabular'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/matchit.zip'
Plug 'haya14busa/incsearch.vim'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tommcdo/vim-exchange'

" language
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'urso/haskell_syntax.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'

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
function! MyDiff()
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
set relativenumber " relative line number
set ruler " show the cursor position all the time
set cursorline " highlight current line
set showcmd " display incomplete commands

" disable folding
set nofoldenable

" encoding
set encoding=utf-8

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
vnoremap ; :

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use 'magic' for search always
" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap / /\v
vnoremap / /\v

" similar to emacs Occur
" http://travisjeffery.com/b/2011/10/m-x-occur-for-vim/
nmap g/ :vimgrep /<C-R>//j %<CR>\|:cw<CR>

" Move by screen line without count, but move by actual line with count
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> j v:count == 0 ? 'gj' : 'j'

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

" allow moving into blank space in visual block mode
set virtualedit=block

" consistent with C and D
nnoremap Y y$

" split using | and _
nnoremap <expr><silent> \| !v:count ? "<C-W>v<C-W><Right>" : '\|'
nnoremap <expr><silent> _  !v:count ? "<C-W>s<C-W><Down>"  : '_'

" make split more intuitively
set splitbelow
set splitright

" move between split
" http://benmccormick.org/2014/07/07/learning-vim-in-2014-working-with-files/
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" equal splits when resized
autocmd VimResized * wincmd =

" http://hashrocket.com/blog/posts/8-great-vim-mappings
" quit using <leader>q
noremap <leader>q :q<cr>
" save using <leader>s
nnoremap <leader>s :w<cr>
" apply macro with Q. qq to create macro using register q, quit with q
" apply with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" close buffer
nnoremap <leader>w :bdelete<cr>

" Clear all trailing white spaces
" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>W :%s/\v\s+$//<cr>:let @/ = ""<cr>

" Shortcut to rapidly toggle `set list`
" http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>-,eol:¬

" Clear search terms
nnoremap <silent> <leader><space> :nohlsearch<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" netrw
" http://vimcasts.org/episodes/the-file-explorer/
" https://blog.mozhu.info/vimmers-you-dont-need-nerdtree-18f627b561c3#.2zxqntfox
noremap <F2> :Explore<cr>
" http://usevim.com/2015/06/05/netrw-style/
let g:netrw_liststyle=1

" fast edit vimrc
nmap <leader>v :edit $MYVIMRC<CR>

" Reload .vimrc
nmap <F4> :source $MYVIMRC<CR>:redraw!<CR>:AirlineRefresh<CR>:nohlsearch<cr>:echo "vimrc reloaded!"<CR>

" force refresh or redraw screen
nnoremap <F5> :redraw!<cr>

" use visual mode to select and then yank
xnoremap <leader>y "+y
" normal mode: copy and paste using clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

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

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v' " very magic
let g:incsearch#separate_highlight = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selectively load spell checker for some file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" global setting
set nospell

augroup spellCheck
    autocmd!
    autocmd InsertEnter *.txt,*.tex,*.md setlocal spell spelllang=en_us
    autocmd InsertLeave *.txt,*.tex,*.md setlocal nospell spelllang=en_us
augroup END


