local rem = require(game:GetService("ReplicatedStorage").Remotes)
local robax = 0
local exetick = tick()
for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid.RootPart:GetChildren()) do
    if v.Name == "Spinning" then
        v:Destroy()
    end
end
local sounds = {
  "rbxassetid://7188420724";
  "rbxassetid://9119637444";
  "rbxassetid://5602666105";
  "rbxassetid://9113072098";
  "rbxassetid://5799014146";
  "rbxassetid://5810686185";
}
rem.OnClientEvent("NotifyDonationParticipants"):Connect(function(from, to, ammount)
    if to == game.Players.LocalPlayer.Name or to == game.Players.LocalPlayer or to == game.Players.LocalPlayer.UserId then
        robax += ammount
        local times = math.round(ammount / 10)
        for i = 1, times do
            local sound = Instance.new("Sound", workspace)
            sound.SoundId = sounds[math.random(1, #sounds)
            sound.Volume = 10
            repeat task.wait() until sound.IsLoaded
            sound:Play()
            task.wait(sound.TimeLength)
            sound:Destroy()
        end
    end
end);

while task.wait(10) do
    print("made: " .. robax .. " robux by " .. tick() - exetick .. "s by the start of exe")
end
