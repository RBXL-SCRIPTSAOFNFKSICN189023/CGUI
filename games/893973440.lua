--[[_G.cLib = {
  addCommand = addCommand;
  newWindow = newWindow;
  yesOrNo = yesOrNo;
  numberInput = numberInput;
  stringInput = stringInput;
  optionList = optionList;
  viewList = viewList;
  notify = notify;
  gui = gui;
}]]

_G.cLib.scriptVersion = "v1.0 B"

local pcEsp = false
local pcH = Instance.new("Folder", game.CoreGui)
pcH.Name = "CubeScript : FTF PC Highlights"
function verifyPc(a)
  if a:FindFirstChild("ComputerTrigger1") and a:FindFirstChild("Screen") then
    return true
  end
  return false
end
function highlightPc(a)
  if verifyPc(a) then
    local b = Instance.new("Highlight", pcH)
    b.OutlineColor = a.Screen.Color
    b.FillColor = a.Screen.Color
    b.FillTransparency = .75
    b.OutlineTransparency = 0
    b.Adornee = a
    a.Screen.Changed:Connect(function()
      b.OutlineColor = a.Screen.Color
      b.FillColor = a.Screen.Color
    end)
    b.Destroying:Connect(function()
      b:Destroy()
    end)
  end
end

local plEsp = false
local plH = Instance.new("Folder", game.CoreGui)
plH.Name = "CubeScript : FTF Player Highlights"
function highlightPl(p, a)
  local b = Instance.new("Highlight", plH)
  b.OutlineColor = Color3.new(0, 1, 1)
  b.FillColor = Color3.new(0, 1, 1)
  b.FillTransparency = .75
  b.OutlineTransparency = 0
  b.Adornee = a
  b.Enabled = plEsp
  if a:FindFirstChild("Hammer") then
    b.OutlineColor = Color3.new(1, 0, 0)
    b.FillColor = Color3.new(1, 0, 0)
  else
    b.OutlineColor = Color3.new(0, 1, 1)
    b.FillColor = Color3.new(0, 1, 1)
  end
end

workspace.DescendantAdded:Connect(function(a)
  if a.Name == "ComputerTrigger1" and pcEsp then
    task.wait(1)
    highlightPc(a.Parent)
  end
end)

_G.cLib.addCommand("computerEsp", {"pcesp"}, function()
  pcEsp = true
  pcH:ClearAllChildren()
  for _, a in ipairs(workspace:GetDescendants()) do
    if a.Name == "ComputerTrigger1" then
      task.spawn(function()
        task.wait(1)
        highlightPc(a.Parent)
      end)
    end
  end
  _G.cLib.notify("Pc Esp: ON")
end)

_G.cLib.addCommand("unComputerEsp", {"unpcesp"}, function()
  pcEsp = false
  pcH:ClearAllChildren()
  _G.cLib.notify("Pc Esp: OFF")
end)

_G.cLib.addCommand("playerEsp", {"plesp"}, function()
  plEsp = true
  _G.cLib.notify("Player Esp: ON")
  while plEsp do
    for _, a in ipairs(game.Players:GetPlayers()) do
      if a.Character then
        highlightPl(a, a.Character)
      end
    end
    task.wait(1)
    plH:ClearAllChildren()
  end
end)

_G.cLib.addCommand("unPlayerEsp", {"unplesp"}, function()
  plEsp = false
  _G.cLib.notify("Player Esp: OFF (Allow up to 2 seconds)")
  task.wait(2)
  plH:ClearAllChildren()
end)
