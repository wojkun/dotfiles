" get inspiration for vimrc from wnodom

set nocompatible
filetype plugin on
filetype indent on

source $VIMRUNTIME/vimrc_example.vim

if has('win32')
    set runtimepath=$HOME/.vim,$HOME/vimfiles,$VIM/vimfiles,$VIMRUNTIME,
        \$VIM/vimfiles/after,$HOME/vimfiles/after

    " behave mswin      " behaviour for mouse and selection
                        " i'm turning it off coz it fuckes up visIncr
                        " plugin

    "source $VIMRUNTIME/mswin.vim

elseif has('win32unix')
    " this is for Cygwin
    set runtimepath=$HOME/.vim,$HOME/vimfiles,$VIM/vimfiles,$VIMRUNTIME,
        \$VIM/vimfiles/after,$HOME/vimfiles/after
elseif has('mac')
elseif has('unix')
endif

" computer's network name
let nodename = system("uname -n | head -c -1")
" computer's name
let hostname = substitute(system('hostname'), '\n', '', '')
":echo hostname

" always use English for Vim UI
let $LANG = 'en'
set langmenu=none

if has('gui_running')
    " if you need to differentiate between tty mode and GUI mode
endif

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X>      "+x
vnoremap <S-Del>    "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C>      "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
" (don't map C-v, you use it for checking key codes in Vim!)
"map <C-V>           "+gP
"map <S-Insert>      "+gP
map <C-V>           "+gp
map <S-Insert>      "+gp

cmap <C-V>          <C-R>+
cmap <S-Insert>     <C-R>+

" Pasting blockwise and linewise selections is not possible in
" Insert and Visual mode without the +virtualedit feature.  They are
" pasted as if they were characterwise instead. Uses the paste.vim
" autoload script.
"
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
"
if !has("unix")
    set guioptions-=a
endif

" Use CTRL-Q to do what CTRL-V used to do
"
noremap <C-Q>       <C-V>

" Control+Tab moves to the next window.
"
noremap  <C-Tab>    <C-W>w
inoremap <C-Tab>    <C-O><C-W>w
cnoremap <C-Tab>    <C-C><C-W>w
onoremap <C-Tab>    <C-C><C-W>w

vnoremap <BS> d

" Control+S saves the current file (if it's been changed).
"
noremap  <C-S>  :update<CR>
vnoremap <C-S>  <C-C>:update<CR>
inoremap <C-S>  <C-O>:update<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen (easly plugin installing)
let g:pathogen_disabled = []
if !has('gui_running')
    call add(g:pathogen_disabled, 'csapprox')
endif
if v:version < '702'
    call add(g:pathogen_disabled, 'netrw')
    call add(g:pathogen_disabled, 'vim-snipmate') " problems after pressing Tab
endif
call pathogen#infect()
call pathogen#helptags()


" YankRing
" bypass single-letter (and two-leter) deletes, start from 3-letter
" words:
"let g:yankring_min_element_length = 3
" ignore duplicates
"let g:yankring_ignore_duplicate = 0
"
"nnoremap <silent> <F12> :YRShow<CR>
" use this if you use YankRing:
"function! YRRunAfterMaps()
	"nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
"endfunction

" Tag List
"nnoremap <silent> <F8> :TlistToggle<CR>
"let g:Tlist_GainFocus_On_ToggleOpen = 1

" PreciseJump
" F - jump to character on current line
"f - jump to character in whole window
" t - jump to character -1 in whole window
"let g:PreciseJump_I_am_brave = 1

" Easy motion is has more features then PreciseJump (but both are very
" good), let's use EasyMotion for a while
"let g:EasyMotion_mapping_f = 'f'
"let g:EasyMotion_mapping_F = 'F'
"let g:EasyMotion_mapping_t = 't'
"let g:EasyMotion_mapping_T = 'T'

" MRU
"let MRU_Add_Menu = 0                     " disable File->Recent Files
"let MRU_File = $HOME."/_vim_mru_files"   " set location of recent file
                                          " list
"
"map <F10> :MRU<CR>

" ConqueTerm
"let g:ConqueTerm_FastMode = 0
"let g:ConqueTerm_ColorMode = 'conceal'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
if has('win32')
    set guifont=Consolas:h11:cANSI
endif
"set foldmethod=indent
set foldignore=
" consider dash to be part of a word
:set isk+=-

