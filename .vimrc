call plug#begin()
Plug 'https://github.com/bfrg/vim-cpp-modern.git'
call plug#end()


" Mouse support
set mouse=
set ttymouse=
set balloonevalterm

" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"

" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"

" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"

" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"

" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"

" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"

" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

" Tab and indent related functionality.
set tabstop=8 "
set softtabstop=8 " Number of spaces in a tab.
set shiftwidth=8 " Number of auto-indent spaces.
set autoindent " Auto-indent new lines.

" File and formatting.
set fileformat=unix
set encoding=utf-8
set paste " Fixes some weird pasting issues.

" File display.
set number relativenumber " Sets line numbers relative to the current line.
set display=truncate
set showmatch " Show matching/closing parentheses and braces.
syntax on " Enable syntax highlighting.

" Open files relative to the current one.
" set autochdir " Make the current working directory "follow" the current buffer.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" Cursor options.
set ttimeout
set ttimeoutlen=1
set ttyfast

" autocmd InsertEnter * set cursorline
" autocmd InsertLeave * set nocursorline

" Unbinds arrow keys in normal and insert modes.
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
endfor

" Remap jk/kj to exitting normal mode.
inoremap jk <esc>
inoremap kj <esc>

" Searching.
set hlsearch " Highlights all search results.
set incsearch " Search for strings incrementally
" Binds C-l to unhighlighting search results temporarily.
noremap <silent> <c-l> :nohls<cr><c-l>

let @c = "ggO/* * filename:	=expand('%:t')��k:pu=strftime('%m.%d.%y')i * date:	��ko * author:	Lucas Merritt/merrittlj * description:	 */��kkk$a"
