" set novsvim_useeditorindent
" vsvim_useeditortab
" set novsvim_controlchars
" set autoindent
set noerrorbells
set novisualbell
set clipboard=unnamed
set so=15
set vsvim_useeditordefaults
:set ignorecase



nnoremap <Tab> :vsc Edit.IncreaseLineIndent<CR>
vnoremap <Tab> :vsc Edit.IncreaseLineIndent<CR><ESC><ESC>

noremap <ESC> <ESC><ESC><ESC><ESC>

nnoremap <CR> G

cnoremap <Space> <CR>
nnoremap <Space> n

" ---------- NORMAL-TOP

nnoremap q :vsc Edit.DecreaseLineIndent<CR>
vnoremap q :vsc Edit.DecreaseLineIndent<CR><ESC><ESC>kw

nnoremap w :vsc ReSharper.ReSharper_ExtendSelection<CR>
vnoremap w :vsc ReSharper.ReSharper_ExtendSelection<CR>

nnoremap e a
vnoremap e a

nnoremap r s
vnoremap r s

nnoremap t ciw

nnoremap y :vsc Edit.Redo<CR>

nnoremap u :vsc Edit.Undo<CR>

nnoremap [ gg
vnoremap [ gg

nnoremap ] G
vnoremap ] G

" ---------- NORMAL-MIDLE

nnoremap a :vsc ReSharper.ReSharper_GotoFileMember<CR>

nnoremap s :vsc ReSharper.ReSharper_GotoFile<CR>

nnoremap d ?
vnoremap s ?

nnoremap f /
vnoremap f /

nnoremap g N
vnoremap g N


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

nnoremap <S-y> :vsc ReSharper.ReSharper_GotoNextHighlight<CR>

nnoremap <S-u> J

nnoremap <S-i> :vsc ReSharper.ReSharper_LineComment<CR><ESC><ESC>
vnoremap <S-i> :vsc ReSharper.ReSharper_LineComment<CR><ESC><ESC>kw




" ---------- SHIFT-MIDLE

nnoremap <S-h> :vsc ReSharper.ReSharper_GotoDeclaration<CR>

nnoremap <S-j> :vsc ReSharper.ReSharper_GotoNextMethod<CR>
vnoremap <S-j> :vsc ReSharper.ReSharper_GotoNextMethod<CR>

nnoremap <S-k> :vsc ReSharper.ReSharper_GotoPrevMethod<CR>
vnoremap <S-k> :vsc ReSharper.ReSharper_GotoPrevMethod<CR>

nnoremap <S-l> :vsc ReSharper.ReSharper_GotoUsage<CR>

nnoremap : :vsc Edit.SwitchtoQuickReplace<CR>
vnoremap : :vsc Edit.SwitchtoQuickReplace<CR>

" ---------- SHIFT-BOTTOM

nnoremap <S-n> :vsc ReSharper.ReSharper_Generate<CR>
vnoremap <S-n> :vsc ReSharper.ReSharper_Generate<CR>

nnoremap <S-m> :vsc ReSharper.ReSharper_RefactorThis<CR>
vnoremap <S-m> :vsc ReSharper.ReSharper_RefactorThis<CR>


nnoremap < :vsc File.SaveAll<CR>
nnoremap > :vsc ReSharper.ReSharper_SilentCleanupCode<CR>


"-------------------------------------