local AppleUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/J0se-j/AppleLibrary/refs/heads/main/main.lua"))()

-- Usage: init(Title, SplashEnabled, Keybind, DeletePrevious, ThemeColor)
local Window = AppleUi:init("My Modern Hub", true, Enum.KeyCode.RightControl, true, "purple")

local MainSection = Window:Section("Main")
MainSection:Select()

MainSection:Button("Click Me", function()
    print("Button clicked!")
end)