" set height of help window
:set helpheight=25

set enc=utf-8

" ignorecase and smartcase together make Vim deal with case-sensitive
" search intelligently. If you search for an all-lowercase string your
" search will be case-insensitive, but if one or more characters is
" uppercase the search will be case-sensitive. Most of the time this
" does what you want.
set ignorecase
set smartcase

"set ignorecase

" Margin (column width)
":set textwidth=79
:set textwidth=69

" never ever let Vim write a backup file! They did that in the 70’s.
" Use modern ways for tracking your changes, for God’s sake.
set nobackup
set noswapfile
" put swap files in temp directory (and not where the edited files
" lies), do I need this? considering the above "noswapfile"??
":set dir=c:\\temp

set mouse=a
" enable mouse

" java archives are really zip files
"au BufRead,BufNewFile *.jar,*.war,*.ear,*.sar,*.rar set filetype=zip
"au BufRead,BufNewFile *.gug set filetype=gug
au BufNewFile,BufRead *.jar,*.war,*.ear,*.sar,*.rar,*.xpi,*.zip call zip#Browse(expand("<amatch>"))

"au BufRead,BufNewFile *.php,*.html set filetype=php.html
au BufRead,BufNewFile *.php,*.html set filetype=html

" if you see extension .xotcl then apply tcl syntax highlighting:
" (I add this coz vim sometimes doesn't recognize xotcl files by
" heuristics)
au BufNewFile,BufRead *.xotcl set filetype=tcl

" apply file type "moj" to .txt files
au BufNewFile,BufRead *.moj set filetype=moj

" apply iMacros syntax file to .iim files
au BufNewFile,BufRead *.iim set filetype=iim

"set fileencodings=ucs-bom,utf-8,cp1250,latin1

