" ** General settings **
" enable auto-indenting based on filetype
filetype plugin indent on

:imap jk <Esc>
:imap kj <Esc>

" allow vim to operate on multiple buffers (files) by allowing buffers to be 'hidden'
set hidden

" auto-save buffers when executing commands
set autowrite

" a tab should be 4 spaces and the tab character should always be expanded to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" I always use a dark background
set bg=dark

" ** Shortcuts **
" map ctrl+h/ctrl+l to previous/next buffer respectively
nmap <silent> <C-H> :bp<CR>
nmap <silent> <C-L> :bn<CR>


" map tab in normal mode to open tag list
"nmap <silent> <Tab> :TlistOpen<CR>

" ** Options for tag list plugin **
" have tlist window close when a tag is selected
let Tlist_Close_On_Select=1

" ** Options for CtrlP **
" Help CtrlP find the root of the project
let g:ctrlp_root_markers=['systeminfo.txt', 'CMakeProjectSetup.txt']

" Use ctrl-y to bring up ctrlP
let g:ctrlp_map='<c-y>'

" Don't search for folder names
let g:ctrlp_by_filename=1

" Unset cap of 10,000 files so we can find everything
let g:ctrlp_max_files=20000

" Create a function to swap header and source using CtrlP
"     filename: name of the file without path or extension
"     ext: extension of the file
function! SwapHeaderSource(filename, ext)
    if (a:ext == "cpp")
        :CtrlP
        execute "normal ".a:filename.".h\<CR>"
    elseif (a:ext == "h")
        :CtrlP
        execute "normal ".a:filename.".cpp\<CR>"
    endif
endfunction

function! OpenFileCurWord(ext)
    let b = expand("<cword>")
    :CtrlP
    execute "normal "b.a:ext."\<CR>"
endfunction

" map F3 to swap header/source for current buffer
nmap <silent> <F3> :call SwapHeaderSource(expand("%:t:r"), expand("%:e"))<CR>

" map F4 to load the header with name of current word
nmap <silent> <F4> :call OpenFileCurWord(".h")<CR>

" map F5 to load the header with name of current word
nmap <silent> <F5> :call OpenFileCurWord(".cpp")<CR>

" map F8 to turn off syntax highlighting
map <silent> <F8> :if exists("g:syntax_on") <Bar>
    \       syntax off <Bar>
    \   else <Bar>
    \       syntax enable <Bar>
    \   endif <CR>

" map F9 to toggle paste
set pastetoggle=<F9>

" Get the hostname. We need to disable features on certain
" platforms.
let hostname = substitute(system('hostname'), '\n', '', '')

