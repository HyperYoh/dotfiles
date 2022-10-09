;HyperYoh
;https://www.autohotkey.com/boards/viewtopic.php?t=64289
;https://gist.github.com/aubricus/1148174/e70542062160c03be19cba556cabaa56cfae529a

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") || WinActive("ahk_class WorkerW") || WinActive("ahk_class Progman")
^n:: ;Press Ctrl + n to create new file

vPath := ""
WinGet, hWnd, ID, A
InputBox, vName , New File, , , 400, 100, , , , , Nouveau Document Texte.txt

for oWin in ComObjCreate("Shell.Application").Windows
{
    if (oWin.HWND = hWnd)
    {
        vDir := RTrim(oWin.Document.Folder.Self.Path, "\")
        if !InStr(FileExist(vDir), "D")
        {
            oWin := ""
            return
        }

        vPath := vDir "\" vName
        break
    }
}

if !vPath
{
    vPath := A_Desktop "\" vName
}

if ErrorLevel
    return

FileAppend,, % "*" vPath,

oWin := ""
if FileExist(vPath)
    Run, "%vPath%"
return
#If
