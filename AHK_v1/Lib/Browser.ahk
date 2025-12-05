class Browser {
    GetExecutable() {
        browserCmd := ""
        RegRead, progId, HKEY_CURRENT_USER, Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice, ProgId
        if (progId) {
            RegRead, browserCmd, HKEY_CLASSES_ROOT, %progId%\shell\open\command
        }
        
        ; Extract executable path from command string (e.g., "C:\Path\To\Chrome.exe" --arg)
        if (browserCmd) {
            browserCmd := RegExReplace(browserCmd, """([^""]+)"".*", "$1")
        }

        if (!browserCmd || !FileExist(browserCmd)) {
            ; Fallbacks
            if (FileExist("C:\Program Files\Google\Chrome\Application\chrome.exe"))
                return "C:\Program Files\Google\Chrome\Application\chrome.exe"
            if (FileExist("C:\Program Files\Mozilla Firefox\firefox.exe"))
                return "C:\Program Files\Mozilla Firefox\firefox.exe"
            if (FileExist("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"))
                return "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
        }
        
        return browserCmd
    }

    GetLaunchCommand(browserPath, htmlUrl, width, height, x, y) {
        return """" browserPath """"
            . " --app=""" htmlUrl """"
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
            . " --user-data-dir=""" A_AppData "\GiphyPicker"""
    }
}