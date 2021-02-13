#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTimer, Close, 10000

inifile = config.ini
IniRead, browser, %inifile%, browser, browser
IniRead, tradepath, %inifile%, trademacro, path
IniRead, poepath, %inifile%, pathofexile, path
IniRead, pobpath, %inifile%, pathofbuilding, path

run %poepath%PathOfExile_x64Steam.exe

run %A_AhkPath% %tradepath%Run_TradeMacro.ahk

^F11::
	TrayTip #1, F5: poe.ninja F6: trading F7: PoB F8: Leveling
	Sleep 3000   ; Let it display for 3 seconds.
return

^F5::
	Run %browser% "https://poe.ninja" 
return

^F6::
	Run %browser% "https://www.pathofexile.com/trade/" 
return

^F7::
	run %pobpath%Path of Building.exe
return

^F8::
	Run %browser% "https://poe-leveling.netlify.app/"
return

#t::
  msgbox, win + t pressed
Return

Close:
  IfWinNotExist, Path of Exile
    exitapp
Return
