--LAUNCHER
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui
local text = Instance.new("TextLabel", gui)
text.Size = UDim2.new(0, 400, 0, 100)
text.AnchorPoint = Vector2.new(0.5, 0.5)
text.Position = UDim2.new(0.5, 0, 1.5, 0)
text.Text = "CubeScript"
text.BackgroundTransparency = 1
text.Font = Enum.Font.SciFi
local gradient = Instance.new("UIGradient", text)
gradient.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0.5, 0, 1))
local text2 = Instance.new("TextLabel", gui)
text2.Size = UDim2.new(0, 400, 0, 100)
text2.AnchorPoint = Vector2.new(0.5, 0.5)
text2.Position = UDim2.new(0.5, 0, 1.5, 5)
text2.Text = "CubeScript"
text2.BackgroundTransparency = 1
text2.Font = Enum.Font.SciFi
local gradient2 = Instance.new("UIGradient", text2)
gradient2.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0.5, 0, 1))
text:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1)
task.wait(0.1)
text2:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1)
task.wait(1)
local loadedString = game:HttpGet("raw.githubusercontent.com/CGUI-RBXL/CGUI/main/games/" .. game.PlaceId .. ".lua")
text:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 1)
task.wait(0.1)
text2:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 1)
task.wait(1)

local commands = {}
function addCommand(command, alt, exec)
  for _, a in ipairs(alt) do
    commands[a] = {
      alt = alt;
      exec = exec;
    }
  end
  commands[command] = {
    alt = alt;
    exec = exec;
    show = true
  }
end
function newWindow(title)
	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 400, 0, 325)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.BackgroundColor3 = Color3.new(0.125, 0.125, 0.125)
	frame.BorderSizePixel = 0
	
	local textLabel = Instance.new("TextLabel", frame)
	textLabel.Size = UDim2.new(1, -25, 0, 25)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SciFi
	textLabel.Text = title
	
	local frameContent = Instance.new("Frame", frame)
	frameContent.Size = UDim2.new(1, 0, 1, -25)
	frameContent.Position = UDim2.new(0, 0, 0, 25)
	frameContent.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
	frameContent.BorderSizePixel = 0
	
	local close = Instance.new("TextButton", frame)
	close.Text = "X"
	close.Font = Enum.Font.SciFi
	close.TextScaled = true
	close.BackgroundTransparency = 1
	close.Size = UDim2.new(0, 25, 0, 25)
	close.AnchorPoint = Vector2.new(1, 0)
	close.Position = UDim2.new(1, 0, 0, 0)
	close.TextColor3 = Color3.new(1, 0, 0)
	close.MouseButton1Click:Connect(function()
		frame:Destroy()
	end)
	return {
		forceClose = function()
			frame:Destroy()
		end,
		content = frameContent
	}
end
function yesOrNo(title, message, callback)
	local window = newWindow(title)
	local yesButton = Instance.new("TextButton", window.content)
	yesButton.Position = UDim2.new(0, 25, 0, 225)
	yesButton.Size = UDim2.new(0, 150, 0, 50)
	yesButton.BackgroundColor3 = Color3.new(0, 0.5, 0)
	yesButton.TextScaled = true
	yesButton.TextColor3 = Color3.new(1, 1, 1)
	yesButton.Font = Enum.Font.SciFi
	yesButton.Text = "Yes"
	local corner = Instance.new("UICorner", yesButton)
	corner.CornerRadius = UDim.new(0, 16)
	
	local noButton = Instance.new("TextButton", window.content)
	noButton.Position = UDim2.new(0, 225, 0, 225)
	noButton.Size = UDim2.new(0, 150, 0, 50)
	noButton.BackgroundColor3 = Color3.new(0.5, 0, 0)
	noButton.TextScaled = true
	noButton.TextColor3 = Color3.new(1, 1, 1)
	noButton.Font = Enum.Font.SciFi
	noButton.Text = "No"
	local corner2 = Instance.new("UICorner", noButton)
	corner2.CornerRadius = UDim.new(0, 16)
	
	local textLabel = Instance.new("TextLabel", window.content)
	textLabel.Size = UDim2.new(0, 350, 0, 100)
	textLabel.Position = UDim2.new(0, 25, 0, 75)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SciFi
	textLabel.Text = message
	
	local closedByX = true
	yesButton.MouseButton1Click:Connect(function()
		callback(true)
		closedByX = false
		window.forceClose()
	end)

	noButton.MouseButton1Click:Connect(function()
		callback(false)
		closedByX = false
		window.forceClose()
	end)
	
	window.content.Destroying:Connect(function()
		if closedByX then
			callback(false)
		end
	end)
	
	return window
