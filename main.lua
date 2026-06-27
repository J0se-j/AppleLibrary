local AppleUi = {}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function tween(obj, prop, t)
    TweenService:Create(obj, TweenInfo.new(t or 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), prop):Play()
end

local function makeCorner(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = obj
end

local function create(class, props)
    local obj = Instance.new(class)
    for i, v in pairs(props) do
        obj[i] = v
    end
    return obj
end

-- DRAG SYSTEM (mobile safe)
local function drag(gui)
    local dragging = false
    local start, startPos

    gui.Active = true

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            start = input.Position
            startPos = gui.Position
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then

            local delta = input.Position - start
            gui.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- INIT
function AppleUi:init(title, splash, keybind, deleteOld, theme)
    local themeColor = {
        purple = Color3.fromRGB(155, 89, 182),
        blue = Color3.fromRGB(52, 152, 219),
        red = Color3.fromRGB(231, 76, 60)
    }

    local color = themeColor[theme] or themeColor.blue

    local parent = (gethui and gethui()) or game:GetService("CoreGui")

    local gui = create("ScreenGui", {
        Name = "AppleUi",
        Parent = parent,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 999
    })

    -- MAIN
    local main = create("Frame", {
        Parent = gui,
        Size = UDim2.fromScale(0.5, 0.55),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(25,25,25)
    })
    makeCorner(main, 12)
    drag(main)

    -- SIDEBAR
    local sidebar = create("Frame", {
        Parent = main,
        Size = UDim2.new(0.3, 0, 1, 0),
        BackgroundTransparency = 1
    })

    local list = create("UIListLayout", {
        Parent = sidebar,
        Padding = UDim.new(0, 6)
    })

    local pages = {}

    local window = {}

    function window:Section(name)
        local page = create("ScrollingFrame", {
            Parent = main,
            Size = UDim2.new(0.7, 0, 1, 0),
            Position = UDim2.new(0.3, 0, 0, 0),
            BackgroundTransparency = 1,
            Visible = false,
            CanvasSize = UDim2.new(0,0,0,0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 3
        })

        local layout = create("UIListLayout", {
            Parent = page,
            Padding = UDim.new(0, 6)
        })

        local tab = create("TextButton", {
            Parent = sidebar,
            Size = UDim2.new(1, -10, 0, 35),
            Text = name,
            BackgroundColor3 = Color3.fromRGB(40,40,40),
            TextColor3 = Color3.new(1,1,1),
            Font = Enum.Font.Gotham,
            TextSize = 14,
            AutoButtonColor = false
        })
        makeCorner(tab, 8)

        local sec = {}

        function sec:Select()
            for _, v in pairs(pages) do
                v.Visible = false
            end
            page.Visible = true
        end

        function sec:Button(text, callback)
            local btn = create("TextButton", {
                Parent = page,
                Size = UDim2.new(1, -10, 0, 40),
                Text = text,
                BackgroundColor3 = Color3.fromRGB(45,45,45),
                TextColor3 = Color3.new(1,1,1),
                Font = Enum.Font.Gotham,
                TextSize = 14,
                AutoButtonColor = false
            })
            makeCorner(btn, 8)

            btn.Active = true

            btn.Activated:Connect(function()
                if callback then callback() end
            end)
        end

        function sec:Toggle(text, default, callback)
            local state = default

            local holder = create("TextButton", {
                Parent = page,
                Size = UDim2.new(1, -10, 0, 40),
                Text = text,
                BackgroundColor3 = Color3.fromRGB(45,45,45),
                TextColor3 = Color3.new(1,1,1),
                Font = Enum.Font.Gotham,
                TextSize = 14,
                AutoButtonColor = false
            })
            makeCorner(holder, 8)

            local indicator = create("Frame", {
                Parent = holder,
                Size = UDim2.new(0, 30, 0, 15),
                Position = UDim2.new(1, -40, 0.5, -7),
                BackgroundColor3 = Color3.fromRGB(150,150,150)
            })
            makeCorner(indicator, 8)

            holder.Activated:Connect(function()
                state = not state
                indicator.BackgroundColor3 = state and color or Color3.fromRGB(150,150,150)
                if callback then callback(state) end
            end)
        end

        tab.Activated:Connect(function()
            sec:Select()
        end)

        pages[#pages+1] = page

        return sec
    end

    return window
end

return AppleUi
