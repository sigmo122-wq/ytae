local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

if CoreGui:FindFirstChild("CustomWindUI") then
    CoreGui.CustomWindUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomWindUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Text = "Bonita HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 25, 0, 10)
Title.Size = UDim2.new(0, 150, 0, 20)
Title.BackgroundTransparency = 1
Title.Parent = Header

local Credits = Instance.new("TextLabel")
Credits.Text = "By crystal"
Credits.Font = Enum.Font.Gotham
Credits.TextSize = 11
Credits.TextColor3 = Color3.fromRGB(130, 130, 130)
Credits.TextXAlignment = Enum.TextXAlignment.Left
Credits.Position = UDim2.new(0, 25, 0, 28)
Credits.Size = UDim2.new(0, 100, 0, 12)
Credits.BackgroundTransparency = 1
Credits.Parent = Header

local VersionTag = Instance.new("TextLabel")
VersionTag.Text = "v1.6.66-Universal"
VersionTag.Font = Enum.Font.Gotham
VersionTag.TextSize = 12
VersionTag.TextColor3 = Color3.fromRGB(180, 180, 180)
VersionTag.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
VersionTag.Position = UDim2.new(0, 165, 0, 12)
VersionTag.Size = UDim2.new(0, 75, 0, 20)
VersionTag.Parent = Header

local VerCorner = Instance.new("UICorner")
VerCorner.CornerRadius = UDim.new(0, 10)
VerCorner.Parent = VersionTag

local WindowButtons = Instance.new("Frame")
WindowButtons.Name = "WindowButtons"
WindowButtons.Size = UDim2.new(0, 70, 0, 20)
WindowButtons.Position = UDim2.new(1, -85, 0, 15)
WindowButtons.BackgroundTransparency = 1
WindowButtons.Parent = Header

local WBLayout = Instance.new("UIListLayout")
WBLayout.Parent = WindowButtons
WBLayout.FillDirection = Enum.FillDirection.Horizontal
WBLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
WBLayout.SortOrder = Enum.SortOrder.LayoutOrder
WBLayout.Padding = UDim.new(0, 8)

local function CreateMacBtn(color, order, callback)
    local Btn = Instance.new("TextButton")
    Btn.Text = ""
    Btn.Size = UDim2.new(0, 12, 0, 12)
    Btn.BackgroundColor3 = color
    Btn.LayoutOrder = order
    Btn.Parent = WindowButtons
    local BCorn = Instance.new("UICorner")
    BCorn.CornerRadius = UDim.new(1, 0)
    BCorn.Parent = Btn
    if callback then Btn.MouseButton1Click:Connect(callback) end
    return Btn
end

local isMinimized = false
local originalSize = MainFrame.Size
CreateMacBtn(Color3.fromRGB(39, 201, 63), 3)
CreateMacBtn(Color3.fromRGB(255, 189, 46), 2, function()
    isMinimized = not isMinimized
    local targetSize = isMinimized and UDim2.new(0, 550, 0, 45) or originalSize
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)
CreateMacBtn(Color3.fromRGB(255, 95, 86), 1, function() ScreenGui:Destroy() end)

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 190, 1, -65)
Sidebar.Position = UDim2.new(0, 0, 0, 65)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 4)

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -210, 1, -75)
Container.Position = UDim2.new(0, 200, 0, 65)
Container.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Container.BorderSizePixel = 0
Container.Parent = MainFrame

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0, 12)
ContainerCorner.Parent = Container

local tabs = {}
local pages = {}

local function CreateTab(name, layoutOrder, isLabel)
    if isLabel then
        local Label = Instance.new("TextLabel")
        Label.Text = "  " .. name
        Label.Font = Enum.Font.GothamBold
        Label.TextSize = 13
        Label.TextColor3 = Color3.fromRGB(90, 90, 90)
        Label.Size = UDim2.new(1, -20, 0, 25)
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.BackgroundTransparency = 1
        Label.LayoutOrder = layoutOrder
        Label.Parent = Sidebar
        return
    end

    local TabBtn = Instance.new("TextButton")
    TabBtn.Text = "    " .. name
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 14
    TabBtn.TextColor3 = Color3.fromRGB(170, 170, 170)
    TabBtn.Size = UDim2.new(1, -20, 0, 32)
    TabBtn.Position = UDim2.new(0, 10, 0, 0)
    TabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabBtn.BackgroundTransparency = 1
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.LayoutOrder = layoutOrder
    TabBtn.Parent = Sidebar

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = TabBtn

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, -20, 1, -20)
    Page.Position = UDim2.new(0, 10, 0, 10)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.Parent = Container

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 8)

    pages[name] = Page

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        for _, t in pairs(tabs) do 
            TweenService:Create(t, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(170, 170, 170)}):Play()
        end
        Page.Visible = true
        TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundTransparency = 0, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    tabs[name] = TabBtn
    return Page
end

local MainFramePage = CreateTab("Main", 1)
CreateTab("Silent", 2, true)
local AutoFarmPage  = CreateTab("Auto Farm", 3)
local MiscPage      = CreateTab("Misc", 4)
local VisualsPage   = CreateTab("Visuals", 5)
local InfoPage      = CreateTab("Info", 6)

local autoShellEnabled = false
local speed = 700 
local collectedTable = {} 

