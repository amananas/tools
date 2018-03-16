filetype plugin on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Add ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

set guifont=Liberation\ Mono\ 11

set listchars=tab:>-,trail:-
set list

set incsearch

set switchbuf=usetab,newtab
set showtabline=2
set tabpagemax=20
set autoindent
set cindent
set foldlevel=99


" Open the tagbar when opening a c or h file
au BufRead *.[ch] :TagbarOpen


" Moves through words with the arrows management
let g:camelchar = "A-Z0-9_.,;:{([`'\""
nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

let NERDTreeIgnore=['\.o$', '\~$', '\.d$']

autocmd BufWritePre *.* :%s/\s\+$//e


command Maketags !echo -e "UserLibraries:$(pwd | sed 's,^\(/.*/.*/Perforce/[^/]*\)/.*$,\1,')/types_c.taghl" > taghl_config.txt && ctags -R -V -f "./tags" --c-kinds=+pl --c++-kinds=+pl "$PWD"
nnoremap <C-0> <Esc>:CtrlPTag<cr>
nmap <C-9> :CtrlPTag<cr><C-\>w
nnoremap <silent> <F9> :NERDTree<CR>
nnoremap <F7> <C-o>
nnoremap <F8> <C-i>

setlocal foldmethod=syntax
set foldcolumn=4
let g:vimsyn_folding='af'

colorscheme nocturne
syntax on
cd %:p:h

set tags=./tags,/home/sah0275/Perforce/LB3_utd/tags


nmap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_autoclose = 0
let g:tagbar_left = 0
let g:tagbar_expand = 0
let NERDTreeMapOpenInTab='<ENTER>'

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-silent'
\ }

