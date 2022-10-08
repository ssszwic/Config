"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding, add support for Chinese"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2112,cp936
set termencoding=utf-8
set encoding=utf-8
set backspace=2
" display row number
set number

" highlight current line
set cursorline

" highlight current column
" set cursorcolumn

" display match for bracket
set showmatch

" set 'Tab' length to 4 'Space'
set tabstop=4
set shiftwidth=4
set autoindent

" set 'Tab' replaced bt space
set expandtab

" set search highlight
set hlsearch

" display 'Tap' and 'Space'
set listchars=tab:>-,trail:-

" always display status and current cursor
set laststatus=2
set ruler

" set file type detect
filetype plugin indent on

" setting takes effect immediately after save
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" vim-plug
call plug#begin('~/.vim/plugged')
" Shorthand notation for plugin
Plug 'SirVer/ultisnips'
Plug 'ssszwic/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
call plug#end()

" ultisnips config
let g:UltiSnipsExpandTrigger="<c-e>"
" 使用 c-n  切换下一个触发点，c-e 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"

" Netrw
" open browse with vertical split window
let g:netrw_browse_split = 2
" hidde banner
let g:netrw_banner = 0
" set width of brower: 25%
let g:netrw_winsize = 25

"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters = {
\   'verilog': ['iverilog'],
\   'systemverilog': ['hdl_checker']
\}
