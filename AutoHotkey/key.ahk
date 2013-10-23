; Переключение раскладки по Капс Лок
SetBatchLines, -1
SetKeyDelay, 0
classname = ""
Locale1=0x4090409  ; Английский (американский).
Locale2=0x4190419  ; Русский.

*CapsLock::
{
	;WinGetClass, classname, A
	;if (classname = "Vim")
	;{
		;SendInput {ctrl down}6{ctrl up}
		;return
	;}
	;else
	;{
		;SendInput {LAlt Down}{Shift Down}{Shift Up}{LAlt Up}
		;return
	;}
	WinGetTitle, wintit, a
	ifvim := regexmatch(wintit, "VIM")
	if (ifvim > 0)
	{
		SendInput {ctrl down}6{ctrl up}
	}
	else
	{
		SendInput {LAlt Down}{Shift Down}{Shift Up}{LAlt Up}
	} 
	return
}
;*****************************************************
; Доработка раскладки
;*****************************************************
SC56::SendInput,,{Space} ;запятая с пробелом вместо нижнего слеша
+SC35::SendInput,,{Space} ;запятая с пробелом Shift + .
+SC56::SendInput  {!}{Space} ;восклицательный знак с пробелом Shift + нижний слеш
>!SC56::SendInput {?}{Space} ;вопросительный знак с пробелом RAlt + нижний слеш
>!SC10::SendInput {Raw}\ ; RAlt+Q = \
>!SC11::SendInput {Raw}/ ; RAlt+W = |
>!SC12::SendInput {{}{}}{Left} ; RAlt+E =
>!SC13::SendInput  {{}{}}{Left}{Enter}{Enter}{Up}{Tab} ; RAlt+R = }
>!SC22::SendInput {;}{Enter} ; RAlt+T = №
>!SC1E::SendInput "
>!SC1F::SendInput (){Left} ; RAlt+S = (
>!SC20::SendInput {Raw}) ; RAlt+D = )
>!SC21::SendInput {Raw}; ; RAlt+F = ;
>!SC14::SendInput {Raw}: ; RAlt+G = :
>!SC2C::SendInput {Raw}< ; RAlt+Z = <
>!SC2D::SendInput {Raw}> ; RAlt+X = >
>!SC2E::SendInput []{Left} ; RAlt+C =  =)
>!SC2F::SendInput {Raw}] ; RAlt+V =  =3
>!SC30::SendInput ...{Space} ; RAlt+B =  =D
+sc2::SendInput  {!}{Space} ; два ебанутых костыля
+sc3::SendInput  {@} ; два ебанутых костыля
+sc4::SendInput  {#} ; два ебанутых костыля
+sc5::SendInput  {&} ; два ебанутых костыля
+sc8::SendInput  {?}{Space} ; два ебанутых костыля
+scA::SendInput  {Raw}$
sc15c::SendInput  {Raw}.
;Э
+sc28::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}®
	else if(InputLocaleID=Locale2)
		SendInput Э
	return
}
;Б
+sc33::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}±
	else if(InputLocaleID=Locale2)
		SendInput Б
	return
}
;Ж
+sc27::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}™
	else if(InputLocaleID=Locale2)
		SendInput Ж
	return
}
;Х
+sc1a::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}©
	else if(InputLocaleID=Locale2)
		SendInput Х
	return
}
;Ъ
+sc1b::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}α
	else if(InputLocaleID=Locale2)
		SendInput Ъ
	return
}
;б
sc33::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}π
	else if(InputLocaleID=Locale2)
		SendInput б
	return
}
;ж
sc27::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}≥
	else if(InputLocaleID=Locale2)
		SendInput ж
	return
}
;х
sc1a::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}≤
	else if(InputLocaleID=Locale2)
		SendInput х
	return
}
;ъ
sc1b::
{
	SetFormat, Integer, H
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	if(InputLocaleID=Locale1)
		SendInput {Raw}÷
	else if(InputLocaleID=Locale2)
		SendInput ъ
	return
}
;vim устранение проблемы с точкой
sc35::
;{
	;WinGetClass, classname, A
	;if (classname = "Vim")
	;{
		;SendInput {ctrl down}o{ctrl up}
		;return
	;}
	;else
	;{
		;SendInput .{Space}
		;return
	;}
;}
{
	WinGetTitle, wintit, a
	ifvim := regexmatch(wintit, "VIM")
	if (ifvim > 0)
	{
		SendInput {ctrl down}o{ctrl up}
	}
	else
	{
		SendInput .{Space}
	} 
	return
}
