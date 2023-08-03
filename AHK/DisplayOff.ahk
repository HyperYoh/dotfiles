; HyperYoh

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force ; Skips the dialog box and replaces the old instance automatically.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu Tray, Add
Menu Tray, Add, Turn Off Display, DisplayOff
Menu Tray, Add, Turn Off Display (Lock), DisplayOffLock

DisplayOff()
{
    Sleep 1000
    SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off
    Return
}

DisplayOffLock()
{
    Run rundll32.exe user32.dll`,LockWorkStation     ; Lock PC
    Sleep 1000
    SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off
    Return
}