" 256 color in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
else
    " Mintty settings

    " Show block cursor in normal mode and line cursor in insert mode in
    " Mintty, and other terminals
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"

    " avoid escape timeout in terminals
    " see: https://code.google.com/p/mintty/wiki/Tips
    let &t_ti.="\e[?7727h"
    let &t_te.="\e[?7727l"
    noremap <Esc>O[ <Esc>
    " pressing Esc in command line mode executes the command
    "noremap! <Esc>O[ <Esc>
    " pressing Esc in command line mode cancels the command
    noremap! <Esc>O[ <C-c>
endif

colorscheme desert
"colorscheme ir_black

let mapleader = ","

set autoindent

" numbers before the lines
"set nu

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar

" allow recursive search with :find
" e.g. :find Myfi<Tab> will find Myfile.java deep under current dir
:set path+=**


" start gVim maximized
if has("gui_running")
    if hostname == "ADI-PC"
        " presses Alt+Space, then 'x', it won't work on Polish version of
        " Windows, coz the letter to maximize is 's'
        au GUIEnter * simalt ~x  " start gVim maximized
    elseif hostname == "PLWAZ250N1"
        " Nextira comp?
        au GUIEnter * simalt ~s " maximize also for Polish version of Windows
    elseif hostname == "bulls-ThinkPad-T500"
        autocmd GUIEnter * silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
        ":echo 'lalababba'
        nmap <a-q> :e ~/Dropbox/unsorted/temp.txt<cr>
        nmap <a-1> :e ~/private/bulls/bulls.txt<cr>
        nmap <a-F5> :e ~/Dropbox/bulls/CSIDEV-2048<cr>
        nmap <a-F6> :e /tmp/trunk.log<cr>
        nmap <a-F9> :e ~/Dropbox/home/.bashrc<cr>
        nmap <a-F11> :e ~/Dropbox/unsorted/skrawki.txt<cr>
        nmap <a-F12> :e ~/Dropbox/unsorted/pua.txt<cr>
        nmap <a-d> :bd<cr>
        nmap <a-a> :fin 
        ":set path=**
        :set path=~/Dropbox/computers/**
    elseif has('unix')
        "au GUIEnter * simalt ~x  " start gVim maximized
        autocmd GUIEnter * silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endif
endif
" TODO zamiast hardkodowac nazwę kompa, zdobądź info o wersji
" językowej Windowsa

"Switch between buffers without saving
set hidden

"Hide mouse when typing
set mousehide

" show relative (not absolute) line numbers
" set relativenumber

"create <FILENAME>.un~ files whenever you edit a file. These files
"contain undo information so you can undo previous actions even after
"you close and reopen a file.
"set undofile

"Apply substitutions globally on lines by default. For example, instead of
":%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what
"you want (when was the last time you wanted to only replace the first
"occurrence of a word on a line?) and if you need the previous
"behavior on the g again (i.e. it's reversed now)
"set gdefault

" red cursor
highlight Cursor guibg=red

"Use virtualedit
"set ve=all

" Python (doesn't work?)
"au FileType python setlocal tabstop=8 expandtab shiftwidth=4
"   \ softtabstop=4
"
" after typing lines which start with any of the keywords in the list
" (def, class, if, etc) the next line will automatically indent itself
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,
"   \ try,except,finally,def,class
"

set fileformats=unix,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom key bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" (moje) ,Esc closes a window
" BINDING , OR ; SLOWS DOWN THEIR ORIGINAL FUNCTIONS (OF REPEATING
" FORWARD AND BACKWARD). BUT BECAUSE I DON'T USE COMMA OFTEN, LET'S
" BIND IT TO SOMETHING (COMMA IS ACTUALLY ALSO BEING SLOWED DOWN BY
" SOME PLUGINS LOADED BY PATHONGEN):
"noremap ,<Esc> <C-w>c
"noremap jl <C-w>c

" shortcuts for omnicompletion (what is it??)
"imap <c-space> <c-x><c-o>

" remove 1. whitespace from begining and end of lines
"		 2. blank lines
"		 3. all lines with Tcl comments
fu! Trim()
	" trim trailing whitespace, e suppresses errors
	%s/\s\+$//e

	" trim whitespace from beginning
	"%s/^\s\+
	%le

	" remove all blank lines
	%s/^[\ \t]*\n//g

	" remove all lines with Tcl comments
	g/#/d
endf
":nmap <silent>  <leader>t  :call Trim()<CR>
":nmap <leader>a Go<Esc>o

" a shortcut I saw somwhere
" map <leader># :s/^/#/<CR>

" dates"{{{
" %a	Abbreviated weekday name *	Thu
" %A	Full weekday name *	Thursday
" %b	Abbreviated month name *	Aug
" %B	Full month name *	August
" %c	Date and time representation *	Thu Aug 23 14:55:02 2001
" %d	Day of the month (01-31)	23
" %H	Hour in 24h format (00-23)	14
" %I	Hour in 12h format (01-12)	02
" %j	Day of the year (001-366)	235
" %m	Month as a decimal number (01-12)	08
" %M	Minute (00-59)	55
" %p	AM or PM designation	PM
" %S	Second (00-61)	02
" %U	Week numb with first Sun as first day of week one (00-53)	33
" %w	Weekday as a decimal number with Sunday as 0 (0-6)	4
" %W	Week numb with first Mon as first day of week one (00-53)	34
" %x	Date representation *	08/23/01
" %X	Time representation *	14:55:02
" %y	Year, last two digits (00-99)	01
" %Y	Year	2001
" %Z	Timezone name or abbreviation	CDT
" %%	A % sign	%
"
"* Specifiers whose description is marked with * are locale-dependent.
"
":nnoremap <F5> "=strftime('%d/%m/%Y')<CR>P
:nnoremap <s-F5> "=strftime('%d/%m/%Y %H:%M%p')<CR>P
":inoremap <s-F5> <C-R>=strftime('%d/%m/%Y')<CR>
"}}}

"One way to simplify the routine of operating on the same kind of text
"is to define mappings that mimic text object selection commands. The
"two pairs of mappings below—one for Visual mode, and another for
"Operator-pending mode—provide a way to select everything on the
"current line except the new line character (al), and everything
"starting from the first non-blank character of the current line to
"the last non-blank character inclusive (il).
:vnoremap <silent> al :<c-u>norm!0v$<cr>
:vnoremap <silent> il :<c-u>norm!^vg_<cr>
:onoremap <silent> al :norm val<cr>
:onoremap <silent> il :norm vil<cr>
"So, instead of using yy to copy the contents of a line that is to be
"pasted characterwise (and not linewise), one can use yal or yil
"commands to yank and p to paste, as usual.

" single character insert
"nmap <Space> i_<Esc>r
" (moje) S-Space inserts single character after the cursor
"nmap <s-Space> a_<Esc>r

" (moje) do normal paste, but before that insert space
nmap <a-p> a<Space><Esc>p

" push current line down (cursor moves together with the line)
nmap <s-space> _i<Enter><Esc>
" push current line down (cursor stays in the same screen position)
nmap <c-space> ko<Esc>

" surround the word under cursor in ()
nmap <leader>9 ysiw)
nmap <leader>s ysiw"

" f deletes text to black hole
" and t does what f used to do
" (I didn't seem to use t, so I changed it)
" (THESE BREAK COZ OF THE YANKRING PLUGIN)
"nnoremap f "_d
"vnoremap f "_d
"noremap t f

" easier shortcut for running macros
nnoremap <leader>q @q

" Quickly edit the vimrc file
"nmap <silent> ;ve :e $MYVIMRC<CR>
" Quickly reload the vimrc file (AHK does it for me now)
"nmap <silent> ;vr :so $MYVIMRC<CR>
"nmap <silent> ,rv :so $MYVIMRC<CR>

" Reload (source) _vimrc after saving it
" BUG: each time your make a change to _vimrc, the reload time doubles
" DON"T USE THIS
"if has("autocmd")
  "autocmd bufwritepost _vimrc source $MYVIMRC
"endif

" Use Q for formatting the current paragraph (or selection)
"vmap Q gq
nmap <F10> gqap

" Select line and format it
nmap Q Vgq

" If you like long lines with line wrapping enabled, this solves the
" problem that pressing down jumpes your cursor “over” the current
" line to the next line. It changes behaviour so that it jumps to the
" next row in the editor (much more natural):
nnoremap j gj
nnoremap k gk

" Clear highlighted searches by pressing comma dot
nnoremap <silent> ,. :nohlsearch<CR>
" (I used to have it mapped to :let @/=""<CR>, but some users kindly
"pointed out that it is better to use :nohlsearch, because it keeps
"the search history intact)

" shortcut to foldmethod=indent
map <leader>f :set foldmethod=indent<CR>

" open help always in right window (TRAILING SPACES NEEDED!)
nnoremap <F1> :vert help 
vnoremap <F1> <Esc>:vert help 
inoremap <F1> <Esc>:vert help 

" shortcut to folders
"nmap <silent> ;d :Ex d:\downloads<CR>
"nmap <silent> ;x :Ex d:\dropbox<CR>
"nmap <silent> ;p :Ex d:\dropbox\portable<CR>

" copy full path of current file to clipboard
" (after copying it you must paste it)
noremap <silent> <s-F4> :let @+=expand("%:p")<CR>

" BUFFERS {{{
" remap Alt-o to "buffer next"
map <A-o> :bn<cr>
map <A-e> :bn<cr>
map <F2> :bn<cr>
" remap Alt-i to "buffer previous"
map <A-i> :bp<cr>
map <A-w> :bp<cr>
map <F3> :bp<cr>
" shell I remap "buffer delete"?
"map gd :bd<cr>
" list buffers
:nnoremap <F6> :buffers<CR>:buffer<Space>

":noremap <a-f> <Esc>:e #
":inoremap <a-f> <Esc>:e #

" delete current buffer"{{{
:noremap <F12> :bd<CR>
:inoremap <F12> <Esc>:bd<CR>
"}}}

"Delete all buffers (via Derek Wyatt)"{{{
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>"}}}
"}}}

"make the tab key match bracket pairs, a hell of a lot easier to type
"than % (this breaks Tab, which is: jump to newer position)
"nnoremap <tab> %
"vnoremap <tab> %

"I use ,W to mean "strip all trailing whitespace in the current file"
"so I can clean things up quickly:
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Select just-pasted text
"nnoremap <leader>v  `[v`]
"nnoremap <leader>v  `[v`]l
"nnoremap <expr> <leader>v '`[' . strpart(getregtype(), 0, 1) . '`] . l'
nnoremap <expr> <leader>v '`[' . strpart(getregtype(), 0, 1) . '`]'
" (exit to normal mode or you will not select the last paste)

"split window horizontally and move to it
nnoremap <leader>w <C-w>v<C-w>l

"toggle comments
nmap <C-j> <leader>c<space>

" F5 jumps to the next 'column position' based on the first
" non-blank line above the current line:
" jeden      dwa        trzy
" one        (jumps here)
runtime insert_matching_spaces.vim
"imap <expr> <S-Tab> InsertMatchingSpaces()
imap <expr> <F5> InsertMatchingSpaces()

" Define commands to redirect Vim command messages to a new buffer,
" window, or tab:
" :BufMessage version   paste output of ":version" at cursor pos
" :WinMessage ls        paste output of ":ls" in new window
runtime redir_messages.vim

" Load the functions used by the literal-search mappings below.
runtime search_enhancements.vim

" Map Control+G in command-line mode to allow the user to enter {{{
" a string that, once the user presses Enter, will be automatically
" converted to a 'literal pattern' -- that is, a pattern with
" all metacharacters and slashes and backslashes already escaped.
" (type / to start a search, then C-g, then type your search string)
"
" (See notes in GetLiteralPattern() for an explanation of why this isn't
" an <expr> mapping.)
"
cnoremap <C-G>  <C-R><C-R>=GetLiteralPattern()<CR>
"}}}
" Search for the current visually-highlighted text. The text is"{{{
" automatically escaped as with the <C-G> cmap above (type \ followed by
" /)
"
" Note: This overwrites the @v register.
"
xnoremap \/  "vy/<C-R><C-R>=StringToPattern(@v)<CR>
xnoremap \?  "vy?<C-R><C-R>=StringToPattern(@v)<CR>
"}}}

" Make * and # act similar to their normal-mode versions, but for the
" visually-highlighted text. Note that these build on the mappings
" immediately above.
"
xmap *  \/<CR>
xmap #  \?<CR>

" Keep the working line in the center of the window. This is a toggle,
" so you can bounce between centered-working-line scrolling and normal
" scrolling by issuing the keystroke again.
"
nnoremap \zz  :let &scrolloff=999-&scrolloff<CR>

" Quickfix {{{

"Open a quickfix window with the most recent search
nnoremap <silent> ,/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" go to next match or error
nnoremap ,, :cn<CR>

"}}}
" View differences between the current buffer and the original file."{{{
" (Based on code from $VIMRUNTIME/vimrc_example.vim.)
" (to use it just write :DiffOrig and Enter)
"
if !exists(":DiffOrig")
    command DiffOrig vertical new | set buftype=nofile | read # | 0d_
        \ | diffthis | wincmd p | diffthis
endif
"}}}
" Center the display line after searches. (This makes it *much* easier"{{{
" to see the matched line.)
"
" More info: http://www.vim.org/tips/tip.php?tip_id=528
"
"nnoremap n   nzz
"nnoremap N   Nzz
"nnoremap *   *zz
"nnoremap #   #zz
"nnoremap g*  g*zz
"nnoremap g#  g#zz
"}}}
" Draw lines of dashes or equal signs based on the length of the line"{{{
" immediately above.
"
"   k       Move up 1 line
"   yy      Yank whole line
"   p       Put line below current line
"   ^       Move to beginning of line
"   v$      Visually highlight to end of line
"   r-      Replace highlighted portion with dashes / equal signs
"   j       Move down one line
"   a       Return to Insert mode
"
" XXX: Convert this to a function and make the symbol a parameter.
" XXX: Consider making abbreviations/mappings for ---<CR> and ===<CR>
"
inoremap <C-U>- <Esc>kyyp^v$r-ja
inoremap <C-U>= <Esc>kyyp^v$r=ja
inoremap <C-U>* <Esc>kyyp^v$r*ji
"}}}
" Y = y$ (more intuitive)"{{{
"
" use this if you don't use YankRing:
noremap Y y$
"}}}
" (temp)list all lines that look like this:"{{{

" MY SUBJECT
" **********
"
noremap <leader>l :g/.\n\*/nu<CR>
"}}}
" Open link (ol) under cursor (can be http, link to file etc)"{{{
:nmap <F4> :Utl ol<cr>

"}}}
" highlight current line {{{
":set cursorline
"}}}
" F7 handlers {{{
" set mark y, copy whole word, return to mark y
:noremap <f7> my"+yiW`y

" exec compiler on current file(%)
":noremap <s-f7> :silent !java "%:t:r"<CR>
:noremap <s-f7> : !java "%:t:r"<CR><CR>

":vnoremap <f7> :!python %<CR>
:noremap <f11> :!javac "%"<CR><CR>

"}}}
" F8 handlers {{{
" set mark y, copy whole line, return to mark y
:map <f8> my"+yil`y
"}}}
" F9 handlers {{{
" set mark y, copy whole paragraph, return to mark y
:map <f9> my"+yip`y
"}}}
":noremap <C-l> :CtrlPBuffer<CR>"{{{

"}}}
" run currently edited file with an external app that is associated"{{{
" with it
:nmap <Leader>x :silent ! start "1" "%:p"<CR>
" run current file with HTML browser
"nnoremap <S-F7> :update<Bar>silent !start G:/apps2/Opera/opera.exe
"\file://%:p<CR>
" run current file with AutoHotkey.exe
"nnoremap <S-F8> :update<Bar>silent !start
"\G:/apps/64/Autohotkey_L/AutoHotkey.exe %:p<CR>
"}}}
" delete (recycle) current file and delete buffer (wipe it)"{{{
" instead of !mycommand I am using !start mycommand coz it doesn't
" suppress Vim
" UWAGA: this doesn't delte from BoxCryptor drive
"nnoremap <Delete> :!recycle.exe -f %<CR><BAR>:bw!<CR>
"nnoremap <Delete> :!start d:/apps/hstart/hstart.exe /NOCONSOLE
"\"d:/apps/cmdutils/Recycle.exe -f %"<CR><BAR>:bw!<CR>
"linux version, doesn't work??
"nnoremap <Delete> :!trash %<CR>
"}}}
" Create parent directories on save"{{{
if has("autocmd")
  autocmd BufWritePre * :silent! call mkdir(expand('%:p:h'), 'p')
end
"}}}
" Remember cursor position when switching buffer"{{{
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
"}}}
" alternatives to Esc"{{{
" Nie wiem jak zamienic Esc z Alt na linuxie, ale ten skrot wydaje sie
" jeszce lepszy (mozna go wpisac szybciej niz jj)
":inoremap jk <Esc>
":vnoremap jk <Esc>
inoremap kj <Esc>
"vnoremap kj <Esc>
cnoremap kj <Esc>
"}}}
" alternative to :w"{{{
:noremap S :w<CR>
"}}}
" current dir settings"{{{
":cd $TEMP
":cd $DOCS//first//computers
if has("win32unix")
    " Do something only in Cygwin
    :cd /cygdrive/z/computers
elseif has('unix')
    if hostname  ==? 'localhost.localdomain'
        :cd /home/user/visible/docs/computers
    elseif nodename ==? 'wid7.clear2Pay.com'
        :cd /home/ofm/Dropbox/computers
    elseif nodename ==? 'bulls-ThinkPad-T500'
        :cd ~/Dropbox
    endif
endif

" change to directory of current file automatically
"autocmd BufEnter * lcd %:p:h " one way
"set autochdir " another way

" Set working dir to the current file using shortcut
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
"}}}
" ,ew expands to :e /some/path/"{{{
" when editing file /some/path/myfile.txt,
" typing ,e expands to :e /some/path/ on the command line.
" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
"}}}
" :e %%/ expands to :e/some/path/"{{{
" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
"
" when editing file /some/path/myfile.txt, typing :e %%/ on the
" command line will expand to :e /some/path/
cabbr <expr> %% expand('%:p:h')
"}}}
" portable way to maximize gVim"{{{
":set lines=999 columns=999
"}}}
" insert the rest of the line above"{{{
inoremap <a-w> <Esc>kly$hjpa
" insert the rest of the line below
inoremap <a-r> <Esc>jly$hkpa
"}}}
" easier moving in Insert mode"{{{
imap <C-b> <Left>
imap <C-f> <Right>
"}}}
" C-c toggles between Insert and Normal modes"{{{
nnoremap <silent><C-c> i
inoremap <silent><C-c> <Esc>l
"}}}
" map the spacebar to colon (saves time)"{{{
"nmap <space> :
"}}}
" Save file when Vim window loses focus"{{{
"au FocusLost * :wa"}}}
"highlight all characters past 79 columns for all programming langs"{{{
"augroup vimrc_autocmds
 "au BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
 "au BufEnter * match OverLength /\%79v.*/
"augroup END
"}}}
" highlight trailing whitespace {{{

" 1.highlight trailing whitespace in yellow
" 2.don't show this higlliting when typing in insert mode
" 3.turn on this highlighting when you open new buffers
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

au FileType vim,python,tcl,perl,sh,c,cpp,java,php au BufWinEnter <buffer> match ExtraWhitespace /\s\+$/
au FileType vim,python,tcl,perl,sh,c,cpp,java,php au InsertEnter <buffer> match ExtraWhitespace /\s\+\%#\@<!$/
au FileType vim,python,tcl,perl,sh,c,cpp,java,php au InsertLeave <buffer> match ExtraWhitespace /\s\+$/
if version >= 702
    au FileType vim,python,tcl,perl,sh,c,cpp,java,php au BufWinLeave <buffer> call clearmatches()
endif
" }}}
" delete multi blank lines {{{
"nmap <F8> <Esc>V`[>gv:!cat -s<CR>`]
"}}}
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" don't bind:
"
" Enter - it conflicts when executing new empty line in quickfix

" cursor jumps when joining lines
nnoremap J mzJ`z

" join two lines, and remove all spaces (J leaves a single space)
nnoremap <leader>j $Jx

"Delete empty buffers, specially for files opened with --remote option "{{{
autocmd BufAdd * :call <SID>DeleteBufferIfEmpty()
function s:DeleteBufferIfEmpty()
    if bufname('%') == ''
        bwipe
        " This will trigger filetype detection, mainly to trigger syntax highlighting
        doautocmd BufRead
    endif
endfunction
"}}}

" SOME UNSORTED STUFF ??
"function Test() range
  "echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| pbcopy')
"endfunction

"function Mine()
   "norm "ayip
   ":redir! > g:/downloads/lala
   ":echo @a
   ":redir END
"endfunction


"If you want to change just one or two colors in your syntax highlighting,
"there is a simpler way other than editing color files (or creating new ones).
"For example, I wanted to tweak the default colors a bit, so I added the
"following lines to my vimrc file:
"highlight comment ctermfg=lightblue
"highlight constant ctermfg=red

" prepend consecutive numbers
" (select some lines then press C-F1)
vnoremap <c-F1> :s/^/\=(line('.')-line("'<")+1).' '<CR>

" <2-LeftMouse>     Open fold, or select word or % match.
" (just opens folds, but otherwise maintains the default doubleclick behavior)
nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'

" In normal mode, press Space to toggle the current fold open/closed. However,
" if the cursor is not in a fold, move to the right (the default behavior)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

function! NeatFoldText() "{{{
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

" expand tabs into spaces
    let onetab = strpart(' ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
"set foldtext=MyFoldText()

function! MyFoldExpr() " {{{
    let prevline = getline(v:lnum-1)
    let thisline = getline(v:lnum)
    if match(thisline, '###') >= 0 && match(prevline, '###') == -1
        return ">3"
    elseif match(thisline, '##') >= 0 && match(prevline, '##') == -1
        return ">2"
    elseif match(thisline, '^#') >= 0 && match(prevline, '^#') == -1
        return ">1"
    else
        return "="
    endif
endfunction " }}}

"function! MyFoldExpr() " {{{
    "let prevline = getline(v:lnum-1)
    "let thisline = getline(v:lnum)
    "if match(thisline, '^##') >= 0
        "return ">2"
    "elseif match(thisline, '^#') >= 0
        "return ">1"
    "else
        "return "="
    "endif
"endfunction

" }}}

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500

" Autoindent on save {{{
" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
    " Save the last search.
    let search = @/

    " Save the current cursor position.
    let cursor_position = getpos('.')

    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)

    " Execute the command.
    execute a:command

    " Restore the last search.
    let @/ = search

    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt

    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent()
    call Preserve('normal gg=G')
endfunction

" }}}

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax foldlevel=2

" C-Enter doesn't insert continuation comment
" (or just use normal o then C-w)
noremap <c-Enter> o<ESC>c_
inoremap <c-Enter> <Enter><C-W>

"Toggle folds with mouse double click
:map <2-LeftMouse> za
"Or may be triple click to avoid conflicting with text selecting command of vim
":map <3-LeftMouse> za

autocmd BufNewFile,BufReadPost *.log :set filetype=log
au FileType log setlocal nowrap
" upon entering trunk.log delete all lines staring with a Tab in trunk.log
au BufEnter trunk.log :g/\t/d

:let VCSCommandVCSTypePreference = "svn"
