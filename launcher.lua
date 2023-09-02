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
