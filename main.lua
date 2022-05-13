getgenv().rating = true
getgenv().list = {}
getgenv().blacklist = {}
for i,v in pairs(game.Players:GetPlayers()) do
    game.Players[v.Name].Chatted:connect(function(Message)
        local sex = string.lower(Message)
        if string.find(sex, "tresk rate me") and table.find(list, v.Name) ~= nil and getgenv().rating == true and table.find(blacklist, v.Name) == nil then
            table.insert(blacklist, v.Name)
            local args = {
                [1] = "Becase you have already been rated by tresk's rating service your new rating is 1/10.",
                [2] = "All"
            }
                
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            wait(1)
            local args = {
                [1] = "Also because you have used the command again you have been blacklisted from using this please move along now.",
                [2] = "All"
            }
                
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        else
            if string.find(sex, "tresk rate me") and getgenv().rating == true and table.find(list, v.Name) == nil and table.find(blacklist, v.Name) == nil then
                wait(0.1)
                table.insert(list, v.Name)
                print(list[1])
                local number = math.random(1,10)
                local args = {
                    [1] = "Welcome to tresk's rating service please wait while the bot checks your avatar.",
                    [2] = "All"
                }
                    
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = "The bot has rated you "..number.."/10.",
                    [2] = "All"
                }
                    
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                local url =
                    "WEBHOOK HERE"
                local data = {
                    ["embeds"] = {
                        {
                            ["title"] = "**Player has been rated!**",
                            ["description"] = "The bot has rated "..v.Name.." "..number.."/10",
                            ["type"] = "rich",
                            ["color"] = tonumber(0x7269da),
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                
                local headers = {
                    ["content-type"] = "application/json" 
                }
                request = http_request or request or HttpPost or syn.request
                request({Url = url, Body = newdata, Method = "POST", Headers = headers})
            end
        end
    end)
end
game.Players.PlayerAdded:Connect(function(player)
    game.Players[player.Name].Chatted:connect(function(Message)
        local sex = string.lower(Message)
        if string.find(sex, "tresk rate me") and table.find(list, player.Name) and getgenv().rating == true and table.find(blacklist, v.Name) == nil then
            table.insert(blacklist, v.Name)
            local args = {
                [1] = "Becase you have already been rated by tresk's rating service you're new rating is.",
                [2] = "All"
            }
                
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            wait(1)
            local args = {
                [1] = "Also because you have used the command again you have been blacklisted from using this please move along now.",
                [2] = "All"
            }
                
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        else
            if string.find(sex, "tresk rate me") and getgenv().rating == true and table.find(list, player.Name) == nil and table.find(blacklist, player.Name) == nil then
                wait(0.1)
                table.insert(list, player.Name)
                local number = math.random(1,10)
                local args = {
                    [1] = "Welcome to tresk's rating service please wait while the bot checks your avatar.",
                    [2] = "All"
                }
                    
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = "The bot has rated you "..number.."/10.",
                    [2] = "All"
                }
                    
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                local url =
                    "WEBHOOK HERE"
                local data = {
                    ["embeds"] = {
                        {
                            ["title"] = "**Player has been rated!**",
                            ["description"] = "The bot has rated "..player.Name.." "..number.."/10",
                            ["type"] = "rich",
                            ["color"] = tonumber(0x7269da),
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                
                local headers = {
                    ["content-type"] = "application/json" 
                }
                request = http_request or request or HttpPost or syn.request
                request({Url = url, Body = newdata, Method = "POST", Headers = headers})
            end
        end
    end)
end)