end
function numberInput(title, message, callback, rules)
	local currentRules = {
		minValue = nil;
		maxValue = nil;
		decimal = true;
	}
	if rules then
		for a, b in pairs(rules) do
			currentRules[a] = b
		end
	end
	local window = newWindow(title)
	local textBox = Instance.new("TextBox", window.content)
	textBox.Position = UDim2.new(0, 25, 0, 225)
	textBox.Size = UDim2.new(0, 150, 0, 50)
	textBox.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	textBox.TextScaled = true
	textBox.TextColor3 = Color3.new(1, 1, 1)
	textBox.Font = Enum.Font.SciFi
	textBox.PlaceholderText	= "Insert Value"
	textBox.Text = ""
	local corner = Instance.new("UICorner", textBox)
	corner.CornerRadius = UDim.new(0, 16)

	local submit = Instance.new("TextButton", window.content)
	submit.Position = UDim2.new(0, 225, 0, 225)
	submit.Size = UDim2.new(0, 150, 0, 50)
	submit.BackgroundColor3 = Color3.new(0, 0.5, 0)
	submit.TextScaled = true
	submit.TextColor3 = Color3.new(1, 1, 1)
	submit.Font = Enum.Font.SciFi
	submit.Text = "Submit"
	local corner2 = Instance.new("UICorner", submit)
	corner2.CornerRadius = UDim.new(0, 16)

	local textLabel = Instance.new("TextLabel", window.content)
	textLabel.Size = UDim2.new(0, 350, 0, 100)
	textLabel.Position = UDim2.new(0, 25, 0, 75)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SciFi
	textLabel.Text = message
	
	local function correct(value)
		local corrected = false
		if tonumber(value) then
			value = tonumber(value)
		else
			corrected = true
			value = 0
		end
		if currentRules.minValue and value < currentRules.minValue then
			corrected = true
			value = currentRules.minValue
		end
		if currentRules.maxValue and value > currentRules.maxValue then
			corrected = true
			value = currentRules.maxValue
		end
		if math.round(value) == value and not currentRules.decimal then
			corrected = true
			value = math.round(value)
		end
		return corrected, value
	end
	
	local emptyValue = true
	textBox.FocusLost:Connect(function(enter)
		local corrected, value = correct(textBox.Text)
		if corrected or not enter then
			textBox.Text = value
		else
			callback(value)
			emptyValue = false
			window.forceClose()
		end
	end)

	submit.MouseButton1Click:Connect(function()
		local corrected, value = correct(textBox.Text)
		if corrected then
			textBox.Text = value
		else
			callback(value)
			emptyValue = false
			window.forceClose()
		end
	end)

	window.content.Destroying:Connect(function()
		if emptyValue then
			callback(nil)
		end
	end)

	return window
end
function stringInput(title, message, callback, maxCharacters)
	maxCharacters = maxCharacters or -1
	local window = newWindow(title)
	local textBox = Instance.new("TextBox", window.content)
	textBox.Position = UDim2.new(0, 25, 0, 225)
	textBox.Size = UDim2.new(0, 150, 0, 50)
	textBox.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	textBox.TextScaled = true
	textBox.TextColor3 = Color3.new(1, 1, 1)
	textBox.Font = Enum.Font.SciFi
	textBox.PlaceholderText	= "Insert Value"
	textBox.Text = ""
	local corner = Instance.new("UICorner", textBox)
	corner.CornerRadius = UDim.new(0, 16)

	local submit = Instance.new("TextButton", window.content)
	submit.Position = UDim2.new(0, 225, 0, 225)
	submit.Size = UDim2.new(0, 150, 0, 50)
	submit.BackgroundColor3 = Color3.new(0, 0.5, 0)
	submit.TextScaled = true
	submit.TextColor3 = Color3.new(1, 1, 1)
	submit.Font = Enum.Font.SciFi
	submit.Text = "Submit"
	local corner2 = Instance.new("UICorner", submit)
	corner2.CornerRadius = UDim.new(0, 16)

	local textLabel = Instance.new("TextLabel", window.content)
	textLabel.Size = UDim2.new(0, 350, 0, 100)
	textLabel.Position = UDim2.new(0, 25, 0, 75)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SciFi
	textLabel.Text = message

	local function correct(value)
		if maxCharacters > 0 and #value > maxCharacters then
			return true, string.sub(value, 1, maxCharacters)
		end
		return false, value
	end
	
	local emptyValue = true
	textBox.FocusLost:Connect(function(enter)
		local corrected, value = correct(textBox.Text)
		if corrected or not enter then
			textBox.Text = value
		else
			callback(value)
			emptyValue = false
			window.forceClose()
		end
	end)

	submit.MouseButton1Click:Connect(function()
		local corrected, value = correct(textBox.Text)
		if corrected then
			textBox.Text = value
		else
			callback(value)
			emptyValue = false
			window.forceClose()
		end
	end)

	window.content.Destroying:Connect(function()
		if emptyValue then
			callback(nil)
		end
	end)

	return window
