set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"###############################################################################
"   System Setting
"###############################################################################
filetype on
let mapleader = ','          " 重定义<leader>
autocmd GUIEnter * simalt ~x " 打开窗口最大化
"set lines=35 columns=118     " 设置窗口尺
set guioptions-=T            "是隐藏工具栏
set guioptions-=m            "是隐藏菜单栏
set smartindent              " 设置智能缩进{
set shortmess=atI            " 去掉欢迎界面
set t_Co=256                 " 默认为8色，改为256
set background=dark          " 背景色
colorscheme molokai        " sublime的配色方案 = molokai
set guifont=Consolas:h12     " 字体与字号
set expandtab                " 空格代替tab
set tabstop=4                " Tab的宽度 默认8
set shiftwidth=4             " 缩进深度 默认8
set cindent shiftwidth=4     " 自动缩进4空格
set autoindent               " 自动缩进，通常与smartindent同时打开
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set backspace=2              " 设置退格键可用
set nu!                      " 显示行号
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 查找book时，当输入/b时会自动找到
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音
set hidden                   " 允许在有未保存的修改时切换缓冲区
set list                     " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\ ,
set foldenable               " 允许折叠
set foldmethod=marker        " 标志折叠
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
set cursorline               " 设置光标十字坐标，高亮当前行
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
"标示不必要的空白字符
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/




"###############################################################################
"   System KeyBoard Setting
"###############################################################################
nmap <leader>w :w!<cr>              " 强行保存
nmap <leader>q :q!<cr>              " 强行不保存退出
nmap <leader>wq :wq<cr>             " 保存退出
map <leader>bd :Bclose<cr>          " 关闭当前缓冲区
map <leader>tn :tabnew %<cr>        " 将当前内容在新标签中打开
map <leader>te :tabedit             " 打开空白新标签
map <leader>tc :tabclose<cr>        " 关闭当前标签
map <leader>tm :tabmove             " 移动当前标签到最后






"###############################################################################
" The following is the Plugins' setting
"###############################################################################

"--------------------------------------------------------------------------------
"   TagList : Tlist
"--------------------------------------------------------------------------------
let Tlist_Ctags_Cmd = '$VIM\vimfiles\bundle\ctags.exe\ctags.exe'      "设置ctags路径 如果没设置PATH变量，需要使用此选项设置一下
"设置taglist打开关闭的快捷键F8
"noremap <F8> :TlistToggle<CR>
"更新ctags标签文件快捷键设置
"noremap <F5> :!F:/Vim/vimfiles/bundle/ctags.exe/ctags.exe -R
let Tlist_Auto_Highlight_Tag = 1            "自动高亮当前tag
let Tlist_Auto_Open = 0                     "用Vim打开文件时自动打开Taglist窗口
let Tlist_Auto_Update = 1                   "自动更新最新编辑文件的taglist
let Tlist_Close_On_Select = 0               "选择了tag后自动关闭taglist窗口
let Tlist_Compact_Format = 0                "减少标签列表窗口中的空白行
let Tlist_Display_Prototype = 0             "是否在标签列表窗口用标签原型替代标签名
let Tlist_Display_Tag_Scope = 1             "在标签名后是否显示标签有效范围
let Tlist_Enable_Fold_Column = 0            "是否不显示Vim目录列
let Tlist_Exit_OnlyWindow = 1               "Vim当前仅打开标签列表窗口时，是否自动退出Vim
let Tlist_File_Fold_Auto_Close = 1          "自动关闭标签列表窗口中非激活文件/缓冲区所在文档标签树，仅显示当前缓冲区标签树
let Tlist_GainFocus_On_ToggleOpen = 0       "为1则使用TlistToggle打开标签列表窗口后会获焦点至于标签列表窗口；为0则taglist打开后焦点仍保持在代码窗口
let Tlist_Hightlight_Tag_On_BufEnter = 1    "默认情况下，Vim打开/切换至一个新的缓冲区/文件后，标签列表窗口会自动将当前代码窗口对应的标签高亮显示。
                                            "TlistHighlight_Tag_On_BufEnter置为0可禁止以上行为
let Tlist_Inc_Winwidth = 0                  "显示标签列表窗口时允许/禁止扩展Vim窗口宽度
let Tlist_Max_Submenu_Items = 1             "子菜单项上限值。如子菜单项超出此上Tlist_GainFocus_On_ToggleOpen限将会被分隔到多个子菜单中。缺省值为25
let Tlist_Max_Tag_Length = 30               "标签菜单中标签长度上限
let Tlist_Process_File_Always = 0           "为1则即使标签列表窗口未打开，taglist仍然会在后台处理vim所打开文件的标签
let Tlist_Show_Menu = 0                     "在图型界面Vim中，是否以下拉菜单方式显示当前文件中的标签
let Tlist_Show_One_File = 1                 "不同时显示多个文件的tag，仅显示一个
let Tlist_Sort_Type = "order"
"let Tlist_Use_Horiz_Window = 0             "标签列表窗口使用水平分割样式
"let Tlist_Use_Right_Window = 0              "标签列表窗口显示在右侧（使用垂直分割样式时）
"let Tlist_WinWidth = 30                     "设定水平分割时标签列表窗口的宽度
"let Tlist_WinHeight = 30                    "设置taglist窗口大




