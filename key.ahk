SetBatchLines, -1
SetKeyDelay, 20, 40
classname = ""
SetTitleMatchMode 2
CoordMode, Mouse, Window
SetDefaultMouseSpeed, 2


showingTaskSwitcher:=0	; not visible

;-----------------------------

#NoEnv
Process, Priority, ,High
#SingleInstance Force

;-----------------------------



; запоминает очередь открытых окон
loop 
{	
	WinGetClass, m, A
	ifu := regexmatch(m, "MultitaskingViewFrame")
	mfu := m == ""
	WinGet, current_ID, ID, A
	
	WinWaitNotActive, ahk_id %current_ID%
	;TrayTip, Title, %m% %ifu% %mfu% %current_ID%, 1, 1
	if (ifu < 1)
	{ 	
		if(mfu < 1)
		{
			previous_ID := current_ID
		}
	}
}


*CapsLock::
{
	SendInput {LAlt Down}{Shift Down}{Shift Up}{LAlt Up}
	return
}


;*****************************************************
; Доработка раскладки
;*****************************************************

+SC35::SendInput,,{Space} ;запятая с пробелом Shift + .
SC35::SendInput,.{Space} ; точка с пробелом

RAlt & SC10::SendInput {Raw}\ ;
RAlt & SC11::SendInput {Raw}/ ;
RAlt & SC12::SendInput {{}{}}{Left} ;
RAlt & SC13::SendInput  {{}{Enter} ;
RAlt & SC14::SendInput {Raw}: ;

RAlt & SC1E::SendInput ""{Left}
RAlt & SC1F::SendInput (){Left} ;
RAlt & SC20::SendInput {Raw}) ;
RAlt & SC21::SendInput {Raw};
RAlt & SC22::SendInput {;}{Enter} ;

RAlt & SC2C::SendInput {Raw}< ;
RAlt & SC2D::SendInput {Raw}> ;
RAlt & SC2E::SendInput []{Left} ;
RAlt & SC2F::SendInput {Raw}] ;


+sc2::SendInput  {!}{Space} ;
+sc3::SendInput  {@} ;
+sc4::SendInput  {#} ;
+sc5::SendInput  {&} ;
+sc8::SendInput  {?}{Space} ;
+scA::SendInput  {Raw}$

Alt & SC39::AltTab

*+CapsLock::
{
	SendInput {CapsLock}
	return
}

MouseToCenterWindow()
{
	CoordMode, Mouse, Window
	Sleep, 80
	WinID := WinExist("A")
	LastActiveWin = %WinID%
	WinGetActiveStats, AWTitle, AWWidth, AWHeight, AWX, AWY
	MPosX := (AWWidth//2)
	MPosY := (AWHeight//2)
	MouseMove, %MPosX%, %MPosY%
	return
}

SC4A::
{
	Send ~
	return
}

; открывает превью с окнами
*SC29::
{
	SendInput #{Tab}
	return
}

; sc135 - num/
SC135 & WheelUp::SendInput {Volume_Up 2}
SC135 & WheelDown::SendInput {Volume_Down 2}

SC135 & LButton::
{
	ToLeft()`
	return
}

SC135 & RButton::
{
	ToRight()
	return
}

ToLeft()
{
	ActivateWindowUnderMouse()
	SendInput #+{Left}
	MouseToCenterWindow()
	WinMaximize, A
	return
}

ToRight()
{
	ActivateWindowUnderMouse()
	SendInput #+{Right}
	MouseToCenterWindow()
	WinMaximize, A
	return
}

ActivateWindowUnderMouse()
{
	MouseGetPos,,, WinUMID
	WinActivate, ahk_id %WinUMID%
	return
}

; распахивает-возвращает окно
#+SC2::
{
	ActivateWindowUnderMouse()
	MouseToCenterWindow()
	;распахнуть/вернуть окно
	if (WinActive("ahk_class Progman") || WinActive("ahk_Class DV2ControlHost") || (WinActive("Start") && WinActive("ahk_class Button")) || WinActive("ahk_class Shell_TrayWnd")) ; disallows minimizing things that shouldn't be minimized, like the task bar and desktop
		return
	WinGet, MinMax, MinMax, A
	If (MinMax = 1)
		WinRestore, A
	else
		WinMaximize, A
	return
}

; закрывает окно
#+SC3::
{
	ActivateWindowUnderMouse()
	WinClose, A
	return
}

; возвращает последнее открое окно по аналогии с альт-таб
;SC135::
;{
;	WinActivate ahk_id %previous_ID%
;	MouseToCenterWindow()
;}

SC135::
{
	CoordMode, Mouse, Screen
	MouseGetPos, XPos, YPos
	
	if(XPos < 0)
	{
		MouseMove, 900, 500, 5
	}
	else
	{
		MouseMove, -900, 500, 5
	}
	return
}







;------------------------------------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------








;$MButton::
;{
;	WinGetTitle, wintit, a
;	ifu := regexmatch(wintit, " - Ableton Live 9 Suite")
;	if (ifu > 0)
;	{Z
;		SendInput {Ctrl down}{LAlt down}{LButton down}
;		KeyWait MButton
;		SendInput {Ctrl up}{LAlt up}{LButton up}
;	}
;	else
;	{
;		SendInput {MButton down}
;		KeyWait MButton
;		SendInput {MButton up}
;	}
;	return
;}
;
;$WheelUp::
;{
;	WinGetTitle, wintit, a
;	ifu := regexmatch(wintit, " - Ableton Live 9 Suite")
;	if (ifu > 0)
;	{
;		SendInput {+}
;	}
;	else
;	{
;		SendInput {WheelUp}
;	}
;	return
;}
;
;$WheelDown::
;{
;	WinGetTitle, wintit, a
;	ifu := regexmatch(wintit, " - Ableton Live 9 Suite")
;	if (ifu > 0)
;	{
;		SendInput {-}
;	}
;	else
;	{
;		SendInput {WheelDown}
;	}
;	return
;}