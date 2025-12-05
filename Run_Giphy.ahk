#Requires AutoHotkey v2.0
#SingleInstance Force

; Set working directory to script location
SetWorkingDir(A_ScriptDir)

; Include libraries
#Include Lib\Config.ahk
#Include Lib\Browser.ahk
#Include Lib\Window.ahk

; Preload browser on start
WindowManager.Preload()

; Win + C to toggle GIPHY picker
#c::WindowManager.Toggle()

; Context-sensitive hotkeys for the GIPHY Picker window
#HotIf WinActive(Config.WindowTitle)

; Close with Escape
Esc:: {
    WinMinimize(Config.WindowTitle)
    WinHide(Config.WindowTitle)
}

; Navigation
Up::Send("{WheelUp}")
Down::Send("{WheelDown}")
Tab::Send("{Tab}")

; Quick copy
^Enter::Send("^c")

#HotIf

; Global Volume Control (Shift + Win + Mouse Wheel)
#+WheelUp::Send("{Volume_Up}")
#+WheelDown::Send("{Volume_Down}")