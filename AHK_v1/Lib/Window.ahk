#Include %A_ScriptDir%\Lib\Config.ahk
#Include %A_ScriptDir%\Lib\Browser.ahk

class WindowManager {
    Toggle() {
        IfWinExist, % Config.WindowTitle
        {
            WinGet, state, MinMax, % Config.WindowTitle
            if (state = -1) { ; Minimized
                WinRestore, % Config.WindowTitle
                WinActivate, % Config.WindowTitle
            } else {
                WinMinimize, % Config.WindowTitle
            }
        } else {
            this.Launch()
        }
    }

    Launch() {
        browserPath := Browser.GetExecutable()
        if (!browserPath) {
            MsgBox, 16, Error, Could not find a supported browser (Chrome, Firefox, or Edge).
            return
        }

        pos := this.GetCenterPosition()
        cmd := Browser.GetLaunchCommand(browserPath, Config.GetHtmlUrl(), Config.Width, Config.Height, pos.x, pos.y)
        
        Run, %cmd%
        
        WinWait, % Config.WindowTitle,, 5
        if (!ErrorLevel) {
            WinGet, state, MinMax, % Config.WindowTitle
            if (state = -1)
                WinRestore, % Config.WindowTitle
            WinShow, % Config.WindowTitle
            WinActivate, % Config.WindowTitle
            WinMove, % Config.WindowTitle,, pos.x, pos.y, Config.Width, Config.Height
        }
    }

    Preload() {
        browserPath := Browser.GetExecutable()
        if (!browserPath)
            return

        ; Launch off-screen
        cmd := Browser.GetLaunchCommand(browserPath, Config.GetHtmlUrl(), 1, 1, -9999, -9999)
        Run, %cmd%
        
        WinWait, % Config.WindowTitle,, 10
        if (!ErrorLevel) {
            WinHide, % Config.WindowTitle
        }
    }

    GetCenterPosition() {
        CoordMode, Mouse, Screen
        MouseGetPos, mouseX, mouseY
        
        SysGet, monitorCount, MonitorCount
        
        Loop, %monitorCount% {
            SysGet, mon, Monitor, %A_Index%
            if (mouseX >= monLeft && mouseX <= monRight && mouseY >= monTop && mouseY <= monBottom) {
                x := monLeft + (monRight - monLeft - Config.Width) / 2
                y := monTop + (monBottom - monTop - Config.Height) / 2
                return {x: x, y: y}
            }
        }
        
        ; Fallback to primary monitor
        return {x: (A_ScreenWidth - Config.Width) / 2, y: (A_ScreenHeight - Config.Height) / 2}
    }
}