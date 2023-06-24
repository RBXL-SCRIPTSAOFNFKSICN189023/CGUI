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
  b.FillTransparency = 1
  b.OutlineTransparency = 0
  b.Adornee = a
  a.Screen.Changed:Connect(function()
    b.OutlineColor = a.Screen.Color
  end)
  b.Destroying:Connect(function()
    local found = table.find(pcH, b)
    if found then
      table.remove(pcH, found)
    end
  end)
  table.insert(pcH, b)
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
    if a.Name == "ComputerTable" and pcEsp then
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
