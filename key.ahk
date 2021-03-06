﻿RunAs, Administrator
SetBatchLines, -1
SetKeyDelay, 20, 40
classname = ""
SetTitleMatchMode 2
CoordMode, Mouse, Window
SetDefaultMouseSpeed, 2
global MonitorMode := 1 ; 0 - single, 1 - notebook -> 32 2 - notebook ^ 32

#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0

ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1

;-----------------------------

#NoEnv
#SingleInstance Force

;-----------------------------

; запоминает очередь открытых окон
loop
{	
	WinGetClass, m, A
	ifu := regexmatch(m, "MultitaskingViewFrame")
	mfu := m == ""
	WinGet, current_ID, ID, A
	
	;MsgBox, hi
	
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


OpenCloseTaskFrame()
{
	WinGetClass, m, A
	ifu := regexmatch(m, "MultitaskingViewFrame")
	WinGet, current_ID, ID, A
	;TrayTip, %Locked%, locked, 50

	if (ifu = 0)
	{
		SendInput #{Tab}
		;WinWaitNotActive, ahk_id %current_ID%
		;WinWait, MultitaskingViewFrame
		Sleep, 100
		SendInput, {Right}
		Locked := 0
	}
	else
	{
	;while (Locked = 1)
	;{
		;Sleep, 5
		;TrayTip, wait, wait, 5
	;}
		SendInput, {Enter}
		MouseToCenterWindow()
	}
	return
}

*Tab::
{
	WinGetClass, m, A
	ifu := regexmatch(m, "MultitaskingViewFrame")
	WinGet, current_ID, ID, A
	if (ifu < 1)
	{
		Send, {Tab}
	}
	else
	{

		SendInput, {Right}
	}
	return
}

; alt u - rider to unity and revert
;LAlt & SC16::
;{
;
;	WinGetTitle, m, A
;	ifu := regexmatch(m, "JetBrains Rider")
;	WinGet, current_ID, ID, A
;	; from unity to rider
;	if (ifu < 1)
;	{
;		WinActivate, Rider
;		Sleep, 200
;		MouseToCenterWindow()
;	}
;	; from rider to unity
;	else
;	{
;		WinActivate, .unity
;		Sleep, 200
;		MouseToCenterWindow()
;		Sleep, 200
;		SendInput, {LCtrl Down}{SC19}{LCtrl Up}
;	}
;	return
;}

*RShift::
{
	ToRight()
	return
}
RShift & CapsLock:: AltTab ; stub

*RCtrl::
{
	ToLeft()
	return
}
RCtrl & CapsLock:: AltTab ; stub

; alt and \
RAlt::
{
	OpenCloseTaskFrame()
	return
}

SC56::
{
	OpenCloseTaskFrame()
	return
}
	
;*****************************************************
; Доработка раскладки
;*****************************************************

+SC35::SendInput,,{Space} ;запятая с пробелом Shift + .
SC35::SendInput,.{Space} ; точка с пробелом

RAlt & SC10::SendInput {Raw}\
RAlt & SC11::SendInput {Raw}/
RAlt & SC12::SendInput {Raw}{
RAlt & SC13::SendInput {Raw}} ;
RAlt & SC14::SendInput {Raw}:

RAlt & SC1E::SendInput {Raw}"
RAlt & SC1F::SendInput {Raw}(
RAlt & SC20::SendInput {Raw})
RAlt & SC21::SendInput {Raw};

RAlt & SC2C::SendInput {Raw}<
RAlt & SC2D::SendInput {Raw}>
RAlt & SC2E::SendInput {Raw}[
RAlt & SC2F::SendInput {Raw}]
;------------------
SC56 & SC10::SendInput {Raw}\
SC56 & SC11::SendInput {Raw}/
SC56 & SC12::SendInput {Raw}{
SC56 & SC13::SendInput {Raw}} ;
SC56 & SC14::SendInput {Raw}:

SC56 & SC1E::SendInput {Raw}"
SC56 & SC1F::SendInput {Raw}(
SC56 & SC20::SendInput {Raw})
SC56 & SC21::SendInput {Raw};

SC56 & SC2C::SendInput {Raw}<
SC56 & SC2D::SendInput {Raw}>
SC56 & SC2E::SendInput {Raw}[
SC56 & SC2F::SendInput {Raw}]


+sc2::SendInput  {!}{Space} ;
+sc3::SendInput  {@} ;
+sc4::SendInput  {#} ;
+sc5::SendInput  {&} ;
+sc8::SendInput  {?}{Space} ;
+scA::SendInput  {Raw}$

MouseToCenterWindow()
{
	;WinGetClass, m, A
	;ifu := regexmatch(m, "MultitaskingViewFrame")
	;mfu := m == ""
	;MsgBox, %m%
	
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

; отправляет курсор на другой монитор вместо тильды~~~~
SC29::
{
	CursorToOtherMonitor()
	return
}

F11::
{
	ToRight()
	return
}

SnapWindowToScreen()
{
	CoordMode, Mouse, Screen
	MouseGetPos, XPos, YPos
	
	MoveWindowToMouseScreen()
	Sleep, 100

	if(YPos < 200)
	{
		WinMaximize, A
	}
	else
	{
		if(XPos < 993)
		{
			WinMaximize, A
			Send, #{Left}
		}
		else if(XPos < 1920)
		{
			WinMaximize, A
			Send, #{Right}
		}
		else if(XPos < 2913)
		{
			WinMaximize, A
			Send, #{Left}
		}
		else
		{
			WinMaximize, A
			Send, #{Right}
		}
	}
	return
}

MoveWindowToMouseScreen()
{
	CoordMode, Mouse, Screen
	MouseGetPos, XPos, YPos
	WinGetPos, XWin, YWin, , , A

	if(XPos > 1920)
	{
		if(XWin < 1880)
		{
			SendInput #+{Left}
		}
	}
	else
	{
		if(XWin > 1880)
		{
			SendInput #+{Left}
		}
	}
	return
}

XButton2 & LButton::
{
	CoordMode, Mouse, Screen
	SendInput {LWin}
	MouseMove, 993, 500, 5
	return
}

XButton2 & RButton::
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

;win shift 1
#+SC2::
{
	MinimizeMaximize()
	return
}

;win shift 2
#+SC3::
{
	ToRight()
	return
}

; распахивает-возвращает окно
MinimizeMaximize()
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



XButton2::
{
	ToLeft()
	return
}

CursorToOtherMonitor()
{
	CoordMode, Mouse, Screen
	MouseGetPos, XPos, YPos
 
	if(MonitorMode = 2)
	{
		if(XPos < 100)
		{
			XPos := 100
		}
	
		if(YPos > 1440)
		{
			MouseMove, XPos, 500, 2
		}
		else
		{
			MouseMove, XPos, 2000, 2
		}
	}
	if(MonitorMode = 1)
	{
		if(XPos < 0)
		{
			MouseMove, 1200, 800, 2
		}
		else
		{
			MouseMove, -900, 800, 2
		}
	}
	else 
	{
		MsgBox, error %MonitorMode%
	}

	return
}

; numpad add
VK6B::
{
	Send {WheelUp 1}
	return
}

SC11C::
{
	Send {WheelDown 1}
	return
}

; Numpad0
SC52::
{
	OpenCloseTaskFrame()
    return
}

; Numpad.
SC53::
{
	ToRight()
    return
}


; F12
SC58::
{
	OpenCloseTaskFrame()
    return
}

LCtrl & CapsLock:: AltTab ;stub

; capslock
SC3A::
{
	SendInput {LAlt Down}{Shift Down}{Shift Up}{LAlt Up}
    return
}

;LCtrl & CapsLock::SwitchKeysLocale() 

SwitchKeysLocale()
{
   SelText := GetWord(TempClipboard)
   Clipboard := ConvertText(SelText, Layout)
   SendInput, ^{vk56}   ; Ctrl + V
   Sleep, 50
   SwitchLocale(Layout)
   Sleep, 50
   Clipboard := TempClipboard
}

GetWord(ByRef TempClipboard)
{
   SetBatchLines, -1
   SetKeyDelay, 0
   
   TempClipboard := ClipboardAll
   Clipboard =
   SendInput, ^{vk43}
   Sleep, 100
   if (Clipboard != "")
      Return Clipboard
   
   While A_Index < 10
   {
      SendInput, ^+{Left}^{vk43}
      ClipWait, 1
      if ErrorLevel
         Return

      if RegExMatch(Clipboard, "P)([ \t])", Found) && A_Index != 1
      {
         SendInput, ^+{Right}
         Return SubStr(Clipboard, FoundPos1 + 1)
      }

      PrevClipboard := Clipboard
      Clipboard =
      SendInput, +{Left}^{vk43}
      ClipWait, 1
      if ErrorLevel
         Return

      if (StrLen(Clipboard) = StrLen(PrevClipboard))
      {
         Clipboard =
         SendInput, +{Left}^{vk43}
         ClipWait, 1
         if ErrorLevel
            Return

         if (StrLen(Clipboard) = StrLen(PrevClipboard))
            Return Clipboard
         Else
         {
            SendInput, +{Right 2}
            Return PrevClipboard
         }
      }

      SendInput, +{Right}

      s := SubStr(Clipboard, 1, 1)
      if s in %A_Space%,%A_Tab%,`n,`r
      {
         Clipboard =
         SendInput, +{Left}^{vk43}
         ClipWait, 1
         if ErrorLevel
            Return

         Return Clipboard
      }
      Clipboard =
   }
}

ConvertText(Text, ByRef OppositeLayout)
{  
   Static Cyr := "ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ/ёйцукенгшщзхъфывапролджэячсмитьбю"
        , Lat := "~QWERTYUIOP{}ASDFGHJKL:""ZXCVBNM<>|``qwertyuiop[]asdfghjkl;'zxcvbnm,."

   RegExReplace(Text, "i)[A-Z@#\$\^&\[\]'`\{}]", "", LatCount)
   RegExReplace(Text, "i)[А-ЯЁ№]", "", CyrCount)
   
   if (LatCount != CyrCount)  {
      CurrentLayout := LatCount > CyrCount ? "Lat" : "Cyr"
      OppositeLayout := LatCount > CyrCount ? "Cyr" : "Lat"
   }
   else  {
      threadId := DllCall("GetWindowThreadProcessId", Ptr, WinExist("A"), UInt, 0, Ptr)
      landId := DllCall("GetKeyboardLayout", Ptr, threadId, Ptr) & 0xFFFF
      if (landId = 0x409)
         CurrentLayout := "Lat", OppositeLayout := "Cyr"
      else
         CurrentLayout := "Cyr", OppositeLayout := "Lat"
   }
   Loop, parse, Text
      NewText .= (found := InStr(%CurrentLayout%, A_LoopField, 1)) 
         ? SubStr(%OppositeLayout%, found, 1) : A_LoopField
   Return NewText
}

SwitchLocale(Layout)
{
   ControlGetFocus, CtrlFocus, A
   PostMessage, WM_INPUTLANGCHANGEREQUEST := 0x50,, Layout = "Lat" ? 0x4090409 : 0x4190419, %CtrlFocus%, A
}




;------------------------------------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------

SC4F::
{
	Send, #1
	MouseToCenterWindow()
	return
}

SC50::
{
	Send, #2
	MouseToCenterWindow()
	return
}

SC51::
{
	Send, #3
	MouseToCenterWindow()
	return
}

SC4B::
{
	Send, #4
	MouseToCenterWindow()
	return
}

SC4C::
{
	Send, #5
	MouseToCenterWindow()
	return
}

SC4D::
{
	Send, #6
	MouseToCenterWindow()
	return
}

SC47::
{
	Send, #7
	MouseToCenterWindow()
	return
}

SC48::
{
	Send, #8
	MouseToCenterWindow()
	return
}

SC49::
{
	Send, #9
	MouseToCenterWindow()
	return
}



;SetEng()
;{
;en := DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1)
;w := DllCall("GetForegroundWindow")
;pid := DllCall("GetWindowThreadProcessId", "UInt", w, "Ptr", 0)
;
;PostMessage 0x50, 0, %en%,, A
;return
;}
;
;SetRus()
;{
;ru := DllCall("LoadKeyboardLayout", "Str", "00000419", "Int", 1)
;
;w := DllCall("GetForegroundWindow")
;pid := DllCall("GetWindowThreadProcessId", "UInt", w, "Ptr", 0)
;    PostMessage 0x50, 0, %ru%,, A
;return
;}


; возвращает последнее открое окно по аналогии с альт-таб
*LCtrl::
{
	WinActivate ahk_id %previous_ID%
	MouseToCenterWindow()
}


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