syntax on
filetype plugin indent on
set number

set softtabstop=4 shiftwidth=4 expandtab
autocmd FileType make set noexpandtab
autocmd FileType sh set noexpandtab tabstop=4

" markdown style tables
"let g:table_mode_corner_corner="|"
"let g:table_mode_header_fillchar="-"

"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'raw'

"instant markdown
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
"set noshowmode

" This is only necessary if you use "set termguicolors".
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors
colorscheme slate
set background=dark
"autocmd BufNewFile,BufRead *.md set filetype=markdown

" Powerline Configuration
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
