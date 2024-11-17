local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()


local Window = OrionLib:MakeWindow({
		Name = "Plague Scripts | Free",
		HidePremium = false,
		SaveConfig = true,
		ConfigFolder = "OrionTest",
        IntroText = "Loading Script..."       
})


local Pets = require(game:GetService("ReplicatedStorage").Library.Directory.Pets)

local fromPet = ""
local toPet = ""


local PetSpawnerTab = Window:MakeTab({
    Name = "Pet Changer",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PetSpawnerTab:AddParagraph("How To Use", "Type the name of a pet currently in your inventory in the 'from pet' box and the pet you would like to spawn in the 'to pet' box.")

PetSpawnerTab:AddSection({ Name = "Pet Spawner" })

PetSpawnerTab:AddTextbox({
    Name = "From Pet",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        fromPet = Value
        print("From Pet: " .. fromPet)
    end
})

PetSpawnerTab:AddTextbox({
    Name = "To Pet",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        toPet = Value
        print("To Pet: " .. toPet)
    end
})

PetSpawnerTab:AddButton({
    Name = "Spawn Pet!",
    Callback = function()
        if fromPet == "" or toPet == "" then
            warn("Please fill in both 'From Pet' and 'To Pet' names!")
            return
        end
        
        if Pets[fromPet] and Pets[toPet] then
            for i in pairs(Pets[fromPet]) do
                Pets[fromPet][i] = nil
            end
            for i, v in pairs(Pets[toPet]) do
                Pets[fromPet][i] = v
            end
            print("Successfully spawned", fromPet, "to", toPet)
        else
            warn("Invalid pet names! Please confirm the pet names.")
        end
    end
})

local GemSpawnTab = Window:MakeTab({
    Name = "Gems Spawner",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

GemSpawnTab:AddParagraph("How To Use", "Type the amount of gems you would like to spawn in the box then click spawn once.")

local gemSpawnAmount = ""

GemSpawnTab:AddTextbox({
    Name = "Amount to spawn",
    Default = "",
    TextDisappear = false, 
    Callback = function(Value)
        gemSpawnAmount = Value
    end	  
})

GemSpawnTab:AddButton({
    Name = "Spawn!",
    Callback = function()
        local desiredAmount = tonumber(gemSpawnAmount)

        if gemSpawnAmount == "" then
            warn("Please enter a valid amount.")
            return
        end

        if desiredAmount and desiredAmount > 0 then
            local library = require(game.ReplicatedStorage.Library.Client.CurrencyCmds)
            local originalGetFunction = library.Get
            local currentDiamonds = originalGetFunction("Diamonds")

            library.Get = function(currencyId)
                if currencyId == "Diamonds" then
                    return currentDiamonds + desiredAmount
                else
                    return originalGetFunction(currencyId)
                end
            end

            local newDiamonds = currentDiamonds + desiredAmount
            library.Set("Diamonds", newDiamonds)

            print("Spawned " .. desiredAmount .. " diamonds.")
        else
            warn("Invalid amount entered")
        end
    end
})
