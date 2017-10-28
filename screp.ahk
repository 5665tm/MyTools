setmousedelay -1
setbatchlines -1

mode = 0

loop 
{
	if(mode > 0)
	{
		MouseClick, left
		Sleep, 8
	}
}

*CapsLock::
{
	if(mode < 1)
	{
		mode:= 1
		return
	}
	mode:=0
	return
}

F5::ExitApp