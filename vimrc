" ------------------------------------------------------------
" PLUGINS
" ------------------------------------------------------------

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins will be downloaded under the specified directory.
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Colorschemes
" Plugin 'kristijanhusak/vim-hybrid-material'
" Plugin 'cocopon/iceberg.vim'
" Plugin 'arcticicestudio/nord-vim'
" Plugin 'sjl/badwolf'
 Plugin 'lifepillar/vim-solarized8'
" Plugin 'scheakur/vim-scheakur'
" Plugin 'Badacadabra/vim-archery'
" Plugin 'sainnhe/edge'
" Plugin 'branwright1/salvation-vim'
Plugin 'morhetz/gruvbox'

" Other
Plugin 'sheerun/vim-polyglot'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-dispatch'

" List ends here. Plugins become visible to Vim after this call.
call vundle#end()
filetype plugin indent on

" ------------------------------------------------------------
" THEME CONFIGURATION
" ------------------------------------------------------------
let g:edge_style = 'aura'
let g:edge_enable_italic = 0
let g:edge_disable_italic_comment = 1

if has('termguicolors')
    set termguicolors
endif

set guifont=Hack\ 11    " Set font
set background=dark     " Set background 
" colorscheme solarized8 " Set color scheme
autocmd vimenter * ++nested colorscheme gruvbox

" ------------------------------------------------------------
" AUTO-PAIRS
" ------------------------------------------------------------

let g:AutoPairsShortcutToggle = '<C-P>'

" ------------------------------------------------------------
" NERDTREE
" ------------------------------------------------------------

let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31

" ------------------------------------------------------------
" TAGBAR
" ------------------------------------------------------------

let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'

" ------------------------------------------------------------
" CTRLSF
" ------------------------------------------------------------

let g:ctrlsf_backend = 'ack'
let g:ctrlsf_auto_close = { "normal": 0, "compact": 0 }
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view = 'normal'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '46'
let g:ctrlsf_default_root = 'cwd'   " projcet

" ------------------------------------------------------------
" FSWITCH
" ------------------------------------------------------------
"
" Set fswtichdst and fswitchloc variables with BufEnter event takes place
" on a file whose name matches {*.cpp}.
"
" au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '../inc'

au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h   let b:fswitchdst = 'cpp,c'

" fswitchdst  - Denotes the files extensions that is the target extension of
"               the current file's companion file.
"
" fswitchlocs - Contains a set of directories that indicate directory names 
"               that should be formulated when trying to find the alternate
"               file.

" ------------------------------------------------------------
" VIM-PROTODEF
" ------------------------------------------------------------

nmap <buffer> <silent> <leader> ,PP
nmap <buffer> <silent> <leader> ,PN

" NOTE: This doesn't seem to disable the sorting.
let g:disable_protodef_sorting = 1

" ------------------------------------------------------------
" YCM
" ------------------------------------------------------------

" Mapping to close the completion menu (default <C-y>)
let g:ycm_key_list_stop_completion = ['<C-x>']

" Set filetypes where YCM will be turned on
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0                " Don't confirm python conf
let g:ycm_always_populate_location_list = 1     " Always populae diagnostics list
let g:ycm_enable_diagnostic_signs = 1           " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1         " Open location list to view diagnostics

let g:ycm_max_num_candidates = 20               " Max number of completion suggestions 
let g:ycm_max_num_identifier_candidates = 10    " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                      " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                " Show diagnostic display features
let g:ycm_error_symbol = '>>'                   " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1           " Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1    " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1           " Echo line's diagnostic that cursor is on

" ------------------------------------------------------------
" VIM SETTINGS
" ------------------------------------------------------------

set nu                  " Enable line numbers
syntax on               " Enable synax highlighting
set incsearch           " Enable incremental search
set hlsearch            " Enable highlight search
set splitbelow          " Always split below
set mouse=a             " Enable mouse drag on window splits
set tabstop=4           " How many columns of whitespace a \t is worth
set shiftwidth=4        " How many columns of whitespace a “level of indentation” is worth
set expandtab           " Use spaces when tabbing

if !has('nvim')
    set termwinsize=12x0    " Set terminal size
endif

" ------------------------------------------------------------
" MAPPINGS
" ------------------------------------------------------------

"General
nmap        <C-B>     :buffers<CR>
nmap        <C-J>     :term<CR>
"
"NERDTree
nmap        <F2>      :NERDTreeToggle<CR>

"tagbar
nmap        <F8>      :TagbarToggle<CR>

"ctrlds
nmap        <C-F>f    <Plug>CtrlSFPrompt
xmap        <C-F>f    <Plug>CtrlSFVwordPath
xmap        <C-F>F    <Plug>CtrlSFVwordExec
nmap        <C-F>n    <Plug>CtrlSFCwordPath
nmap        <C-F>p    <Plug>CtrlSFPwordPath
nnoremap    <C-F>o    :CtrlSFOpen<CR>
nnoremap    <C-F>t    :CtrlSFToggle<CR>
inoremap    <C-F>t    <Esc>:CtrlSFToggle<CR>

"fswitch
nmap        <C-Z>     :vsplit <bar> :wincmd l <bar> :FSRight<CR>

"YCM
nmap        <C-L>     :lopen<CR>
nmap        <C-L>l    :lclose<CR>

" --------------------------------------------------------------------------------
" BUILD SYSTEM
" --------------------------------------------------------------------------------

" Vim settings
" --------------------------------------

" Always render sign column so editor doesn't snap when there's a YCM error
set signcolumn=yes

" Mappings
" --------------------------------------

" Open vim-dispatch window and scroll to bottom
nnoremap    <C-m>m    :Copen<CR> <bar> G

" Build debug and release targets
nnoremap    <C-m>bd   :Dispatch! make -C build/Debug<CR>
nnoremap    <C-m>br   :Dispatch! make -C build/Release<CR>

" Functions
" ---------------------------------------

" Map <F6> to the Debug executable with passed filename
function SetBinaryDebug(filename)
    let bpath = getcwd() . "/bin/Debug/" . a:filename
    execute "nnoremap <F6> :Dispatch "
            \ bpath
            \ . " <CR> <bar> :Copen<CR>"
    echo "<F6> will run: " . bpath
endfunction

" Map <F7> to the Release executable with passed filename
function SetBinaryRelease(filename)
    let bpath = getcwd() . "/bin/Release/" . a:filename 
    execute "nnoremap <F7> :Dispatch "
                \ bpath 
                \ . "<CR> <bar> :Copen<CR>"
    echo "<F7> will run: " . bpath
endfunction

" Powerline settings
" --------------------------------------
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256


" Personal Customaizations (non standard)
" --------------------------------------
" Easy way to add a semicolon at the end of a line when coding in c/c++
" Also useful when using auto pairs in order to jump to the end of the
" line and add the required semicolon.
nnoremap ;; $a;<ESC>

" Quick and dirty way to compile and run the current c++ file
" I use this when not using the above cmake and boilerplate c++
" Dev environment. Gets overwritten with SetBinaryDegug() and 
" SetBinaryReleasel Alternatively could remap to <F8) insetead
map <F6> :w <CR> :!g++ % -o %< && clear && ./%< <CR>
