--// ROBLOXLUA

--// Variables
local shopmenu = script.Parent:FindFirstChild("ScrollingFrame")
local player = game.Players.LocalPlayer
local leaderstats = player:FindFirstChild("leaderstats")
local money = leaderstats:FindFirstChild("Money")
local shopbutton = script.Parent.Frame:FindFirstChild("ShopButton")
local exitbutton = script.Parent.ScrollingFrame:FindFirstChild("ExitButton")

--// Button Variables
local pistolbutton = shopmenu:FindFirstChild("Pistol [50 Coins]")
local pistolbuttonvalue = pistolbutton:FindFirstChild("MoneyNeeded")

--// Sound Variables
local buysound = script.Parent:FindFirstChild("BuySound")
local errorsound = script.Parent:FindFirstChild("ErrorSound")

--// Label Variables
local pistollabel = shopmenu:FindFirstChild("PistolLabel")

--// Boolean Variables
local debounce = false 

--// Pistol Button Function
pistolbutton.MouseButton1Up:Connect(function(click1)
	if click1 then
		if money.Value >= pistolbuttonvalue.Value and money.Value > 0 then
			if debounce == false then
				buysound:Play()
			    local pistol = workspace.Handgun:Clone()
			    pistol.Parent = player.Backpack	
				money.Value -= 50
			    debounce = true
				wait(3)
				debounce = false
			end
		else
			errorsound:Play()
			pistolbutton.Text = 'No'
			wait(1.253)
			pistolbutton.Text = 'Pistol [50 Coins]' 
		end
	end
end)