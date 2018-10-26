CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetBatchLines -1  ; Ensures maximum effectiveness of this method.

F12::
{
	Work()
}

Work()
{
	global
	Loop, 1000000
	{
		;Signal := 0
		CheckR()
		CheckL()
		
		if(Signal = 1)
		{
			SendInput, {Left down}
		}
		else
		{
			SendInput, {Left up}
		}
		
		if(Signal = -1)
		{
			SendInput, {Right down}
		}
		else
		{
			SendInput, {Right up}
		}
		
		ToolTip, %Signal%

		PrevSignal := Signal
	}
}

CheckL()
{
	CheckPartially(1006, 698,-1, 200)
	CheckPartially(999, 700, -1, 250)
	CheckPartially(991, 700, -1, 300)
	CheckPartially(984, 703, -1, 350)
	CheckPartially(976, 706, -1, 400)
	CheckPartially(967, 711, -1, 450)
	CheckPartially(959, 717, -1, 500)
	CheckPartially(952, 724, -1, 550)
	CheckPartially(944, 735, -1, 600)
	return
}

CheckPartially(x, y, signal, del)
{
	global
	match := CheckPix(x, y)
	if(match = 1)
	{
		SendInput, {Right down}
		Sleep, del
		SendInput, {Right up}
	}
	return
}

CheckR()
{
	CheckPartially(1016, 700, 1, 200)
	CheckPartially(1024, 700, 1, 250)
	CheckPartially(1032, 701, 1, 300)
	CheckPartially(1040, 704, 1, 350)
	CheckPartially(1048, 706, 1, 400)
	CheckPartially(1056, 711, 1, 450)
	CheckPartially(1064, 717, 1, 500)
	CheckPartially(1072, 725, 1, 550)
	CheckPartially(1080, 734, 1, 600)
	return
}

global PrevSignal := 0
global Signal := 0


CheckPix(x, y)
{
	;global
	;r++
	
	;MouseMove, x, y, 0
	PixelGetColor, clr, x, y

	return clr = "0xFFFFFF"
}

F11::
{
	ExitApp
}
