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

"==============================================================================================
filetype on
set smartindent              " 设置智能缩进
set shortmess=atI            " 去掉欢迎界面
set t_Co=256                 " 默认为8色，改为256
set background=dark          " 背景色
colorscheme molokai        " sublime的配色方案 = molokai
set guifont=Consolas:h12     " 字体与字号
set tabstop=4                " 设置tab键的宽度
set expandtab                " 空格代替tab
set autoindent
set shiftwidth=2             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=2     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
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
" The following is the Plugins' setting
"###############################################################################

"--------------------------------------------------------------------------------
"   TagList : Tlist
"--------------------------------------------------------------------------------
"let Tlist_Ctags_Cmd = '$HOME/vimfiles/bundle/ctags.exe/ctags.exe'      "设置ctags路径 如果没设置PATH变量，需要使用此选项设置一下
"let Tlist_Auto_Open = 1                     "启动vim后自动打开taglist窗口<F5>
let Tlist_Show_One_File = 1                 "不同时显示多个文件的tag，仅显示一个
let Tlist_Exit_OnlyWindow = 1               "taglist为最后一个窗口时，退出vim
"let Tlist_Use_Right_Window =1               "taglist窗口显示在右侧，缺省为左侧
let Tlist_File_Fold_Auto_Close=1            "自动折叠
"let Tlist_WinHeight = 100                  "设置taglist窗口大小
let Tlist_WinWidth = 40
"设置taglist打开关闭的快捷键F8
"noremap <F8> :TlistToggle<CR>
"更新ctags标签文件快捷键设置
"noremap <F5> :!ctags -R<CR>



"--------------------------------------------------------------------------------
"   vim-airline
"--------------------------------------------------------------------------------
set laststatus=2



"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
let g:AutoOpenWinManager = 1 "开启Vim时自动打开
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
"let g:AutoOpenWinManager = 1 "在进入vim时自动打开winmanager
"切换到最下面一个窗格
nmap <C-w><C-b> :BottomExplorerWindow<cr>
"切换到最上面一个窗格
nmap <C-w><C-f> :FirstExplorerWindow<cr>
"是nomal模式的命令，不是Ex模式的
nmap wm :WMToggle<cr>
"定义快捷键
"nmap <silent> <F7> :WMToggle<cr>

"自动打开，需要加在winmanager.vim中
" "set auto open Winmanager
" if g:AutoOpenWinManager
"     autocmd VimEnter * nested call s:StartWindowsManager()|1wincmd w
" endif


"--------------------------------------------------------------------------------
" MiniBufExplorer
"--------------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne = 0


"--------------------------------------------------------------------------------
" The-NERD-tree
"--------------------------------------------------------------------------------
"nmap <silent> <F2> :NERDTreeMirror<CR>
"nmap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25          "窗口大小
let NERDTreeWinPos='left'       "窗口位置
let NERDTreeShowLineNumbers=1   "是否默认显示行号
let NERDTreeShowHidden=0        "是否默认显示隐藏文件


"--------------------------------------------------------------------------------
" SuperTab :SuperTabHelp
"--------------------------------------------------------------------------------
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


"--------------------------------------------------------------------------------
" YouCompleteMe
"--------------------------------------------------------------------------------
"if has("win64")
"    let g:ycm_global_ycm_extra_conf = $VIM.'/vimfiles/bundle/YouCompleteMe-x64/python/.ycm_extra_conf.py'
"elseif has("win32")
"    let g:ycm_global_ycm_extra_conf = $VIM.'/vimfiles/bundle/YouCompleteMe-x86/python/.ycm_extra_conf.py'
"else
"    let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/bundle/YouCompleteMe/python/.ycm_extra_conf.py'
"endif
"let g:ycm_autoclose_preview_window_after_completion=1             "完成操作之后，自动补全窗口不会消失
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>    "定义了“转到定义”的快捷方式。
let g:ycm_python_binary_path = 'C:\Python27'


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
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
"Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'tikhomirov/vim-glsl'
Bundle 'beyondmarc/hlsl.vim'
Bundle 'altercation/vim-colors-solarized'
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
"Bundle 'SuperTab'
"Bundle 'vimwiki'
"Bundle 'matrix.vim--Yang'
"Bundle 'FencView.vim'
"Bundle 'Conque-Shell'
"Bundle 'Markdown'
"Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
"Bundle 'c.vim'
"Bundle 'snipMat
"Bundle 'VimLite'
"Bundle 'slang_syntax'
Bundle 'molokai'
Bundle 'cg.vim'
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
"要配置环境变量PYTHONPATH = C:\Python27\Lib 还有含有.py和.pyd都要加进去
Bundle 'Python-mode-klen'
"======================================= non github reposo =======================================
" non github reposo
" 非github的插件，可以直接使用其git地址
"Bundle 'git://git.wincent.com/command-t.git'
"shader插件整合:https://github.com/tikhomirov/vim-glsl https://github.com/beyondmarc/hlsl.vim https://github.com/vim-scripts/cg.vim"
"Bundle 'https://git.oschina.net/qiuchangjie/ShaderHighLight.git'

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
