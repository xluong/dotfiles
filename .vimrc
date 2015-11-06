"""""""""""""""""""""""""""""""""""""""""""""""""""
" John Wright's VIMRC
" Updated 06-03-11
"
" See http://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Not compatible with vi
set nocompatible

" Set lines of history
set history=500

" Enable filetype plugin
filetype plugin on

" Set encoding to utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" Set backspace settings
set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Set number of vertical lines before screen jumps
set so=7

" Always show current position
set ruler

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Ignore case on searching
set ignorecase

" Do not copy line numbers but show them
set nonu
set number

" Bracket matching
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" GVIM options
if has("gui_running")
    " Remove GUI toolbar
    set guioptions-=T
    set t_Co=256
    colorscheme molokai
else
    colorscheme desert
endif

set cursorline

" Color line numbers differently
highlight LineNr term=NONE cterm=NONE ctermfg=LightGrey ctermbg=Black gui=NONE guifg=LightGrey guibg=Black

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on backup and swap
set backup
set swapfile

" Set backup directory
set backupdir=~/.vim/backup
set directory=~/.vim/swap

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Text and indentation settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation settings
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Disable max line width
set textwidth=0

" Disable line wrapping
set nowrap

" Incremental searching
set incsearch

" Show whitespace: tabs and trailing spaces
set listchars=tab:→\ ,trail:·
set list

command Rmws %s/\s\+$//

" Enable auto commenting
set formatoptions-=co formatoptions+=r

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Global key maps
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable % matching while typing
inoremap    <c-5>      <ESC>%i
" Enable jump to end of line while typing
noremap     <c-e>      $
inoremap    <c-e>      <ESC>A
" Enable jump to start of line while typing
noremap     <c-q>      ^
inoremap    <c-q>      <ESC>I
noremap     <c-a>      0i
inoremap    <c-a>      <ESC>0i
" Don't use autoindent
inoremap    <c-RETURN>   <ESC>:set autoindent!<CR>i<RIGHT><CR><ESC>:set autoindent<CR>i
" Insert date
inoremap    <c-d>      <C-R>=strftime("%Y-%m-%d")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""
" HTML
"""""""""""""

    " Indentation settings
    au FileType html,xml,erb set tabstop=2
    au FileType html,xml,erb set shiftwidth=2

"""""""""""""
" Ruby
"""""""""""""

    " Indentation settings
    au FileType ruby set tabstop=2
    au FileType ruby set shiftwidth=2
    au FileType treetop set tabstop=2
    au FileType treetop set shiftwidth=2
    " Header function
    au FileType ruby inoremap $head #!/usr/local/bin/ruby -W0<CR>####################################################<CR> Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR><CR>Author:   John Wright (JCWR)<CR>Phone:    859-977-7589<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>###################################################<CR><BS><CR>
    "au FileType ruby inoremap $cy   #!/usr/local/bin/ruby -W0<CR><CR> $Id: $<CR><CR>Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR>Cypress Kentucky CAD Center (KYCC)<CR><CR>Date  : <C-R>=strftime("%b %d, %Y")<CR>Author: John Wright (jcwr) @KYCC<CR><CR>Description:<CR>  TODO<CR><BS><BS><CR>Revision History:<CR>  jcwr <C-R>=strftime("%x")<CR> initial version<CR><CR><BS><BS><BS><BS><CR>
    " Auto write updated time
    "au BufWritePre *.rb,*.ruby 10s/^\# Updated:.*$/\=strftime("# Updated:  %x %X (%Z)")/

"""""""""""""
" Perl
"""""""""""""

    " Header function
    "au FileType perl inoremap $head #!/usr/local/bin/perl<CR>####################################################<CR> Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR><CR>Author:   John Wright<CR>Initials: JCWR<CR>Phone:    859-977-7589<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>###################################################<CR><BS><CR>
    " Auto write updated time
    "au BufWritePre *.pl,*.perl 10s/^# Updated:.*$/\=strftime("# Updated:  %x %X (%Z)")/

"""""""""""""
" C
"""""""""""""

    " Header function
    "au FileType c,cpp inoremap $head /****************************************************<CR>Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR><CR>Author:   John Wright<CR>Initials: JCWR<CR>Phone:    859-977-7589<CR><CR>File:    <C-R>=expand("%:t")<CR><CR>Created: <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>***************************************************/<CR><BS><CR>
    " Main function
    au FileType c,cpp inoremap $main int main(int argc, char** argv) {<CR><CR>}<UP><TAB>
    " Includes
    au FileType c inoremap $inc #include <stdio.h><CR><CR>
    au FileType cpp inoremap $inc #include <iostream><CR><CR>using namespace std;<CR><CR>
    " Auto write updated time
    "au BufWritePre *.c,*.cc,*.cpp 10s/^ \* Updated:.*$/\=strftime(" * Updated: %x %X (%Z)")/

"""""""""""""
" Scala
"""""""""""""
    au FileType scala set tabstop=2
    au FileType scala set shiftwidth=2

"""""""""""""
" Java
"""""""""""""

    " Header function
    "au FileType java inoremap $head /****************************************************<CR>Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR>Author:   John Wright<CR>Initials: JCWR<CR>Phone:    859-977-7589<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History::<CR><CR><BS>***************************************************/<CR><BS><CR>
    "TODO add javadoc
    " Main function
    au FileType java inoremap $main public class <C-R>=expand("%:t:r")<CR> {<CR><CR><CR><CR>}<UP><UP><TAB>public static void main(String [] args) {<CR><CR>}<UP><TAB><TAB>
    " Includes
    au FileType java inoremap $inc import java.util.*;<CR><CR>
    " Auto write updated time
    "au BufWritePre *.java 10s/^ \* Updated:.*$/\=strftime(" * Updated: %x %X (%Z)")/

"""""""""""""
" Python
"""""""""""""

    "au FileType python set expandtab!
    au FileType python inoremap $head #!/usr/bin/env python<CR># John C. Wright<CR>johnwright@eecs.berkeley.edu<CR>University of California, Berkeley<CR><CR>Created <C-R>=strftime("%x %X (%Z)")<CR><CR><CR>File: <C-R>=expand("%:t")<CR>
    au FileType python set tabstop=2
    au FileType python set shiftwidth=2

"""""""""""""
" Scala
"""""""""""""

    au FileType scala set tabstop=2
    au FileType scala set shiftwidth=2

"""""""""""""
" Skill
"""""""""""""

"""""""""""""
" Verilog
"""""""""""""

    " Indentation settings
    au FileType verilog set tabstop=2
    au FileType verilog set shiftwidth=2
    " Header function
    "au FileType verilog inoremap $head <ESC>:set autoindent!<CR>i/****************************************************<CR>Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR><CR>Author:   John Wright<CR>Initials: JCWR<CR>Phone:    859-977-7589<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>***************************************************/<CR><BS><CR><ESC>:set autoindent<CR>i
    " Main function
    au FileType verilog inoremap $main module <C-R>=expand("%:t:r")<CR>( );<CR><CR>endmodule<UP><TAB>
    " Always block with clock
    au FileType verilog inoremap $always always@(posedge clk)<CR>begin<CR>end<ESC>O<TAB>
    " Auto write updated time
    "au BufWritePre *.v 10s/^ \* Updated:.*$/\=strftime(" * Updated: %x %X (%Z)")/

"""""""""""""
" Makefile
"""""""""""""

    " Use real tabs
    au FileType Makefile set expandtab!

"""""""""""""
" Shell
"""""""""""""

"""""""""""""
" Spice Netlist
"""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""
set fdm=syntax
set foldlevelstart=20
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"""""""""""""""""""""""""""""""""""""""""""""""""""
" External scripts
"""""""""""""""""""""""""""""""""""""""""""""""""""

