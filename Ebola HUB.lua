local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Universal Scripts(All by Ebola)",
   LoadingTitle = "Ebola Hub",
   LoadingSubtitle = "by Ebola ",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Ebola Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "83Zp9jfNgW", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Ebola Hub",
      Subtitle = "Key System",
      Note = "Join Ebola https://discord.gg/83Zp9jfNgW for key",
      FileName = "EbolaKEY", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/pF8QmMRu"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local MainTab = Window:CreateTab("Universal", nil) -- Title, Image
local MainSection = MainTab:CreateSection("ESP")

Rayfield:Notify({
   Title = "Ebola Executed",
   Content = "Universal",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Ok!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Rejoin The current Server",
   Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LZjH70ZwH1mKlcHWLpyAf/LZEBOLA70Z/main/rejoinServer.lua"))()
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed Slider ",
   Range = {0, 999},
   Increment = 1,
   Suffix = "WalkSpeed",
   CurrentValue = 16,
   Flag = "WSPDSLIDER", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Esp(B TO TOGGLE)",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LZjH70ZwH1mKlcHWLpyAf/LZEBOLA70Z/main/updatedESP.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Fly(F TO TOGGLE)",
   Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LZjH70ZwH1mKlcHWLpyAf/LZEBOLA70Z/main/fly.lua"))()
   end,
})

Rayfield:Notify({
   Title = "FLY AND INF JUMP",
   Content = "IF PRESSED TOGETHER THEY FLING YOU!",
   Duration = 20,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Ok!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Auto TP(M TOGGLE)",
   Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LZjH70ZwH1mKlcHWLpyAf/LZEBOLA70Z/main/auto%20TP.lua"))()
   end,
})

Rayfield:Notify({
   Title = "AUTO TP",
   Content = "⚠️May not Work on all games⚠️",
   Duration = 20,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Ok!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Wall Jumper(J TO TOGGLE)",
   Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LZjH70ZwH1mKlcHWLpyAf/LZEBOLA70Z/main/wallJumper.lua"))()
   end,
})
