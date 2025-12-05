#Include Config.ahk
#Include Browser.ahk

class WindowManager {
    static Toggle() {
        if WinExist(Config.WindowTitle) {
            state := WinGetMinMax(Config.WindowTitle)
            if (state = -1) { ; Minimized
                WinRestore(Config.WindowTitle)
                WinActivate(Config.WindowTitle)
            } else {
                WinMinimize(Config.WindowTitle)
            }
        } else {
            this.Launch()
        }
    }

    static Launch() {
        browserPath := Browser.GetExecutable()
        if (!browserPath) {
            MsgBox("Could not find a supported browser (Chrome, Firefox, or Edge).", "Error", "Iconx")
            return
        }

        pos := this.GetCenterPosition()
        cmd := Browser.GetLaunchCommand(browserPath, Config.GetHtmlUrl(), Config.Width, Config.Height, pos.x, pos.y)
        
        Run(cmd)
        
        if WinWait(Config.WindowTitle,, 5) {
            state := WinGetMinMax(Config.WindowTitle)
            if (state = -1)
                WinRestore(Config.WindowTitle)
            WinShow(Config.WindowTitle)
            WinActivate(Config.WindowTitle)
            WinMove(pos.x, pos.y, Config.Width, Config.Height, Config.WindowTitle)
        }
    }

    static Preload() {
        browserPath := Browser.GetExecutable()
        if (!browserPath)
            return

        ; Launch off-screen
        cmd := Browser.GetLaunchCommand(browserPath, Config.GetHtmlUrl(), 1, 1, -9999, -9999)
        Run(cmd)
        
        if WinWait(Config.WindowTitle,, 10) {
            WinHide(Config.WindowTitle)
        }
    }

    static GetCenterPosition() {
        CoordMode "Mouse", "Screen"
        MouseGetPos(&mouseX, &mouseY)
        
        monitorCount := MonitorGetCount()
        
        Loop monitorCount {
            MonitorGet(A_Index, &monLeft, &monTop, &monRight, &monBottom)
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