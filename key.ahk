SetBatchLines, -1
SetKeyDelay, 20, 40
classname = ""
SetTitleMatchMode 2
CoordMode, Mouse, Window
SetDefaultMouseSpeed, 2


;-----------------------------

#NoEnv
Process, Priority, ,High
#SingleInstance Force

;-----------------------------

CapsLock::
{
	WinGetClass, m, A
	ifu := regexmatch(m, "MultitaskingViewFrame")
	WinGet, current_ID, ID, A
	if (ifu < 1)
	{
		SendInput #{Tab}
		WinWaitNotActive, ahk_id %current_ID%
		;Sleep, 200
		SendInput, {Right}
	}
	else
	{
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
		SendInput, {Tab}
	}
	else
	{

		SendInput, {Right}
	}
	return
}

LShift::
{
	SendInput {LAlt Down}{Shift Down}{Shift Up}{LAlt Up}
	return
}

;*****************************************************
; Доработка раскладки
;*****************************************************

+SC35::SendInput,,{Space} ;запятая с пробелом Shift + .
SC35::SendInput,.{Space} ; точка с пробелом

RAlt & SC10::SendInput {Raw}\
RAlt & SC11::SendInput {Raw}/
RAlt & SC12::SendInput {{} ;
RAlt & SC13::SendInput  {}} ;
RAlt & SC14::SendInput {Raw}:

RAlt & SC1E::SendInput "
RAlt & SC1F::SendInput {Raw}(
RAlt & SC20::SendInput {Raw})
RAlt & SC21::SendInput {Raw};
RAlt & SC22::SendInput {;}{Enter} ;

RAlt & SC2C::SendInput {Raw}<
RAlt & SC2D::SendInput {Raw}>
RAlt & SC2E::SendInput {Raw}[
RAlt & SC2F::SendInput {Raw}]


+sc2::SendInput  {!}{Space} ;
+sc3::SendInput  {@} ;
+sc4::SendInput  {#} ;
+sc5::SendInput  {&} ;
+sc8::SendInput  {?}{Space} ;
+scA::SendInput  {Raw}$

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

; перемещает окно в зависимости от положения мыши
SC29::
{
	CoordMode, Mouse, Screen
	MouseGetPos, XPos, YPos
	
	if(YPos < 350)
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
		else
		{
			WinMaximize, A
			Send, #{Right}
		}
	}
	

	return
}

; sc135 - num
SC29 & WheelUp::SendInput {Volume_Up 2}
SC29 & WheelDown::SendInput {Volume_Down 2}

SC29 & LButton::
{
	ToLeft()`
	return
}

SC29 & RButton::
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


; перемещает мышь на другой монитор
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



Shift & CapsLock:: AltTab ;stub
LCtrl & CapsLock:: AltTab ;stub

LCtrl::SwitchKeysLocale() 

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

; запоминает очередь открытых окон
;loop 
;{	
;	WinGetClass, m, A
;	ifu := regexmatch(m, "MultitaskingViewFrame")
;	mfu := m == ""
;	WinGet, current_ID, ID, A
;	
;	WinWaitNotActive, ahk_id %current_ID%
;	;TrayTip, Title, %m% %ifu% %mfu% %current_ID%, 1, 1
;	if (ifu < 1)
;	{ 	
;		if(mfu < 1)
;		{
;			previous_ID := current_ID
;		}
;	}
;}


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
;SC135::
;{
;	WinActivate ahk_id %previous_ID%
;	MouseToCenterWindow()
;}


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