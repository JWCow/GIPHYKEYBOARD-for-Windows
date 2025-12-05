class Config {
    static Width := 400
    static Height := 600
    static HtmlPath := A_ScriptDir "\..\Resources\giphy_picker.html"
    static IniFile := A_ScriptDir "\giphy_settings.ini"
    static WindowTitle := "GIPHY Picker"
    
    GetHtmlUrl() {
        path := Config.HtmlPath
        StringReplace, path, path, \, /, All
        StringReplace, path, path, %A_Space%, `%20, All
        StringReplace, path, path, :, `%3A, All
        return "file:///" path
    }
}