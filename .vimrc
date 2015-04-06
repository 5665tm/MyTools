"set novsvim_useeditorindent
vsvim_useeditortab
set novsvim_controlchars
set autoindent
set clipboard=unnamed
set so=5
set vsvim_useeditordefaults


nnoremap <S-q> :

noremap <Tab> :vsc Edit.IncreaseLineIndent<CR>
vnoremap <Tab> :vsc Edit.IncreaseLineIndent<CR>kw

" ----- HEHEHEHE
nnoremap <C-v> iFUCK
nnoremap <S-v> iFUCK

" ---------- NORMAL-TOP

nnoremap q :vsc Edit.DecreaseLineIndent<CR>
vnoremap q :vsc Edit.DecreaseLineIndent<CR>kw

nnoremap w b
vnoremap w b

nnoremap e w
vnoremap e w

nnoremap r dd
vnoremap r dd

nnoremap t yy
vnoremap t yy

nnoremap y :vsc Edit.Redo<CR>

nnoremap u :vsc Edit.Undo<CR>

nnoremap [ gg
vnoremap [ gg

nnoremap ] G
vnoremap ] G

" ---------- NORMAL-MIDLE

nnoremap d ciw

nnoremap f S

nnoremap g J

nnoremap ; I

nnoremap ' A

" ---------- NORMAL-BOTTOM

nnoremap z r

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

nnoremap <S-u> :vsc ReSharper.ReSharper_GotoFile<CR>

nnoremap <S-i> :vsc ReSharper.ReSharper_LineComment<CR>k^w
vnoremap <S-i> :vsc ReSharper.ReSharper_LineComment<CR>kw

nnoremap { :vsc ReSharper.ReSharper_MoveDown<CR>
vnoremap { :vsc ReSharper.ReSharper_MoveDown<CR>
nnoremap } :vsc ReSharper.ReSharper_MoveUp<CR>
vnoremap } :vsc ReSharper.ReSharper_MoveUp<CR>


" ---------- SHIFT-MIDLE

nnoremap <S-h> :vsc ReSharper.ReSharper_GotoDeclaration<CR>

nnoremap <S-j> :vsc ReSharper.ReSharper_GotoNextMethod<CR>
vnoremap <S-j> :vsc ReSharper.ReSharper_GotoNextMethod<CR>

nnoremap <S-k> :vsc ReSharper.ReSharper_GotoPrevMethod<CR>
vnoremap <S-k> :vsc ReSharper.ReSharper_GotoPrevMethod<CR>

nnoremap <S-l> :vsc ReSharper.ReSharper_GotoUsage<CR>

nnoremap : :vsc ReSharper.ReSharper_FindUsages<CR>

nnoremap " :vsc ReSharper.ReSharper_GotoFileMember<CR>

" ---------- SHIFT-BOTTOM

nnoremap <S-n> :vsc Edit.CollapsetoDefinitions<CR>

nnoremap <S-m> :vsc Edit.ToggleAllOutlining<CR>

nnoremap < :vsc ReSharper.ReSharper_Rename<CR>


"-------------------------------------



execute ":vsc HideShowComments.HideDocumentationComments"