"--------------------------------------------------------------------------------
" The-NERD-tree
"--------------------------------------------------------------------------------
"nmap <silent> <F2> :NERDTreeMirror<CR>
"nmap <silent> <F2> :NERDTreeToggle<CR>
"let NERDTreeWinSize=30                  "窗口大小
let NERDTreeWinPos='left'               "窗口位置
let NERDTreeShowLineNumbers=1           "是否默认显示行号
let NERDTreeShowHidden=0                "是否默认显示隐藏文件
"不显示指定的类型的文件
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let NERDTreeCaseSensitiveSort=0         "不分大小写排序
let NERDTreeHighlightCursorline=1       "高亮NERDTrre窗口的当前行
"let NERDTreeShowHidden=1               "显示隐藏文件
"autocmd VimEnter * NERDTree             "自动打开



"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
let g:AutoOpenWinManager = 1 "开启Vim时自动打开
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0

"自动打开
autocmd VimEnter * WMToggle
function! NERDTree_Start()
    exe 'q'
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction



"--------------------------------------------------------------------------------
" MiniBufExplorer
"--------------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne = 0



"--------------------------------------------------------------------------------
" vim-airline
"--------------------------------------------------------------------------------
set laststatus=2



"--------------------------------------------------------------------------------
" EsayGrep
"--------------------------------------------------------------------------------
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2,
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"



"--------------------------------------------------------------------------------
" rainbow_parentheses.vim
"--------------------------------------------------------------------------------
let g:rbpt_colorpairs = [
\ ['brown', 'RoyalBlue3'],
\ ['Darkblue', 'SeaGreen3'],
\ ['darkgray', 'DarkOrchid3'],
\ ['darkgreen', 'firebrick3'],
\ ['darkcyan', 'RoyalBlue3'],
\ ['darkred', 'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown', 'firebrick3'],
\ ['gray', 'RoyalBlue3'],
\ ['black', 'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue', 'firebrick3'],
\ ['darkgreen', 'RoyalBlue3'],
\ ['darkcyan', 'SeaGreen3'],
\ ['darkred', 'DarkOrchid3'],
\ ['red', 'firebrick3'],
\ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



"--------------------------------------------------------------------------------
" vim-indent-guides
"-------------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1            "1开启 2关闭
let g:indent_guides_auto_colors = 1
"let g:indent_guides_guide_size = 1                       "指定对齐线的尺寸
let g:indent_guides_start_level = 2                      "从第二层开始可视化显示缩进



"--------------------------------------------------------------------------------
" Python-mode-klen
"--------------------------------------------------------------------------------
"------在类和方法之间快速移动，选定，复制，删除等
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)
" aC Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM Select a function or method. Ex: vaM, daM, yaM, caM(normal, operator modes)
" iM Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)

let g:pymode_motion = 1
let g:pymode_rope = 0

let g:pymode_doc = 1                  " K Show python docs
let g:pymode_doc_key = '<S-k>'

" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pep257 "

let g:pymode_lint_ignore = "E226"     " 以自定义语法检查时候提示到错误类型
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 0
let g:pymode_lint_write = 1           " Auto check on save
let g:pymode_virtualenv = 1           " 支持virtualenv，后面会用到
let g:pymode_breakpoint = 1           " 开启断点
"let g:pymode_breakpoint_bind ='<F4>'  " F4设断点
let g:pymode_run = 0                  " 这里不用它来运行python，我们自定义了F5快捷键

let g:pymode_syntax = 1               " 语法高亮
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all






"###############################################################################
"                               The vundle' setting
"###############################################################################
"=====================================vundle====================================
" set rtp+=~/.vim/bundle/vundle/
" 如果在windows下使用的话，设置为
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')
Bundle 'gmarik/vundle'

"=============================== original repos on github ======================
" github上的用户写的插件，使用这种用户名+repo名称的方式
Bundle 'bling/vim-airline'
Bundle 'tikhomirov/vim-glsl'
Bundle 'beyondmarc/hlsl.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nathanaelkane/vim-indent-guides'
"if has("win64")
"    Bundle 'snakeleon/YouCompleteMe-x64'
"elseif has("win32")
"    Bundle 'snakeleon/YouCompleteMe-x86'
"else
"    Bundle 'Valloric/YouCompleteMe'
"endif
"==================================== vim-scripts repos =========================
" vimscripts的repo使用下面的格式，直接是插件名称 http://vim-scripts.org/
"ctags.exe win：加载完成后，1.放到c盘的system32文件夹中和vim的plugin中，2.配置plugin的环境变量
Bundle 'ctags.exe'
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'minibufexplorerpp'
Bundle 'The-NERD-tree'
Bundle 'molokai'
Bundle 'cg.vim'
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
Bundle 'Python-mode-klen'
Bundle 'rainbow_parentheses.vim'
"Bundle 'AutoClose'
"Bundle 'EasyGrep'
"tagbar vim-multiple-cursors
"======================================= non github reposo =======================================
" non github reposo
" 非github的插件，可以直接使用其git地址
"Bundle 'git://git.wincent.com/command-t.git'

"======================================= plugin file ================================
"Vim\vimfiles\plugin 下的文件目录


"=========================================== Brief help ==========================================
"
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" vundle主要就是上面这个四个命令，例如BundleInstall是全部重新安装，BundleInstall!则是更新
" 一般安装插件的流程为，先BundleSearch一个插件，然后在列表中选中，按i安装
" 安装完之后，在vimrc中，添加Bundle 'XXX'，使得bundle能够加载，这个插件，同时如果
" 需要配置这个插件，也是在vimrc中设置即可
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
