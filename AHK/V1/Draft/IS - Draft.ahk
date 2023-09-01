; HyperYoh

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force ; Skips the dialog box and replaces the old instance automatically.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

VG := "iS "

Menu, Tray, Add, Reload, ReloadFun
Menu, Tray, Add, ForeGroundCurrent

ForeGroundCurrent()
{
    WinGet windows, List
    Loop %windows%
    {
            id := windows%A_Index%
            WinGetTitle wt, ahk_id %id%
            if wt = %VG%
                    WinSet ExStyle, -0x80020, ahk_id %id%
            ; r .= "==>" . wt . "|" . id . "<==" . "`n"
    }
}

ReloadFun()
{
    Reload
}

WinWait %VG%

; Sleep 1

WinGet windows, List
Loop %windows%
{
	id := windows%A_Index%
	WinGetTitle wt, ahk_id %id%
	if wt = %VG%
		WinSet ExStyle, +0x80020, ahk_id %id%
	; r .= "==>" . wt . "|" . id . "<==" . "`n"
}

; MsgBox %r%
; r =

WinWaitClose %VG%

; Sleep 1

reload

