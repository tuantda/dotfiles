set nocompatible

"Win32
if has('win32')
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
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
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
execute pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on

set autoread " auto read when file is changed
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set mouse=a "enable mouse

set history=1000

set nobackup
set nowb
set noswapfile
set noundofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keys Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map , to leader
let mapleader = ","
let g:mapleader = ","

"map Space to / search, Ctrl-Space to ? backward search
map <space> /
map <c-space> ?

"use moving keys with mswin.vim
if has("win32")
    map <down> j
    map <up> k
    map <right> l
    map <left> h
endif

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildignore=*.o,*~,*.pyc

set number "line number
set ruler
"set cmdheight=1
set laststatus=2    "always show statusline
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P

set hidden

set backspace=eol,start,indent  "allow backspacing over everything
set whichwrap+=<,>,h,l

"Make searching highlighted, incremental, and case insensitive unless a capital
"letter is used
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set lazyredraw

"Use spaces instead tabs, 1tab = 4spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set autoindent
set smartindent

"gVim windows size
set lines=25
set columns=90
set textwidth=79
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Modeline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modeline
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fonts and color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax enable
syntax on
set encoding=utf8
set fileencoding=utf8           "endcoding utf8
set fileformats=unix,dos,mac
set fileformat=unix             "always is unix lineending

if has ('gui_running')
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set background=dark
    "colorscheme desert
    colorscheme solarized
    "font base system
    if has ('win32')
        set guifont=Consolas:h12
    elseif has ('macunix')
        set guifont=Monaco:h12
    elseif has ('unix')
        set guifont=DejaVu\ Sans\ Mono\ 12
    endif
    "display Vietnamese
    if has ('win32')
        language messages vi
        source $VIMRUNTIME/delmenu.vim
        set langmenu=vi_vn
        source $VIMRUNTIME/menu.vim
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell spelllang=vi,en<cr>

" LaTex commands dictionary
"set dictionary+=~\Vim\vim74\spell\latex "latex commands dictionary
"set complete-=k complete+=k "add dictionary to completion option

" Shortcuts using <leader> for next, prevous, add, suggest word
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype detect
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" empty .tex file is LaTex
let g:tex_flavor='latex'
" .md is markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jekyll Blog (csexton)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jekyll_path = "D:/project/weblog/tuantda.github.io"
let g:jekyll_post_suffix = "md"
let g:jekyll_prompt_tags = "true"
let g:jekyll_prompt_categories = "true"

map <Leader>jb  :JekyllBuild<CR>
map <Leader>jn  :JekyllPost<CR>
map <Leader>jl  :JekyllList<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"shortcut to open NERDTree
map <Leader>nt  :NERDTreeToggle<CR>
"map <Leader>n  :<plug>NERDTreeTabsToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoclose
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto-close "$...$" "\[...\]" pair in tex files
autocmd FileType tex
\ let b:AutoClosePairs = AutoClose#DefaultPairsModified("$ \[\]", "")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
 au!
 au FileType tex let b:syntastic_mode = "passive"
augroup END

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easy Align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => po.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:po_translator = "Tran Dinh Anh Tuan <tuantda.vn@gmail.com>"
let g:po_lang_team = "Vietnamese <vi_VN>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tasklist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>v <Plug>TaskList
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
