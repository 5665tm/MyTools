" set novsvim_useeditorindent
" vsvim_useeditortab
" set novsvim_controlchars
" set autoindent
set noerrorbells
set novisualbell
set clipboard=unnamed
set so=15
set vsvim_useeditordefaults
set ignorecase
set timeoutlen=280


nnoremap <Tab> :vsc Edit.IncreaseLineIndent<CR>
vnoremap <Tab> :vsc Edit.IncreaseLineIndent<CR><ESC><ESC>

noremap <ESC> <ESC><ESC><ESC><ESC>

nnoremap <Space> j
vnoremap <Space> j
nnoremap <Space><Space> k
vnoremap <Space><Space> k

nnoremap <CR> G

" ---------- NORMAL-TOP

nnoremap q :vsc Edit.DecreaseLineIndent<CR>
vnoremap q :vsc Edit.DecreaseLineIndent<CR><ESC><ESC>kw

nnoremap w :vsc ReSharper.ReSharper_GotoFileMember<CR>

nnoremap e :vsc ReSharper.ReSharper_GotoRecentEdits<CR>

nnoremap r :vsc ReSharper.ReSharper_GotoFile<CR>

nnoremap t :vsc File.SaveAll<CR>

nnoremap y :vsc Edit.Redo<CR>

nnoremap u :vsc Edit.Undo<CR>

nnoremap [ gg
vnoremap [ gg

nnoremap ] G
vnoremap ] G

" ---------- NORMAL-MIDLE

nnoremap a ciw

" nnoremap s s

nnoremap d :vsc Edit.WordPrevious<CR>
vnoremap d :vsc Edit.WordPrevious<CR>

nnoremap f :vsc Edit.WordNext<CR>
vnoremap f :vsc Edit.WordNext<CR>

nnoremap g :vsc ReSharper.ReSharper_ExtendSelection<CR>
vnoremap g :vsc ReSharper.ReSharper_ExtendSelection<CR>

nnoremap ; I

nnoremap ' A

" ---------- NORMAL-BOTTOM

nnoremap z dd

vnoremap x x<ESC><ESC>

nnoremap c V

nnoremap b <C-v>

nnoremap n c^

nnoremap m c$

nnoremap , cb 

nnoremap . cw

" ---------- ALT

nnoremap <M-y> qq<Esc>

nnoremap <M-u> @q

" ---------- SHIFT-TOP

nnoremap <S-y> J

nnoremap <S-u> :vsc ReSharper.ReSharper_LineComment<CR><ESC><ESC>
vnoremap <S-u> :vsc ReSharper.ReSharper_LineComment<CR><ESC><ESC>kw

nnoremap <S-i> a




" ---------- SHIFT-MIDLE

nnoremap <S-h> :vsc ReSharper.ReSharper_GotoDeclaration<CR>

nnoremap <S-j> }j :vsc Edit.WordNext<CR>
vnoremap <S-j> }j :vsc Edit.WordNext<CR>

nnoremap <S-k> kk{j :vsc Edit.WordNext<CR>
vnoremap <S-k> kk{j :vsc Edit.WordNext<CR>


nnoremap <S-l> :vsc ReSharper.ReSharper_GotoUsage<CR>

nnoremap : :vsc ReSharper.ReSharper_SilentCleanupCode<CR>


" ---------- SHIFT-BOTTOM

nnoremap <S-n> :vsc ReSharper.ReSharper_Generate<CR>
vnoremap <S-n> :vsc ReSharper.ReSharper_Generate<CR>

nnoremap <S-m> :vsc ReSharper.ReSharper_RefactorThis<CR>
vnoremap <S-m> :vsc ReSharper.ReSharper_RefactorThis<CR>

nnoremap < :vsc Window.PinTab<CR>
nnoremap > :vsc OtherContextMenus.EasyMDIToolWindow.CloseAllButPinned<CR>



"-------------------------------------