local AutoShellBtn = Instance.new("TextButton")
AutoShellBtn.Text = "Auto Shell: OFF"
AutoShellBtn.Font = Enum.Font.GothamBold
AutoShellBtn.TextSize = 14
AutoShellBtn.TextColor3 = Color3.fromRGB(255, 95, 86)
AutoShellBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
AutoShellBtn.Size = UDim2.new(1, 0, 0, 40)
AutoShellBtn.Parent = pages["Auto Farm"]

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = AutoShellBtn

local function isValidShell(part)
    if not part or not part.Parent then return false end
    if collectedTable[part] then return false end 
    if part:IsA("BasePart") then
        if part.Transparency >= 0.95 or part.Size.Magnitude <= 0.1 then return false end
    end
    return true
end

-- Безопасный клик хитбокса
local function safeTouch(hrp, targetPart, state)
    if firetouchinterest then
        pcall(function() firetouchinterest(hrp, targetPart, state) end)
    end
end

local function highSpeedFly(targetPart)
    local player = Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        
        -- Полет прямо ВНУТРЬ ракушки (смещено на 0 для гарантированного физического столкновения)
        local adjustedTarget = targetPart.Position
        local distance = (hrp.Position - adjustedTarget).Magnitude
        local duration = distance / speed
        
        local targetCFrame = CFrame.new(adjustedTarget) * CFrame.Angles(hrp.CFrame:ToEulerAnglesXYZ())
        local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        
        tween:Play()
        
        task.spawn(function()
            while tween.PlaybackState == Enum.PlaybackState.Playing do
                if not autoShellEnabled or not targetPart or not targetPart.Parent then break end
                safeTouch(hrp, targetPart, 0)
                task.wait(0.02)
                safeTouch(hrp, targetPart, 1)
            end
        end)
        
        tween.Completed:Wait()
        
        -- Физическая микро-задержка на точке для слабых читов и телефонов
        if targetPart and targetPart.Parent then
            safeTouch(hrp, targetPart, 0)
            task.wait(0.05) -- Увеличено время ожидания контакта
            safeTouch(hrp, targetPart, 1)
        end
        
        collectedTable[targetPart] = true
    end
end

local function getClosestShell()
    local player = Players.LocalPlayer
    if not (player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then return nil end
    
    local hrp = player.Character.HumanoidRootPart
    local closestPart = nil
    local shortestDistance = math.huge
    
    -- pcall защищает от лагов прогрузки StreamingEnabled
    pcall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name == "ResourceNode" then
                local prefab = obj:FindFirstChild("prefab") or obj:FindFirstChild("Prefab")
                if prefab then
                    local targetPart = nil
                    if prefab:IsA("BasePart") then targetPart = prefab
                    elseif prefab:IsA("Model") then targetPart = prefab.PrimaryPart or prefab:FindFirstChildWhichIsA("BasePart") end
                    
                    if targetPart and isValidShell(targetPart) then
                        local distance = (hrp.Position - targetPart.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            closestPart = targetPart
                        end
                    end
                end
            end
        end
    end)
    return closestPart
end

AutoShellBtn.MouseButton1Click:Connect(function()
    autoShellEnabled = not autoShellEnabled
    if autoShellEnabled then
        AutoShellBtn.Text = "Auto Shell: ON"
        AutoShellBtn.TextColor3 = Color3.fromRGB(39, 201, 63)
    else
        AutoShellBtn.Text = "Auto Shell: OFF"
        AutoShellBtn.TextColor3 = Color3.fromRGB(255, 95, 86)
        table.clear(collectedTable)
    end
end)

task.spawn(function()
    while task.wait(0.02) do
        if autoShellEnabled then
            local target = getClosestShell()
            if not target then
                table.clear(collectedTable)
                target = getClosestShell()   
            end
            if target then highSpeedFly(target) end
        end
    end
end)

local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Text = "Our Discord with other scripts"
DiscordLabel.Font = Enum.Font.GothamMedium
DiscordLabel.TextSize = 14
DiscordLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DiscordLabel.Size = UDim2.new(1, 0, 0, 20)
DiscordLabel.TextXAlignment = Enum.TextXAlignment.Left
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.LayoutOrder = 1
DiscordLabel.Parent = pages["Info"]

local DiscordButton = Instance.new("TextButton")
DiscordButton.Text = "https://discord.gg/kWtZJpNtX"
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.TextSize = 14
DiscordButton.TextColor3 = Color3.fromRGB(88, 101, 242)
DiscordButton.Size = UDim2.new(1, 0, 0, 25)
DiscordButton.TextXAlignment = Enum.TextXAlignment.Left
DiscordButton.BackgroundTransparency = 1
DiscordButton.LayoutOrder = 2
DiscordButton.Parent = pages["Info"]

DiscordButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/kWtZJpNtX")
        local oldText = DiscordButton.Text
        DiscordButton.Text = "Copied to clipboard!"
        DiscordButton.TextColor3 = Color3.fromRGB(85, 255, 85)
        task.wait(2)
        DiscordButton.Text = oldText
        DiscordButton.TextColor3 = Color3.fromRGB(88, 101, 242)
    end
end)

tabs["Info"].BackgroundTransparency = 0
tabs["Info"].TextColor3 = Color3.fromRGB(255, 255, 255)
pages["Info"].Visible = true
