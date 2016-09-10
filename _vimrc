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
let mapleader = ','          " �ض���<leader>
autocmd GUIEnter * simalt ~x " �򿪴������
"set lines=35 columns=118     " ���ô��ڳ�
set guioptions-=T            "�����ع�����
set guioptions-=m            "�����ز˵���
set smartindent              " ������������{
set shortmess=atI            " ȥ����ӭ����
set t_Co=256                 " Ĭ��Ϊ8ɫ����Ϊ256
set background=dark          " ����ɫ
colorscheme molokai        " sublime����ɫ���� = molokai
set guifont=Consolas:h12     " �������ֺ�
set expandtab                " �ո����tab
set tabstop=4                " Tab�Ŀ�� Ĭ��8
set shiftwidth=4             " ������� Ĭ��8
set cindent shiftwidth=4     " �Զ�����4�ո�
set autoindent               " �Զ�������ͨ����smartindentͬʱ��
set smartindent              " �����Զ�����
set ai!                      " �����Զ�����
set backspace=2              " �����˸������
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
set cursorline               " ���ù��ʮ�����꣬������ǰ��
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
"   System KeyBoard Setting
"###############################################################################
nmap <leader>w :w!<cr>              " ǿ�б���
nmap <leader>q :q!<cr>              " ǿ�в������˳�
nmap <leader>wq :wq<cr>             " �����˳�
map <leader>bd :Bclose<cr>          " �رյ�ǰ������
map <leader>tn :tabnew %<cr>        " ����ǰ�������±�ǩ�д�
map <leader>te :tabedit             " �򿪿հ��±�ǩ
map <leader>tc :tabclose<cr>        " �رյ�ǰ��ǩ
map <leader>tm :tabmove             " �ƶ���ǰ��ǩ�����






"###############################################################################
" The following is the Plugins' setting
"###############################################################################

"--------------------------------------------------------------------------------
"   TagList : Tlist
"--------------------------------------------------------------------------------
let Tlist_Ctags_Cmd = '$VIM\vimfiles\bundle\ctags.exe\ctags.exe'      "����ctags·�� ���û����PATH��������Ҫʹ�ô�ѡ������һ��
"����taglist�򿪹رյĿ�ݼ�F8
"noremap <F8> :TlistToggle<CR>
"����ctags��ǩ�ļ���ݼ�����
"noremap <F5> :!F:/Vim/vimfiles/bundle/ctags.exe/ctags.exe -R
let Tlist_Auto_Highlight_Tag = 1            "�Զ�������ǰtag
let Tlist_Auto_Open = 0                     "��Vim���ļ�ʱ�Զ���Taglist����
let Tlist_Auto_Update = 1                   "�Զ��������±༭�ļ���taglist
let Tlist_Close_On_Select = 0               "ѡ����tag���Զ��ر�taglist����
let Tlist_Compact_Format = 0                "���ٱ�ǩ�б����еĿհ���
let Tlist_Display_Prototype = 0             "�Ƿ��ڱ�ǩ�б����ñ�ǩԭ�������ǩ��
let Tlist_Display_Tag_Scope = 1             "�ڱ�ǩ�����Ƿ���ʾ��ǩ��Ч��Χ
let Tlist_Enable_Fold_Column = 0            "�Ƿ���ʾVimĿ¼��
let Tlist_Exit_OnlyWindow = 1               "Vim��ǰ���򿪱�ǩ�б���ʱ���Ƿ��Զ��˳�Vim
let Tlist_File_Fold_Auto_Close = 1          "�Զ��رձ�ǩ�б����зǼ����ļ�/�����������ĵ���ǩ��������ʾ��ǰ��������ǩ��
let Tlist_GainFocus_On_ToggleOpen = 0       "Ϊ1��ʹ��TlistToggle�򿪱�ǩ�б��ں��񽹵����ڱ�ǩ�б��ڣ�Ϊ0��taglist�򿪺󽹵��Ա����ڴ��봰��
let Tlist_Hightlight_Tag_On_BufEnter = 1    "Ĭ������£�Vim��/�л���һ���µĻ�����/�ļ��󣬱�ǩ�б��ڻ��Զ�����ǰ���봰�ڶ�Ӧ�ı�ǩ������ʾ��
                                            "TlistHighlight_Tag_On_BufEnter��Ϊ0�ɽ�ֹ������Ϊ
