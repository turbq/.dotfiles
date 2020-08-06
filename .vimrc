set nocompatible              " be iMproved, required
filetype off                  " required

" Plugin stuff -- {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Тут идут мои плагины
Plugin 'ycm-core/YouCompleteMe'
"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'		" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		" dependencies #2
"Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
"Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
"Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"------------------------------------------------------------------------
"-=PACKAGES=-
packadd! matchit

"------------------------------------------------------------------------
" }}}
" --COLORS-- -- {{{
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
set background=dark
color molokai
" }}}

" exrc. Она говорит vim'у искать дополнительный .vimrc в текущей рабочей директории. Таким образом, мы можем иметь один файлик в корне каждого проекта с его специфическими настройками.
set exrc
set secure

" YCM -- {{{
let g:ycm_server_python_interpreter = '/usr/bin/python3.8'
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" }}}

"-=Основные настройки=- -- {{{
" Включаем перенос строк (set nowrap отключает перенос строк)
set wrap

" Перенос строк по словам, а не по буквам
set linebreak

" Выключаем поддержку мыши при работе в терминале (для включения нужно устaновить mouse=a)
set mouse=

" Включаем подсветку синтаксиса
sy on

" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана
set showcmd

" Показывать строку с позицией курсора
set ruler

" Показывать первую парную скобку после ввода второй
set showmatch

" Показывать строку вкладок всегда
set showtabline=2

" Показывать строку статуса всегда
set laststatus=2

" Показывать имя буфера в заголовке терминала
set title

" Формат заголовка
set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\ VIM

" Использовать диалоги вместо сообщений об ошибках
set confirm

" Включаем отображение дополнительной информации в статусной строке
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

" Включаем виртуальный звонок (мигание вместо спикера)
set visualbell

" Не выгружать буфер, когда переключаемся на другой файл
set hidden

" Задаем фон терминала, что влияет на подсветку
"set background=dark

" Включает отображение номеров строк
"set number
set relativenumber

" Ширина нумерации строк
set numberwidth=3

" Ширина окна (не строгое значение)
set winwidth=83

" Максимальная ширина текста, более длинная строка будет разорвана.
set textwidth=68
let &textwidth = &textwidth + 10 "you can access variables like that


" Включаем ‘умную’ автоматическую расстановку отступов
"set smartindent

" Копирует отступ от предыдущей строки " наследовать отступы предыдущей строки
set autoindent

" Размер табуляции
set tabstop=4

" Размер сдвига при нажатии на клавиши «<" и «>"
set shiftwidth=4

" Настройка табов
set softtabstop=4 
set	expandtab 

" Включить подсветку невидимых символов
"set list

" Подсветка текущей строки
set cursorline

" При вставке фрагмента сохраняет отступы
"set pastetoggle=

" Включение автоматического перечитывания файла при изменении
"set autoread

" разбивать окно горизонтально снизу
set splitbelow

" разбивать окно вертикально справа
set splitright

" включить подсветку при поиске
set hls

" Минимальное количество строк снизу и верху курсора при скролле
set scrolloff=3

" отключить перерисовку окна при выполнении команд скрытых
set nolazyredraw

" Опции авто-дополнения
"set completeopt=longest,menuone

" }}}

" --FOLDING-- -- {{{
set foldenable

" Метод фолдинга — вручную (для обычных файлов)
set foldmethod=manual
set foldcolumn=3
set foldlevel=10
"let perl_folding=1
"let php_folding=1

" Метод фолдинга — по синтаксису
"set foldmethod=syntax
" }}}

" --RUS-ENG-- -- {{{
" Ctrl+^ = rus-eng
"set keymap=russian-jcukenwin
set keymap=russian-colemak
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
" }}}

" --ENCODING SEARCH BACKUP-- -- {{{
set encoding=utf-8

" Список кодировок файлов для авто-определения
set fileencodings=utf-8,koi8-r,cp1251,cp866

" При авто-дополнении в командной строке над ней выводятся возможные варианты
set wildmenu

