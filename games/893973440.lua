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

local pcEsp = false
local pcH = {}
function highlightPc(a)
  local b = Instance.new("Highlight", a)
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
    local found = table.find(pcH, b)
    if found then
      table.remove(pcH, found)
    end
  end)
  table.insert(pcH, b)
end

local plEsp = false
local plH = {}
function highlightPl(p, a)
  local b = Instance.new("Highlight", a)
  b.OutlineColor = Color3.new(0, 1, 1)
  b.FillColor = Color3.new(0, 1, 1)
  b.FillTransparency = .75
  b.OutlineTransparency = 0
  b.Adornee = a
  b.Enabled = plEsp
  a.ChildRemoved:Connect(function()
    if a:FindFirstChildWhichIsA("Tool") then
      b.OutlineColor = Color3.new(1, 0, 0)
      b.FillColor = Color3.new(1, 0, 0)
    else
      b.OutlineColor = Color3.new(0, 1, 1)
      b.FillColor = Color3.new(0, 1, 1)
    end
  end)
  a.ChildAdded:Connect(function()
    if a:FindFirstChildWhichIsA("Tool") then
      b.OutlineColor = Color3.new(1, 0, 0)
      b.FillColor = Color3.new(1, 0, 0)
    else
      b.OutlineColor = Color3.new(0, 1, 1)
      b.FillColor = Color3.new(0, 1, 1)
    end
  end)
  game.Players.PlayerRemoving:Connect(function(pl)
    if p == pl then
      local found = table.find(plH, b)
      if found then
        table.remove(plH, found)
      end
    end
  end)
  table.insert(plH, b)
end

game.Players.PlayerAdded:Connect(function(a)
  a.CharacterAdded:Connect(function(b)
    task.wait(1)
    highlightPl(a, b)
  end)
end)

for _, a in ipairs(game.Players:GetPlayers()) do
  if a.Character then
    task.wait(1)
    highlightPl(a, a.Character)
  end
  a.CharacterAdded:Connect(function(b)
    task.wait(1)
    highlightPl(a, b)
  end)
end

workspace.DescendantAdded:Connect(function(a)
  if a.Name == "ComputerTable" and pcEsp then
    task.wait(1)
    highlightPc(a)
  end
end)

_G.cLib.addCommand("computerEsp", {"pcesp"}, function()
  pcEsp = true
  for _, a in ipairs(workspace:GetDescendants()) do
    if a.Name == "ComputerTable" then
      task.spawn(function()
        task.wait(1)
        highlightPc(a)
      end)
    end
  end
  _G.cLib.notify("Pc Esp: ON")
end)

_G.cLib.addCommand("unComputerEsp", {"unpcesp"}, function()
  pcEsp = false
  for _, a in ipairs(pcH) do
    a:Destroy()
  end
  pcH = {}
  _G.cLib.notify("Pc Esp: OFF")
end)

_G.cLib.addCommand("playerEsp", {"plesp"}, function()
  plEsp = true
  for _, a in ipairs(plH) do
    a.Enabled = true
  end
  _G.cLib.notify("Player Esp: ON")
end)

_G.cLib.addCommand("unPlayerEsp", {"unplesp"}, function()
  plEsp = false
  for _, a in ipairs(plH) do
    a.Enabled = false
  end
  plH = {}
  _G.cLib.notify("Player Esp: OFF")
end)