let Tlist_Inc_Winwidth = 0                  "��ʾ��ǩ�б���ʱ����/��ֹ��չVim���ڿ��
let Tlist_Max_Submenu_Items = 1             "�Ӳ˵�������ֵ�����Ӳ˵��������Tlist_GainFocus_On_ToggleOpen�޽��ᱻ�ָ�������Ӳ˵��С�ȱʡֵΪ25
let Tlist_Max_Tag_Length = 30               "��ǩ�˵��б�ǩ��������
let Tlist_Process_File_Always = 0           "Ϊ1��ʹ��ǩ�б���δ�򿪣�taglist��Ȼ���ں�̨����vim�����ļ��ı�ǩ
let Tlist_Show_Menu = 0                     "��ͼ�ͽ���Vim�У��Ƿ��������˵���ʽ��ʾ��ǰ�ļ��еı�ǩ
let Tlist_Show_One_File = 1                 "��ͬʱ��ʾ����ļ���tag������ʾһ��
let Tlist_Sort_Type = "order"
"let Tlist_Use_Horiz_Window = 0             "��ǩ�б���ʹ��ˮƽ�ָ���ʽ
"let Tlist_Use_Right_Window = 0              "��ǩ�б�����ʾ���Ҳࣨʹ�ô�ֱ�ָ���ʽʱ��
"let Tlist_WinWidth = 30                     "�趨ˮƽ�ָ�ʱ��ǩ�б��ڵĿ��
"let Tlist_WinHeight = 30                    "����taglist���ڴ�




"--------------------------------------------------------------------------------
" The-NERD-tree
"--------------------------------------------------------------------------------
"nmap <silent> <F2> :NERDTreeMirror<CR>
"nmap <silent> <F2> :NERDTreeToggle<CR>
"let NERDTreeWinSize=30                  "���ڴ�С
let NERDTreeWinPos='left'               "����λ��
let NERDTreeShowLineNumbers=1           "�Ƿ�Ĭ����ʾ�к�
let NERDTreeShowHidden=0                "�Ƿ�Ĭ����ʾ�����ļ�
"����ʾָ�������͵��ļ�
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let NERDTreeCaseSensitiveSort=0         "���ִ�Сд����
let NERDTreeHighlightCursorline=1       "����NERDTrre���ڵĵ�ǰ��
"let NERDTreeShowHidden=1               "��ʾ�����ļ�
"autocmd VimEnter * NERDTree             "�Զ���



"--------------------------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------------------------
let g:AutoOpenWinManager = 1 "����Vimʱ�Զ���
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0

"�Զ���
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
let g:indent_guides_enable_on_vim_startup = 1            "1���� 2�ر�
let g:indent_guides_auto_colors = 1
"let g:indent_guides_guide_size = 1                       "ָ�������ߵĳߴ�
let g:indent_guides_start_level = 2                      "�ӵڶ��㿪ʼ���ӻ���ʾ����



"--------------------------------------------------------------------------------
" Python-mode-klen
"--------------------------------------------------------------------------------
"------����ͷ���֮������ƶ���ѡ�������ƣ�ɾ����
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

let g:pymode_lint_ignore = "E226"     " ���Զ����﷨���ʱ����ʾ����������
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 0
let g:pymode_lint_write = 1           " Auto check on save
let g:pymode_virtualenv = 1           " ֧��virtualenv��������õ�
let g:pymode_breakpoint = 1           " �����ϵ�
"let g:pymode_breakpoint_bind ='<F4>'  " F4��ϵ�
let g:pymode_run = 0                  " ���ﲻ����������python�������Զ�����F5��ݼ�

let g:pymode_syntax = 1               " �﷨����
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all






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
" vimscripts��repoʹ������ĸ�ʽ��ֱ���ǲ������ http://vim-scripts.org/
"ctags.exe win��������ɺ�1.�ŵ�c�̵�system32�ļ����к�vim��plugin�У�2.����plugin�Ļ�������
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
" ��github�Ĳ��������ֱ��ʹ����git��ַ
"Bundle 'git://git.wincent.com/command-t.git'

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
