#Requires AutoHotkey v2.0
SetTitleMatchMode 3

VG := "iStripper"

A_TrayMenu.Add()
A_TrayMenu.Add("Reload", (*) => Reload())

s := ""
For ,e in WinGetList(VG)
    s .= WinGetTitle(e) . "`n"
MsgBox(s)
