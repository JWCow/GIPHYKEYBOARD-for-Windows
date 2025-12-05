class Config {
    static Width := 400
    static Height := 600
    static HtmlPath := A_ScriptDir "\giphy_picker.html"
    static IniFile := A_ScriptDir "\giphy_settings.ini"
    static WindowTitle := "GIPHY Picker"
    
    static GetHtmlUrl() {
        path := StrReplace(this.HtmlPath, "\", "/")
        path := StrReplace(path, " ", "%20")
        path := StrReplace(path, ":", "%3A")
        return "file:///" path
    }
}