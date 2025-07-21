-- LeafUI Module v1 (Modular Version)

local LeafUI = {}

local TweenService = game:GetService("TweenService")

function LeafUI:Create(title)
	title = title or "LeafUI"
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "LeafUI"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Size = UDim2.new(0, 460, 0, 300)
	Main.Position = UDim2.new(0.5, -230, 0.5, -150)
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
	Main.BackgroundTransparency = 0.15
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.Active = true
	Main.Draggable = true
	Main.Parent = ScreenGui

	local MainCorner = Instance.new("UICorner")
	MainCorner.CornerRadius = UDim.new(0, 14)
	MainCorner.Parent = Main

	local Titlebar = Instance.new("Frame")
	Titlebar.Name = "Titlebar"
	Titlebar.Size = UDim2.new(1, 0, 0, 30)
	Titlebar.BackgroundTransparency = 1
	Titlebar.Parent = Main

	local TitleText = Instance.new("TextLabel")
	TitleText.Name = "TitleText"
	TitleText.BackgroundTransparency = 1
	TitleText.Size = UDim2.new(1, -70, 1, 0)
	TitleText.Position = UDim2.new(0, 10, 0, 0)
	TitleText.Font = Enum.Font.GothamBlack
	TitleText.TextSize = 22
	TitleText.TextColor3 = Color3.new(1, 1, 1)
	TitleText.TextXAlignment = Enum.TextXAlignment.Left
	TitleText.Text = title
	TitleText.Parent = Titlebar

	local CloseBtn = Instance.new("TextButton")
	CloseBtn.Name = "CloseBtn"
	CloseBtn.Size = UDim2.new(0, 30, 1, 0)
	CloseBtn.Position = UDim2.new(1, -35, 0, 0)
	CloseBtn.BackgroundTransparency = 1
	CloseBtn.Font = Enum.Font.GothamBold
	CloseBtn.TextSize = 22
	CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
	CloseBtn.Text = "X"
	CloseBtn.Parent = Titlebar

	local MinimizeBtn = Instance.new("TextButton")
	MinimizeBtn.Name = "MinimizeBtn"
	MinimizeBtn.Size = UDim2.new(0, 30, 1, 0)
	MinimizeBtn.Position = UDim2.new(1, -70, 0, 0)
	MinimizeBtn.BackgroundTransparency = 1
	MinimizeBtn.Font = Enum.Font.GothamBold
	MinimizeBtn.TextSize = 24
	MinimizeBtn.TextColor3 = Color3.new(1,1,1)
	MinimizeBtn.Text = "—"
	MinimizeBtn.Parent = Titlebar

	local TabsFrame = Instance.new("Frame")
	TabsFrame.Name = "TabsFrame"
	TabsFrame.Size = UDim2.new(0, 120, 1, -30)
	TabsFrame.Position = UDim2.new(0, 0, 0, 30)
	TabsFrame.BackgroundTransparency = 0.2
	TabsFrame.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
	TabsFrame.BorderSizePixel = 0
	TabsFrame.Parent = Main

	local TabsCorner = Instance.new("UICorner")
	TabsCorner.CornerRadius = UDim.new(0, 14)
	TabsCorner.Parent = TabsFrame

	local TabsLayout = Instance.new("UIListLayout")
	TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabsLayout.Padding = UDim.new(0, 8)
	TabsLayout.Parent = TabsFrame

	local ContentFrame = Instance.new("ScrollingFrame")
	ContentFrame.Name = "ContentFrame"
	ContentFrame.Size = UDim2.new(1, -130, 1, -30)
	ContentFrame.Position = UDim2.new(0, 130, 0, 30)
	ContentFrame.BackgroundTransparency = 0.2
	ContentFrame.BackgroundColor3 = Color3.fromRGB(60, 150, 80)
	ContentFrame.BorderSizePixel = 0
	ContentFrame.CanvasSize = UDim2.new(0,0,0,0)
	ContentFrame.ScrollBarThickness = 6
	ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ContentFrame.Parent = Main

	local ContentCorner = Instance.new("UICorner")
	ContentCorner.CornerRadius = UDim.new(0, 14)
	ContentCorner.Parent = ContentFrame

	local ContentLayout = Instance.new("UIListLayout")
	ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ContentLayout.Padding = UDim.new(0, 12)
	ContentLayout.Parent = ContentFrame

	local tabs = {}
	local tabContents = {}
	local currentTab = nil

	local function createTab(name)
		local tab = Instance.new("TextButton")
		tab.Name = name .. "Tab"
		tab.BackgroundColor3 = Color3.fromRGB(50, 130, 70)
		tab.Size = UDim2.new(1, -16, 0, 42)
		tab.AutoButtonColor = false
		tab.Font = Enum.Font.GothamBold
		tab.TextSize = 18
		tab.TextColor3 = Color3.new(1,1,1)
		tab.Text = name
		tab.Parent = TabsFrame

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 10)
		corner.Parent = tab

		return tab
	end

	local function createButton(title, desc, callback)
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1, -20, 0, 70)
		button.BackgroundColor3 = Color3.fromRGB(50, 130, 70)
		button.AutoButtonColor = false
		button.BorderSizePixel = 0
		button.Text = ""
		button.ZIndex = 1
		button.Parent = ContentFrame

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 14)
		corner.Parent = button

		local titleLabel = Instance.new("TextLabel")
		titleLabel.Text = title
		titleLabel.Font = Enum.Font.GothamBlack
		titleLabel.TextSize = 20
		titleLabel.TextColor3 = Color3.new(1, 1, 1)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Position = UDim2.new(0, 12, 0, 6)
		titleLabel.Size = UDim2.new(1, -24, 0, 30)
		titleLabel.TextXAlignment = Enum.TextXAlignment.Left
		titleLabel.ZIndex = 2
		titleLabel.Parent = button

		local descLabel = Instance.new("TextLabel")
		descLabel.Text = desc
		descLabel.Font = Enum.Font.Gotham
		descLabel.TextSize = 14
		descLabel.TextColor3 = Color3.fromRGB(210, 210, 210)
		descLabel.BackgroundTransparency = 1
		descLabel.Position = UDim2.new(0, 12, 0, 36)
		descLabel.Size = UDim2.new(1, -24, 0, 28)
		descLabel.TextXAlignment = Enum.TextXAlignment.Left
		descLabel.ZIndex = 2
		descLabel.Parent = button

		if callback then
			button.MouseButton1Click:Connect(callback)
		end

		return button
	end

	local function clearContent()
		for _, child in pairs(ContentFrame:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end
	end

	local function loadTab(tabName)
		if currentTab == tabName then return end
		currentTab = tabName
		clearContent()

		for _, item in ipairs(tabContents[tabName]) do
			createButton(item.title, item.desc, item.callback)
		end

		for name, btn in pairs(tabs) do
			btn.BackgroundColor3 = (name == tabName)
				and Color3.fromRGB(80, 180, 100)
				or Color3.fromRGB(50, 130, 70)
		end
	end

	local function addTab(name)
		tabs[name] = createTab(name)
		tabContents[name] = {}

		tabs[name].MouseButton1Click:Connect(function()
			loadTab(name)
		end)

		return {
			AddButton = function(_, title, desc, callback)
				table.insert(tabContents[name], { title = title, desc = desc, callback = callback })
			end
		}
	end

	local minimized = false
	local origSize = Main.Size
	local origPos = Main.Position

	MinimizeBtn.MouseButton1Click:Connect(function()
		minimized = not minimized
		if minimized then
			local tween = TweenService:Create(Main, TweenInfo.new(0.35), {
				Size = UDim2.new(origSize.X.Scale, origSize.X.Offset, 0, 30),
				Position = UDim2.new(origPos.X.Scale, origPos.X.Offset, origPos.Y.Scale, origPos.Y.Offset + origSize.Y.Offset - 30)
			})
			tween:Play()
			tween.Completed:Wait()
			TabsFrame.Visible = false
			ContentFrame.Visible = false
		else
			TabsFrame.Visible = true
			ContentFrame.Visible = true
			TweenService:Create(Main, TweenInfo.new(0.35), {
				Size = origSize,
				Position = origPos
			}):Play()
		end
	end)

	CloseBtn.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
	end)

	return {
		AddTab = addTab,
		LoadTab = loadTab
	}
end

return LeafUI
