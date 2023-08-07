local rem = require(game:GetService("ReplicatedStorage").Remotes)
local robax = 0
local exetick = tick()
print("Checkpoint 1")
local sounds = {
  "rbxassetid://7188420724";
  "rbxassetid://9119637444";
  "rbxassetid://9113072098";
  "rbxassetid://5799014146";
  "rbxassetid://5810686185";
}
function troll()
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = sounds[math.random(1, #sounds)]
    print(sound.SoundId)
    sound.Volume = 10
    repeat task.wait() until sound.IsLoaded
    sound:Play()
    task.wait(sound.TimeLength)
    sound:Destroy()
end
troll()
troll()
troll()
print("Checkpoint 2")
rem.OnClientEvent("NotifyDonationParticipants"):Connect(function(from, to, ammount)
    if to == game.Players.LocalPlayer.Name or to == game.Players.LocalPlayer or to == game.Players.LocalPlayer.UserId then
        robax += ammount
        local times = math.round(ammount / 10)
        for i = 1, times do
            troll()
        end
    end
end);

print("Checkpoint 3")
while task.wait(10) do
    print("made: " .. robax .. " robux by " .. tick() - exetick .. "s by the start of exe")
end
