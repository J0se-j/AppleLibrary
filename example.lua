local AppleUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/J0se-j/AppleLibrary/refs/heads/main/main.lua"))()

local Window = AppleUi:init("Test", false, nil, false, "purple")

local Main = Window:Section("Main")
Main:Select()

Main:Button("Click me", function()
    print("works")
end)

Main:Toggle("Test toggle", false, function(v)
    print(v)
end)
