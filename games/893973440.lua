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
workspace.DescendantAdded:Connect(function(a)
  if a.Name == "ComputerTable" and pcEsp then
    task.wait(1)
    local b = a.Screen.BillboardGui:Clone()
    b.ImageLabel.ImageColor3 = a.Screen.Color
    b.Parent = a.Screen
    a.Screen.Changed:Connect(function()
      b.ImageLabel.ImageColor3 = a.Screen.Color
    end)
  end
end)

_G.cLib.addCommand("computerEsp", {"pcesp"}, function()
  pcEsp = true
  for _, a in ipairs(workspace:GetDescendants()) do
    if a.Name == "ComputerTable" and pcEsp then
      task.wait(1)
      local b = a.Screen.BillboardGui:Clone()
      b.ImageLabel.ImageColor3 = a.Screen.Color
      b.Parent = a.Screen
      a.Screen.Changed:Connect(function()
        b.ImageLabel.ImageColor3 = a.Screen.Color
      end)
    end
  end
  _G.cLib.notify("Pc Esp: ON")
end)

_G.cLib.addCommand("unComputerEsp", {"unpcesp"}, function()
  pcEsp = false
  for _, a in ipairs(workspace:GetDescendants()) do
    if a.Name == "ComputerTable" and pcEsp then
      task.wait(1)
      local b = a.Screen.BillboardGui:Clone()
      b.ImageLabel.ImageColor3 = a.Screen.Color
      b.Parent = a.Screen
      a.Screen.Changed:Connect(function()
        b.ImageLabel.ImageColor3 = a.Screen.Color
      end)
    end
  end
  _G.cLib.notify("Pc Esp: OFF")
end)