"-=Поиск=-
" При поиске перескакивать на найденный текст в процессе набора строки (инкрементальный поиск)
set incsearch

" Если искомое выражения содержит символы в верхнем регистре — ищет с учётом регистра, иначе — без учёта only works when ignorecase is on
set ignorecase
set smartcase

" Размер истории для отмены правок
set undolevels=1000

"-=Swap и backup=-
" Создание swap файлов
set swapfile

" Все swap файлы будут помещаться в заданную директорию (туда скидываются открытые буферы)
set dir=~/.vim/swap/

" Создание бекапов (резервные копии файлов с окончанием «~" создаваться не будут)
set backup

" Если установлено set backup, то помещаются в этот каталог
set backupdir=~/.vim/backup/
" }}}

let mapleader=','
let maplocalleader="\\"
 
"-=Mappings=- -- {{{

" Просмотр списка буферов по <F4>
nmap <F4> <Esc>:buffers<CR>
vmap <F4> <Esc>:buffers<CR>
imap <F4> <Esc><Esc>:buffers<CR>
" предыдущий буфер
map <F5> :bp<CR>
vmap <F5> <Esc>:bp<CR>i
imap <F5> <Esc>:bp<CR>i
" следующий буфер
map <F6> :bn<CR>
vmap <F6> <Esc>:bn<cr>i
imap <F6> <Esc>:bn<cr>i

" Allow saving of files as sudo 
cmap w!! w !sudo tee > /dev/null %

" Insert space
nnoremap ss i<space><esc>

" Insert line
nnoremap <C-J> a<CR><Esc>k$

" Turn off highlightning
nnoremap <ESC><ESC> :nohls<CR>

" автокомплит через <Ctrl+Space>
"inoremap <C-space> <C-x><C-o>

" Better esc
inoremap ii <esc>

" True way
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" Vimrc edit and source
noremap <leader>ev :vs $MYVIMRC<cr>
noremap <leader>sv :so $MYVIMRC<cr>

" Convert uppercase
inoremap <c-u> <esc>viwUi
noremap <c-u> viwU

" Quotes add
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Operator-pending mappings
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" }}}

"-=COMMANDS=- -- {{{
" edit ~/.vimrc file
command! RcEdit vsp $MYVIMRC
" reload ~/.vimrc config
command! RcReload source $MYVIMRC

" help autocmd-events
" Creates a session -- {{{2
function! MakeSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:sessionfile = b:sessiondir . '/session.vim'
    exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS -- {{{2
function! UpdateSession()
    if argc()==0
        let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
        let b:sessionfile = b:sessiondir . "/session.vim"
        if (filereadable(b:sessionfile))
            exe "mksession! " . b:sessionfile
            echo "updating session"
        endif
    endif
endfunction

" Loads a session if it exists -- {{{2
function! LoadSession()
    if argc() == 0
        let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
        let b:sessionfile = b:sessiondir . "/session.vim"
        if (filereadable(b:sessionfile))
            exe 'source ' b:sessionfile
        else
            echo "No session loaded."
        endif
    else
        let b:sessionfile = ""
        let b:sessiondir = ""
    endif
endfunction

autocmd VimEnter * nested :call LoadSession()
autocmd VimLeave * :call UpdateSession()
map <leader>m :call MakeSession()<CR>
" Включить автоматическое сохранение всех сессий, добавив в ~/.vimrc
"autocmd VimLeavePre * silent mksession! ~/.vim/lastSession.vim

" Включить и автоматическую загрузку последней сохранённой сессии, добавив
"autocmd VimEnter * nested source ~/.vim/lastSession.vim

" FileType-specific settings -- {{{2
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>[ A -- {{{<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>] o" }}}<esc>
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c iabbrev <buffer> iff if() "dont like its behaviour
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}1

" Abbreviation example
iabbrev ssig -- <cr> Nikolay Legkiy<cr>gron069@gmail.com
cabbrev dusr ~/User/
