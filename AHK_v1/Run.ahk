#NoEnv  ; Recommended for performance and compatibility
#SingleInstance Force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

; Include libraries
#Include %A_ScriptDir%\Lib\Config.ahk
#Include %A_ScriptDir%\Lib\Browser.ahk
#Include %A_ScriptDir%\Lib\Window.ahk

; Preload browser on start
WindowManager.Preload()

; Win + C to toggle GIPHY picker
#c::WindowManager.Toggle()

; Context-sensitive hotkeys for the GIPHY Picker window
#IfWinActive GIPHY Picker

; Close with Escape
Esc::
    WinMinimize, GIPHY Picker
    WinHide, GIPHY Picker
return

; Navigation
Up::Send {WheelUp}
Down::Send {WheelDown}
Tab::Send {Tab}

; Quick copy
^Enter::Send ^c

#IfWinActive

; Global Volume Control (Shift + Win + Mouse Wheel)
#+WheelUp::Send {Volume_Up}
#+WheelDown::Send {Volume_Down}

; Mouse holding feature
^!+`:: ; Ctrl + Alt + Shift + ` to start holding down the left mouse button
    Click down ; Hold down the left mouse button
    Holding := true ; Set a flag to indicate it's holding
return

~LButton Up:: ; Left Mouse Button release checks if the left button is held down
    if (Holding) {
        Click up ; Release the left mouse button
        Holding := false ; Reset the flag
    }
return

; Add escape key as emergency stop for mouse holding
~Esc:: 
    if (Holding) {
        Click up
        Holding := false
    }
return
