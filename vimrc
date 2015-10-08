execute pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required

let path='$HOME/vimfiles/bundle'
set rtp+=$HOME/vimfiles/bundle/vundle
call vundle#begin('$HOME/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Townk/vim-autoclose'
Plugin 'szw/vim-ctrlspace'
Plugin 'flazz/vim-colorschemes'
Plugin 'edkolev/promptline.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

" Promptline
" :PromptlineSnapshot! ~/.shell_prompt.sh [theme] [preset]
let g:promptline_powerline_symbols=1
let g:promptline_theme='airline'
let g:promptline_preset = {
	\'a'	: [ promptline#slices#user(), promptline#slices#host({ 'only_if_ssh': 1 }) ],
	\'b'    : [ promptline#slices#cwd() ],
	\'c'    : [ promptline#slices#vcs_branch() ],
	\'z'	: [ promptline#slices#git_status() ],
	\'warn' : [ promptline#slices#last_exit_code() ]}

" Vim
set number " Show line numbers
set ruler " Show column numbers
set autoindent
set hidden
colorscheme papercolor

" Remaps
nnoremap <silent><C-p> :CtrlSpace O<CR>

" ConEmu
if !has("gui_running") && !empty($CONEMUBUILD)
    set term=xterm
    set mouse=a
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
    nnoremap <Esc>[62~ <C-E>
    nnoremap <Esc>[63~ <C-Y>
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    let g:airline_theme='zenburn'
    colorscheme zenburn
endif

