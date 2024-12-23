#NoEnv  ; Recommended for performance and compatibility
#SingleInstance Force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

; Global variables
global width := 400
global height := 600
global thoriumPath := "E:\OneDrive\NEW COMPUTER INSTALL\Thorium_117.0.5938.157\BIN\thorium.exe"
global htmlPath := A_ScriptDir "\giphy_picker.html"
global iniFile := A_ScriptDir "\giphy_settings.ini"
htmlPath := StrReplace(htmlPath, "\", "/")
htmlPath := StrReplace(htmlPath, " ", "%20")
htmlPath := StrReplace(htmlPath, ":", "%3A")

; Pre-load Thorium instance on script start
PreloadBrowser() {
    Run, % thoriumPath 
        . " --app=""file:///" htmlPath """"
        . " --window-size=1,1"
        . " --window-position=-9999,-9999"
        . " --disable-extensions"
        . " --disable-plugins"
        . " --disable-sync"
        . " --no-first-run"
        . " --noerrdialogs"
        . " --disable-translate"
        . " --disable-features=TranslateUI"
        . " --disable-save-password-bubble"
        . " --no-default-browser-check"
        . " --hide-scrollbars"
        . " --disable-notifications"
        . " --disable-background-mode"
        . " --disable-backing-store-limit"
        . " --disable-pinch"
        . " --user-data-dir=""" A_Temp "\GiphyPicker"""
    
    WinWait, GIPHY Picker
    WinHide, GIPHY Picker
}

PreloadBrowser()

ShowPicker:
    if WinExist("GIPHY Picker") {
        WinGet, state, MinMax, GIPHY Picker
        if (state = -1) {  ; If window is minimized
            WinRestore, GIPHY Picker  ; Restore it
            WinActivate, GIPHY Picker
        } else {  ; If window is normal/visible
            WinMinimize, GIPHY Picker  ; Minimize it
        }
    } else {
        x := (A_ScreenWidth - width) / 2
        y := (A_ScreenHeight - height) / 2
        
        Run, % thoriumPath
            . " --app=""file:///" htmlPath """"
            . " --window-size=" width "," height 
            . " --window-position=" Round(x) "," Round(y)
            . " --disable-extensions"
            . " --disable-plugins"
            . " --disable-sync"
            . " --no-first-run"
            . " --noerrdialogs"
            . " --disable-translate"
            . " --disable-features=TranslateUI"
            . " --disable-save-password-bubble"
            . " --no-default-browser-check"
            . " --hide-scrollbars"
            . " --disable-notifications"
            . " --disable-background-mode"
            . " --disable-backing-store-limit"
            . " --disable-pinch"
            . " --user-data-dir=""" A_Temp "\GiphyPicker"""
        
        WinWait, GIPHY Picker
        WinGet, state, MinMax, GIPHY Picker
        if (state = -1) {
            WinRestore, GIPHY Picker
        }
        WinShow, GIPHY Picker
        WinActivate, GIPHY Picker
        
        ; Ensure proper size and position
        WinMove, GIPHY Picker,, x, y, width, height
    }
return

; Win + C to toggle GIPHY picker
#c::
Goto, ShowPicker
return

; Close with Escape key
#IfWinActive GIPHY Picker
Esc::
    WinMinimize, GIPHY Picker
    WinHide, GIPHY Picker
return
#IfWinActive

ExitScript:
ExitApp

#IfWinActive GIPHY Picker
; Add arrow key navigation for GIFs
Up::Send {WheelUp}
Down::Send {WheelDown}
; Tab to focus next GIF
Tab::Send {Tab}
; Ctrl+Enter to quickly copy focused GIF
^Enter::Send ^c
; Ctrl+T for transparency
^t::WinSet, Transparent, 200, GIPHY Picker
; Ctrl+Shift+T to remove transparency
^+t::WinSet, Transparent, OFF, GIPHY Picker
; Ctrl+Space to toggle always on top
^Space::
    WinSet, AlwaysOnTop, Toggle, GIPHY Picker
    return

; Add this function to handle the pin icon clicks
togglePin:
    WinSet, AlwaysOnTop, Toggle, GIPHY Picker
    return
#IfWinActive

SaveWindowPosition() {
    WinGetPos, x, y,,, GIPHY Picker
    IniWrite, %x%, %iniFile%, Window, X
    IniWrite, %y%, %iniFile%, Window, Y
}

LoadWindowPosition() {
    IniRead, savedX, %iniFile%, Window, X, DEFAULT
    IniRead, savedY, %iniFile%, Window, Y, DEFAULT
    if (savedX != "DEFAULT" && savedY != "DEFAULT") {
        x := savedX
        y := savedY
    } else {
        x := (A_ScreenWidth - width) / 2
        y := (A_ScreenHeight - height) / 2
    }
    return [x, y]
}

GetActiveMonitorCenter() {
    CoordMode, Mouse, Screen
    MouseGetPos, mouseX, mouseY
    SysGet, monCount, MonitorCount
    
    Loop, %monCount% {
        SysGet, mon, Monitor, %A_Index%
        if (mouseX >= monLeft && mouseX <= monRight && mouseY >= monTop && mouseY <= monBottom) {
            x := monLeft + (monRight - monLeft - width) / 2
            y := monTop + (monBottom - monTop - height) / 2
            return [x, y]
        }
    }
    ; Fallback to primary monitor
    return [(A_ScreenWidth - width) / 2, (A_ScreenHeight - height) / 2]
}
