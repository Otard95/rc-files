"" Pathogen

execute pathogen#infect()
let g:jsx_ext_required = 0

"" Basic

set nocompatible
syntax on
filetype plugin indent on

"" General

set number	               " Show line numbers
set relativenumber             " Line numbers are relative to caret position
set linebreak	               " Break lines at word (requires Wrap lines)
set showbreak=+++	       " Wrap-broken line prefix
set textwidth=175	       " Line wrap (number of cols)
set showmatch	               " Highlight matching brace
" set spell	               " Enable spell-checking
set virtualedit=all	       " Enable free-range cursor
set scrolloff=15               " Keep caret 15 lines away from viewport top and bottom border whenever posible
 
set hlsearch	               " Highlight all search results
set smartcase	               " Enable smart-case search
set ignorecase	               " Always case-insensitive
set incsearch	               " Searches for strings incrementally
 
set autoindent	               " Auto-indent new lines
set expandtab	               " Use spaces instead of tabs
set shiftwidth=2	       " Number of auto-indent spaces
set smartindent	               " Enable smart-indent
set smarttab	               " Enable smart-tabs
set softtabstop=2	       " Number of spaces per Tab
 
"" Advanced

set ruler	               " Show row and column ruler information
set cmdheight=2	               " Command line height
set backupcopy=yes             " Saves to backup then renames. Hot reloading parcel requirement
 
set undolevels=5000            " Number of undo levels
set backspace=indent,eol,start " Backspace behaviour
set path=.,,**
set wildmenu

"" Tags

set tags=./tags,tags
command! MakeTags !ctags-exuberant -R -L ctags-index-files.rc

"" Explorer

" set nobuflisted
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 12 
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
" command! clean silent !rm -r ./**/*.swp && 

"" Keyboard shortcuts and commands

nnoremap <tab> :noh<return><esc>

let b:comment_leader = '// '
autocmd FileType c,cpp,java,scala,js,javascript,jsx let b:comment_leader = '// '
autocmd FileType sh,ruby,python                     let b:comment_leader = '# '
autocmd FileType conf,fstab                         let b:comment_leader = '# '
autocmd FileType tex                                let b:comment_leader = '% '
autocmd FileType mail                               let b:comment_leader = '> '
autocmd FileType vim                                let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=\1escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

command! FixSize call s:FixSize()
function! s:FixSize()
  wincmd t
  vertical resize 38
endfunction

"" Restore previous session

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
    wincmd t
    quit
    exe 'Vexplore'
    call s:FixSize()
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

"" Close all buffers

command! Bda call s:BufferDeleteAll()
function! s:BufferDeleteAll()
  write
  exe '%bd'
  exe 'e#'
  exe 'Vexplore'
  wincmd l
endfunction

"" Typescrip
" augroup SyntaxSettings
"     autocmd!
"     autocmd BufNewFile,BufRead *.tsx set filetype=typescript
" augroup END





"" VIM Airline config

"" Autoclose paren and braces

"let s:AutoClosePairs = {'(':')','[':']','{':'}','"':'"',"'":"'"}
"
"function! s:GetCharUnder(off)
"  if col('.')+a:off < 1 || col('.')-1+a:off >= col('$') 
"    return '\0'
"  endif
"  return strpart(getline('.'), col('.')-1+a:off,1)
"endfunction
"
"function! s:GetPrevChar()
"  return s:GetCharUnder(-1)
"endfunction
"
"function! s:GetNextChar()
"  return s:GetCharUnder(1)
"endfunction
"
"let s:skipOne = 0
"function! s:Insert(char)
"  " let s:skipOne = 1
"  exe "normal! i".a:char
"  update
"endfunction
"
"function! s:AutoClose()
"  if s:skipOne
"    let s:skipOne = 0
"    return
"  endif
"
"  let l:next = s:GetNextChar()
"  let l:prev = s:GetPrevChar()
"
"  if !has_key(s:AutoClosePairs, l:prev) 
"    return
"  endif
"
"  if get(s:AutoClosePairs, l:prev) == l:next
"    return
"  endif
"
"  call s:Insert(get(s:AutoClosePairs, l:prev))
"endfunction
"
"au TextChangedI * nested call s:AutoClose()

