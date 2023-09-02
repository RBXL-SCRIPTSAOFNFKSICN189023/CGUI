--[[_G.cLib = {
    addCommand(command:string, alt:table<string>, exec:function):nil;
    newWindow(title:string):window;
    yesOrNo(title:string, message:string, callback:function<yes:bool>):window;
    numberInput(title:string, message:string, callback:function<value:number>, rules:rulesNumber):window;
    stringInput(title:string, message:string, callback:function<value:string>, maxCharacters:String):window;
    optionList(title:string, optionList:table<string>, callback:function<optionN:number, option:string>):window;
    viewList(title:string, optionList:table<string = string>):window;
    notify(message:string):window;
    hint(message:string, ?duration:number = 5):window;
    gui:ScreenGui;
}]]
local en = false
addCommand("entityNotifier", {"en"}, function()
    en = true
    hint("Entity notifier ON", 3)
end)

addCommand("unEntityNotifier", {"unen"}, function()
    en = false
    hint("Entity notifier OFF", 3)
end)

addCommand("lightOrb", {"orb"}, function()
    local tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
    tool.Name = "LightOrb"
    tool.TextureId = "rbxassetid://10928806245"
    tool:SetAttribute("LightSource", true)
    tool:SetAttribute("ToolOffset", Vector3.yAxis * 0.1)
    local orb = Instance.new("Part", tool)
    orb.Material = Enum.Material.Neon
    orb.Shape = Enum.PartType.Ball
    orb.Name = "Handle"
    orb.Size = Vector3.one * 2
    orb.CanCollide = false
    local light = Instance.new("PointLight", orb)
    light.Brightness = 1
    light.Range = 60
    light.Shadows = true
    local light2 = Instance.new("PointLight", orb)
    light2.Brightness = 0.25
    light2.Range = 60
    light2.Shadows = false
    local animations = Instance.new("Folder", tool)
    animations.Name = "Animations"
    local animation = Instance.new("Animation", animations)
    animation.Name = "idle"
    animation.AnimationId = "rbxassetid://12405472102"
end)

function isEntity(Entity)
    local Main = nil
    local timeOut = tick() + 5
    repeat task.wait() until #Entity:GetChildren() > 0 or tick() >= timeOut
    if #Entity:GetChildren() > 0 then
        Main = Entity:GetChildren()[1]
    end
    if Main then
        print(Main.Position.Y)
        return Main.Position.Y > -999
    else
        warn("Entity never got a Main")
        return false
    end
end

function ding()
    local Sound = Instance.new("Sound")
    Sound.Parent = game.SoundService
    Sound.SoundId = "rbxassetid://550209561"
    Sound.Volume = 5
    Sound.PlayOnRemove = true
    Sound:Destroy()
end

workspace.ChildAdded:Connect(function(a)
    if en then
        if a.Name == "RushMoving" and isEntity(a) then
            ding()
            hint("Rush is coming!", 3)
        elseif a.Name == "AmbushMoving" and isEntity(a) then
            ding()
            hint("Ambush is coming!", 3)
        end
    end
end)
