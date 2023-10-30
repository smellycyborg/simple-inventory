local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")
local RoactComponents = ReplicatedStorage:WaitForChild("RoactComponents")

local Knit = require(Packages:WaitForChild("knit"))
local Roact = require(Packages:WaitForChild("roact"))
local InventoryDisplay = require(RoactComponents:WaitForChild("InventoryDisplay"))

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local InventoryController = Knit.CreateController({
    Name = "InventoryController",
    Signal = {
        handleEquip = Instance.new("BindableEvent"),
    },
    Inventory = {},
    Equipped = {},
})

function InventoryController:KnitInit()
    InventoryService = Knit.GetService("InventoryService")

    self.InventoryHandle = Roact.mount(Roact.createElement(InventoryDisplay, {
        inventory = self.Inventory,
        equipped = self.Equipped,
        handleEquip = self.Signal.handleEquip,
    }), playerGui, "InventoryDisplay")

    self.updateInventoryHandle = function()
        Roact.update(self.InventoryHandle, Roact.createElement(InventoryDisplay, {
            inventory = self.Inventory,
            equipped = self.Equipped,
            handleEquip = self.Signal.handleEquip,
        }), playerGui, "InventoryDisplay")
    end

    print("MESSAGE/InventoryController:  initialized.")
end

function InventoryController:KnitStart()
    self.Signal.handleEquip.Event:Connect(function(equipHandle, itemName)
        if equipHandle == "EQUIP" then
            InventoryService:EquipItem(itemName):andThen(function(message)
                print(message)
            end)
        elseif equipHandle == "UNEQUIP" then
            InventoryService:UnequipItem(itemName):andThen(function(message)
                print(message)
            end)
        end
    end)

    InventoryService.Inventory:Observe(function(newInventory)
        self.Inventory = newInventory or {}
        self.updateInventoryHandle()
    end)

    InventoryService.Equipped:Observe(function(newEquipped)
        self.Equipped = newEquipped or {}
        self.updateInventoryHandle()
    end)

    print("MESSAGE/InventoryController:  started.")
end

return InventoryController