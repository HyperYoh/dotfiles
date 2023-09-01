; HyperYoh
; V2

#Requires AutoHotkey >= v2.0
#SingleInstance Force ; Skips the dialog box and replaces the old instance automatically.
; #Warn ; Enable warnings to assist with detecting common errors.
SetTitleMatchMode 3

VG := "iS "

A_TrayMenu.Add()
A_TrayMenu.Add("Reload", (*) => Reload())
A_TrayMenu.Add("ForeGroundCurrent", ForeGroundCurrent) 

ForeGroundCurrent(*)
{
    For ,HWND in WinGetList(VG)
        WinSetExStyle("-0x80020", HWND)
}

WinWait(VG)

For ,HWND in WinGetList(VG)
{
    WinSetExStyle("+0x80020", HWND)
}

; if unique model
; WinWaitClose(VG)

; if multiple model
n := WinGetCount(VG)
While WinGetCount(VG) = n
    Sleep 200

Reload()
