local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()


local Window = OrionLib:MakeWindow({
		Name = "Plague Scripts | Premium",
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


local Tab = Window:MakeTab({
	Name = "Egg Hunter",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddParagraph("How To Use","Before hatch an egg make sure you click the Huge Hunter Or Titanic hunter button")


Tab:AddButton({
	Name = "Huge Hunter",
	Callback = function()
      		print("button pressed")
  	end    
})


Tab:AddButton({
	Name = "Titanic Hunter",
	Callback = function()
      		print("button pressed")
  	end    
})


local Tab = Window:MakeTab({
	Name = "Trade Stealer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddParagraph("How To Use","Make sure you are already in the trade, if you are already in the trade, just press the steal button")


Tab:AddButton({
	Name = "Start Stealing",
	Callback = function()
      		print("button pressed")
  	end    
})


local Tab = Window:MakeTab({
	Name = "Trade Scam",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddParagraph("How To Use","Make sure you are already in the trade, if you are already in the trade, just press the on/off, and bypass button")


Tab:AddButton({
	Name = "Bypass Trade",
	Callback = function()
OrionLib:MakeNotification({
	Name = "Trade Bypassed",
	Content = "Now you can start the scam",
	Image = "rbxassetid://4483345998",
	Time = 5
})
      		print("button pressed")
  	end    
})


Tab:AddToggle({
	Name = "on/off",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})


local Tab = Window:MakeTab({
	Name = "Dupe Pet",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddParagraph("How To Use","Type the name of a pet currently in your inventory in the Name Pet, and type the amount of pet you would like to dupe in the box then click dupe once.")


Tab:AddTextbox({
	Name = "Name Pet",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end	  
})


Tab:AddTextbox({
	Name = "Amount",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end	  
})


Tab:AddButton({
	Name = "Dupe Now",
	Callback = function()
      		print("button pressed")
  	end    
})