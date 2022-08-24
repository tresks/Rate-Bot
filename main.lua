getgenv().rating = true
getgenv().list = {}
getgenv().blacklist = {}
game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
    if messageData.FromSpeaker ~= game.Players.LocalPlayer.Name then
        local message = string.lower(messageData.Message)

        if string.find(message, "tresk rate me") and table.find(list, messageData.FromSpeaker) ~= nil and getgenv().rating == true and table.find(blacklist, messageData.FromSpeaker) == nil then
            return
        else
            if string.find(message, "tresk rate me") and getgenv().rating == true and table.find(list, messageData.FromSpeaker) == nil and table.find(blacklist, messageData.FromSpeaker) == nil then
                table.insert(list, messageData.FromSpeaker)
                local number = math.random(1,10)
                local args = {
                    [1] = "Welcome to tresk's rating service please wait while the bot checks your avatar.",
                    [2] = "All"
                }
                    
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                task.wait(1)
                local args = {
                    [1] = "The bot has rated you "..number.."/10.",
                    [2] = "All"
                }
                    
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))

                local data = {
                    ["embeds"] = {
                        {
                            ["title"] = "**Player has been rated!**",
                            ["description"] = "The bot has rated "..messageData.FromSpeaker.." "..number.."/10",
                            ["type"] = "rich",
                            ["color"] = tonumber(0x7269da),
                        }
                    },
                    ["avatar_url"] = "https://cdn.discordapp.com/attachments/984209136562602014/1012131586826846208/Rate_bot.png",
                    ["username"] = "Rate Bot"
                }

                local headers = {
                    ["content-type"] = "application/json" 
                }
                syn.request({Url = "https://discord.com/api/webhooks/1011832551549186108/m9-2xMuDkJDvNuqWIq6YXDAcUGKoA907F5dV5NWwm8z_7kdBPjZIwI1Nn6yTcH-wJszV", Body = game:GetService("HttpService"):JSONEncode(data), Method = "POST", Headers = headers})
            end
        end
    end
end)
