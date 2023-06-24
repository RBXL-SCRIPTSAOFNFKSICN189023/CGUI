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
local loadedString = game:HttpGet("https://raw.githubusercontent.com/CGUI-RBXL/CGUI/master/NIL")
text:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 1)
task.wait(0.1)
text2:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 1)
task.wait(1)
loadstring(loadedString)()
