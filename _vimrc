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
set smartindent              " ������������
set shortmess=atI            " ȥ����ӭ����
set t_Co=256                 " Ĭ��Ϊ8ɫ����Ϊ256
set background=dark          " ����ɫ
colorscheme molokai        " sublime����ɫ���� = molokai
set guifont=Consolas:h12     " �������ֺ�
set tabstop=4                " ����tab���Ŀ��
set expandtab                " �ո����tab
set autoindent
set shiftwidth=2             " ����ʱ�м佻��ʹ��4���ո�
set autoindent               " �Զ�����
set backspace=2              " �����˸������
set cindent shiftwidth=2     " �Զ�����4�ո�
set smartindent              " �����Զ�����
set ai!                      " �����Զ�����
set nu!                      " ��ʾ�к�
set mouse=a                  " �������
set ruler                    " ���½���ʾ���λ�õ�״̬��
set incsearch                " ����bookʱ��������/bʱ���Զ��ҵ�
set hlsearch                 " ����������ʾ���
set incsearch                " ����ʵʱ��������
set nowrapscan               " �������ļ�����ʱ����������
set nocompatible             " �رռ���ģʽ
set vb t_vb=                 " �ر���ʾ��
set hidden                   " ��������δ������޸�ʱ�л�������
set list                     " ��ʾTab����ʹ��һ�������ߴ���
set listchars=tab:\|\ ,
set foldenable               " �����۵�
set foldmethod=marker        " ��־�۵�
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
syntax enable                " ���﷨����
syntax on                    " �����ļ��������
filetype indent on           " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on           " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on    " �����Զ���ȫ
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8
"��ʾ����Ҫ�Ŀհ��ַ�
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"###############################################################################
" The following is the Plugins' setting
"###############################################################################

"--------------------------------------------------------------------------------
"   TagList : Tlist
"--------------------------------------------------------------------------------
"let Tlist_Ctags_Cmd = '$HOME/vimfiles/bundle/ctags.exe/ctags.exe'      "����ctags·�� ���û����PATH��������Ҫʹ�ô�ѡ������һ��
"let Tlist_Auto_Open = 1                     "����vim���Զ���taglist����<F5>
let Tlist_Show_One_File = 1                 "��ͬʱ��ʾ����ļ���tag������ʾһ��
let Tlist_Exit_OnlyWindow = 1               "taglistΪ���һ������ʱ���˳�vim
"let Tlist_Use_Right_Window =1               "taglist������ʾ���Ҳ࣬ȱʡΪ���
let Tlist_File_Fold_Auto_Close=1            "�Զ��۵�
"let Tlist_WinHeight = 100                  "����taglist���ڴ�С
let Tlist_WinWidth = 40
"����taglist�򿪹رյĿ�ݼ�F8
"noremap <F8> :TlistToggle<CR>
"����ctags��ǩ�ļ���ݼ�����
"noremap <F5> :!ctags -R<CR>



"--------------------------------------------------------------------------------
"   vim-airline
"--------------------------------------------------------------------------------
set laststatus=2



"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
let g:AutoOpenWinManager = 1 "����Vimʱ�Զ���
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
"let g:AutoOpenWinManager = 1 "�ڽ���vimʱ�Զ���winmanager
"�л���������һ������
nmap <C-w><C-b> :BottomExplorerWindow<cr>
"�л���������һ������
nmap <C-w><C-f> :FirstExplorerWindow<cr>
"��nomalģʽ���������Exģʽ��
nmap wm :WMToggle<cr>
"�����ݼ�
"nmap <silent> <F7> :WMToggle<cr>

"�Զ��򿪣���Ҫ����winmanager.vim��
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
let NERDTreeWinSize=25          "���ڴ�С
let NERDTreeWinPos='left'       "����λ��
let NERDTreeShowLineNumbers=1   "�Ƿ�Ĭ����ʾ�к�
let NERDTreeShowHidden=0        "�Ƿ�Ĭ����ʾ�����ļ�


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
"let g:ycm_autoclose_preview_window_after_completion=1             "��ɲ���֮���Զ���ȫ���ڲ�����ʧ
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>    "�����ˡ�ת�����塱�Ŀ�ݷ�ʽ��
let g:ycm_python_binary_path = 'C:\Python27'


"###############################################################################
"                               The vundle' setting
"###############################################################################
"=====================================vundle====================================
" set rtp+=~/.vim/bundle/vundle/
" �����windows��ʹ�õĻ�������Ϊ
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')
Bundle 'gmarik/vundle'


"=============================== original repos on github ======================
" github�ϵ��û�д�Ĳ����ʹ�������û���+repo���Ƶķ�ʽ
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
" vimscripts��repoʹ������ĸ�ʽ��ֱ���ǲ������ http://vim-scripts.org/
"ctags.exe win��������ɺ�1.�ŵ�c�̵�system32�ļ����к�vim��plugin�У�2.����plugin�Ļ�������
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
"Ҫ���û�������PYTHONPATH = C:\Python27\Lib ���к���.py��.pyd��Ҫ�ӽ�ȥ
Bundle 'Python-mode-klen'
"======================================= non github reposo =======================================
" non github reposo
" ��github�Ĳ��������ֱ��ʹ����git��ַ
"Bundle 'git://git.wincent.com/command-t.git'
"shader�������:https://github.com/tikhomirov/vim-glsl https://github.com/beyondmarc/hlsl.vim https://github.com/vim-scripts/cg.vim"
"Bundle 'https://git.oschina.net/qiuchangjie/ShaderHighLight.git'

"======================================= plugin file ================================
"Vim\vimfiles\plugin �µ��ļ�Ŀ¼




"=========================================== Brief help ==========================================
"
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" vundle��Ҫ������������ĸ��������BundleInstall��ȫ�����°�װ��BundleInstall!���Ǹ���
" һ�㰲װ���������Ϊ����BundleSearchһ�������Ȼ�����б���ѡ�У���i��װ
" ��װ��֮����vimrc�У����Bundle 'XXX'��ʹ��bundle�ܹ����أ���������ͬʱ���
" ��Ҫ������������Ҳ����vimrc�����ü���
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
