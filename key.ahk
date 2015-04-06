; Переключение раскладки по Капс Лок
SetBatchLines, -1
SetKeyDelay, 0
classname = ""
Locale1=0x4090409  ; Английский (американский).
Locale2=0x4190419  ; Русский.
SetTitleMatchMode 2

*CapsLock::
{
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
SC56 Down::SendInput {LAlt Down} ;
SC56 Up::SendInput {LAlt Up} ;
+SC35::SendInput,,{Space} ;запятая с пробелом Shift + .
SC35::SendInput,.{Space} ;
+SC56::SendInput  {!}{Space} ;восклицательный знак с пробелом Shift + нижний слеш
>!SC56::SendInput {?}{Space} ;вопросительный знак с пробелом RAlt + нижний слеш
>!SC10::SendInput {Raw}\ ; RAlt+Q = \
>!SC11::SendInput {Raw}/ ; RAlt+W = |
>!SC12::SendInput {{}{}}{Left} ; RAlt+E =
>!SC13::SendInput  {{}{}}{Left}{Enter}{Enter}{Up}{Tab} ; RAlt+R = }
>!SC22::SendInput {;}{Enter} ; RAlt+T = №
>!SC1E::SendInput ""{Left}
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
sc29::SendInput {Esc}
#SC2C::Run explorer.exe D:\Desktop
; sc1b::
; {
	; SetFormat, Integer, H
	; WinGet, WinID,, A
	; ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
	; InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
	; if(InputLocaleID=Locale1)
		; SendInput {Raw}÷
	; else if(InputLocaleID=Locale2)
		; SendInput ъ
	; return
; }

$F6::
{
	WinGetTitle, wintit, a
	ifu := regexmatch(wintit, "Unity")
	if (ifu > 0)
	{
		WinActivate, Visual Studio
		Sleep, 100
		SendInput {Shift Down}{F5}{Shift Up}
	}
	else
	{
		ifv := regexmatch(wintit, "Visual Studio")
		if (ifv > 0)
		{
			WinActivate, Visual Studio
			Sleep, 100
			SendInput {Shift Down}{F5}{Shift Up}
		}
	
		else
		{
			SendInput {F6}
		}
	}
	return
}

$MButton::
{
	WinGetTitle, wintit, a
	ifu := regexmatch(wintit, "Ableton")
	mfu := regexmatch(wintit, "Unity")
	if (ifu > 0)
	{
		SendInput {Ctrl down}{LAlt down}{LButton down}
		KeyWait MButton
		SendInput {Ctrl up}{LAlt up}{LButton up}
	}
	else if (mfu > 0)
	{
		SendInput {Ctrl down}{LAlt down}{LButton down}
		KeyWait MButton
		SendInput {Ctrl up}{LAlt up}{LButton up}
	}
	else
	{
		SendInput {MButton}
	}
	return
}

$WheelUp::
{
	WinGetTitle, wintit, a
	ifu := regexmatch(wintit, "Ableton")
	if (ifu > 0)
	{
		SendInput {+}
	}
	else
	{
		SendInput {WheelUp}
	}
	return
}

$WheelDown::
{
	WinGetTitle, wintit, a
	ifu := regexmatch(wintit, "Ableton")
	if (ifu > 0)
	{
		SendInput {-}
	}
	else
	{
		SendInput {WheelDown}
	}
	return
}