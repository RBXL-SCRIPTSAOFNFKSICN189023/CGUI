--[[_G.cLib = {
  addCommand(command:string, alt:table<string>, exec:function):nil;
  newWindow(title:string):window;
  yesOrNo(title:string, message:string, callback:function<yes:bool>):window;
  numberInput(title:string, message:string, callback:function<value:number>, rules:rulesNumber):window;
  stringInput(title:string, message:string, callback:function<value:string>, maxCharacters:String):window;
  optionList(title:string, optionList:table<string>, callback:function<optionN:number, option:string>):window;
  viewList(title:string, optionList:table<string = string>):window;
  notify(message:string):window;
  gui:ScreenGui;
}]]

_G.cLib.notify("Script only works in-game.")