end
function optionList(title, optionList, callback)
	local window = newWindow(title)
	
	local list = Instance.new("ScrollingFrame", window.content)
	list.AutomaticCanvasSize = Enum.AutomaticSize.Y
	list.CanvasSize = UDim2.new(0, 0, 0, 0)
	list.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	list.Size = UDim2.new(1, 0, 1, 0)
	list.BackgroundTransparency = 1
	local order = Instance.new("UIListLayout", list)
	order.Padding = UDim.new(0, 8)
	
	local closedByX = true
	for i, a in ipairs(optionList) do
		local submit = Instance.new("TextButton", list)
		submit.Size = UDim2.new(1, 0, 0, 50)
		submit.BackgroundColor3 = Color3.new(0.75, 0.75, 0.75)
		submit.TextScaled = true
		submit.TextColor3 = Color3.new(0, 0, 0)
		submit.BorderSizePixel = 0
		submit.Font = Enum.Font.SciFi
		submit.Text = a
		submit.MouseButton1Click:Connect(function()
			callback(i, a)
			closedByX = false
			window.forceClose()
		end)
	end
	
	window.content.Destroying:Connect(function()
		if closedByX then
			callback(-1, nil)
		end
	end)
	return window
end
function viewList(title, optionList)
	local window = newWindow(title)

	local list = Instance.new("ScrollingFrame", window.content)
	list.AutomaticCanvasSize = Enum.AutomaticSize.Y
	list.CanvasSize = UDim2.new(0, 0, 0, 0)
	list.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	list.Size = UDim2.new(1, 0, 1, 0)
	list.BackgroundTransparency = 1
	local order = Instance.new("UIListLayout", list)
	order.Padding = UDim.new(0, 8)

	local closedByX = true
	local gi = 0
	for a, b in pairs(optionList) do
		gi += 1
		local i = gi
		local submit = Instance.new("TextButton", list)
		submit.Size = UDim2.new(1, 0, 0, 50)
		submit.BackgroundColor3 = Color3.new(0.75, 0.75, 0.75)
		submit.TextScaled = true
		submit.TextColor3 = Color3.new(0, 0, 0)
		submit.BorderSizePixel = 0
		submit.Font = Enum.Font.SciFi
		submit.Text = a
		local flipped = false
		submit.MouseButton1Click:Connect(function()
			flipped = not flipped
			if flipped then
				submit.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
				submit.TextColor3 = Color3.new(1, 1, 1)
				submit.Text = b
			else
				submit.BackgroundColor3 = Color3.new(0.75, 0.75, 0.75)
				submit.TextColor3 = Color3.new(0, 0, 0)
				submit.Text = a
			end
		end)
	end
	
	return window
end

function notify(message)
	local window = newWindow("Notification")
	local okButton = Instance.new("TextButton", window.content)
	okButton.Position = UDim2.new(0, 25, 0, 225)
	okButton.Size = UDim2.new(0, 350, 0, 50)
	okButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	okButton.TextScaled = true
	okButton.TextColor3 = Color3.new(1, 1, 1)
	okButton.Font = Enum.Font.SciFi
	okButton.Text = "Ok"
	okButton.MouseButton1Click:Connect(function()
		window.forceClose()
	end)
	local corner = Instance.new("UICorner", okButton)
	corner.CornerRadius = UDim.new(0, 16)

	local textLabel = Instance.new("TextLabel", window.content)
	textLabel.Size = UDim2.new(0, 350, 0, 100)
	textLabel.Position = UDim2.new(0, 25, 0, 75)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SciFi
	textLabel.Text = message

	return window
end

_G.cLib = {
  addCommand = addCommand;
  newWindow = newWindow;
  yesOrNo = yesOrNo;
  numberInput = numberInput;
  stringInput = stringInput;
  optionList = optionList;
  viewList = viewList;
  notify = notify;
}

addCommand("commands", {"cmds", "help"}, function()
  local formatted = {}
  for a, b in pairs(commands) do
    if b.show then
      formatted[a] = table.concat(b.alt)
    end
  end
  viewList("Commands", formatted)
end)

local cmdBox = Instance.new("TextBox")
cmdBox.Text = ""
cmdBox.Size = UDim2.new(1, -162, 0, 40)
cmdBox.Position = UDim2.new(0, 108, 0, 0)
cmdBox.FocusLost:Connect(function()
  if commands[cmdBox.Text] then
    commands[cmdBox.Text]()
  else
    notify("NO CMD " .. cmdBox.Tect)
  end
end)

if loadedString == "404: Not Found" then
  notify("NO SCRIPT")
else
  loadstring(loadedString)()
end
