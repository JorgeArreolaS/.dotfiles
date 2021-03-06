" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" vim-comentary
" ~ https://github.com/tpope/vim-commentary

" [ gcc ] to comment out a line
" [ gc ] to comment out the target of a motion (for example, [ gcap ] to comment out a paragraph)
" [ gc ] in visual mode to comment out the selection

" Toggle comment
"  ~ https://stackoverflow.com/a/40167715
noremap <leader>' :Commentary<cr>


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" vim-multiple-cursors
" ~ https://github.com/terryma/vim-multiple-cursors
 
"  normal mode / visual mode
"  start: <C-n> start multicursor and add a virtual cursor + selection on the match
"  next: <C-n> add a new virtual cursor + selection on the next match
"  skip: <C-x> skip the next match
"  prev: <C-p> remove current virtual cursor + selection and go back on previous match
"  select all: <A-n> start multicursor and directly select all matches
"  You can now change the virtual cursors + selection with visual mode
"  commands. For instance: c, s, I, A work without any issues. You could also
"  go to normal mode by pressing v and use normal commands there.4


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" auto-pairs
" ~ https://github.com/jiangmiao/auto-pairs

" auto pair for html syntax
au FileType html,tsx,jsx let b:AutoPairs = AutoPairsDefine({'<' : '>', '<!--': '-->'})


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" Custom fold
function! CustomFold()
  return printf(' ⧐  %3d %s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

set fillchars=fold:\ | set foldtext=CustomFold() 

" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~

" This is from: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" From: https://vimawesome.com/plugin/repeat-vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~

: command! RefreshSource source ~/.dotfiles/init.vim


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" Colorcitos uwu
" let g:colorizer_auto_color = 1
let g:colorizer_skip_comments = 1


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" Git commit in insertmode
autocmd FileType gitcommit startinsert


" function! OnCloseBuff()
"   if winnr() == 1 && bufname('%') == '' && &filetype == ''
"     echo "Hola"
"     exe 'Startify'
"   endif
" endfunction

" au BufDelete * call OnCloseBuff()


" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*ts,*tsx Neoformat
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

" Check if file has changed and update it
" ~ https://stackoverflow.com/a/20418591
au FocusGained,BufEnter * :silent! !

" Colorizer
:lua require'colorizer'.setup()

