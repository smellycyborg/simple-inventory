local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages

local Knit = require(Packages.knit)

local MAX_EQUIPPED = 5

local InventoryService = Knit.CreateService({
    Name = "InventoryService",
    InventoryPerPlayer = {},
    EquippedPerPlayer = {},
    Client = {
        InventoryChanged = Knit.CreateSignal(),
        EquippedChanged = Knit.CreateSignal(),
        Inventory = Knit.CreateProperty({}),
        Equipped = Knit.CreateProperty({}),
    },
})

local function _checkItemOwnership(player, itemName)
    local playerInventory = InventoryService.InventoryPerPlayer[player]

    for _itemType, itemNames in playerInventory do
        warn(itemNames)
        if itemNames[itemName] then
            return true
        end
    end

    return false
end

function InventoryService:KnitInit()
    InventoryChanged = self.Client.InventoryChanged
    EquippedChanged = self.Client.EquippedChanged
end

function InventoryService:KnitStart()
    local function playerAdded(player)
        task.wait(5)

        self:AddItem(player, "Food", "Bacon", 1)

        print(self.InventoryPerPlayer[player])
    end

    Players.PlayerAdded:Connect(playerAdded)
end

function InventoryService:AddItem(player: Player, itemType: string, itemName: string, amount: number)
    if not self.InventoryPerPlayer[player] then
        self.InventoryPerPlayer[player] = {}
    end

    local playerInventory = self.InventoryPerPlayer[player]

    if not playerInventory[itemType] then
        playerInventory[itemType] = {}
    end

    if not playerInventory[itemType][itemName] then
        playerInventory[itemType][itemName] = {}
        playerInventory[itemType][itemName].amount = 0
    end

    playerInventory[itemType][itemName].amount += amount

    InventoryChanged:Fire(player, playerInventory)
    self.Client.Inventory:SetFor(player, playerInventory)
end

function InventoryService:RemoveItem(player: Player, itemType: string, itemName: string, amount: number)
    if not self.InventoryPerPlayer[player] then
        return print("MESSAGE/RemoveItem:  ", player.Name, " does not have an inventory.")
    end

    local playerInventory = self.InventoryPerPlayer[player]
    
    if not table.find(playerInventory, itemType) then
        return print("MESSAGE/RemoveItem:  ", player.Name, " does not have any ", itemName, ".")
    else
        playerInventory[itemType] -= amount

        if playerInventory[itemType] <= 0 then
            playerInventory[itemType] = nil
        end
    end

    InventoryChanged:Fire(player, playerInventory)
    self.Client.Inventory:SetFor(player, playerInventory)
end

-- the equipping methods could or could not be it's own service/ controller
function InventoryService.Client:EquipItem(player: Player, itemName)
    local playerOwnsItem = _checkItemOwnership(player, itemName)

    if not playerOwnsItem then
        return warn("MESSAGE/EquipItem:  ", player.Name, " does not own ", itemName, ".")
    end

    if not InventoryService.EquippedPerPlayer[player] then
        InventoryService.EquippedPerPlayer[player] = {}
    end

    local playerEquipped = InventoryService.EquippedPerPlayer[player]

    if #playerEquipped > MAX_EQUIPPED then
        return print("MESSAGE/EquipItem:  ", player.Name, " has reach the limit for equipped.")
    end

    table.insert(playerEquipped, itemName)

    EquippedChanged:Fire(player, playerEquipped)
    InventoryService.Client.Equipped:SetFor(player, playerEquipped)
end

function InventoryService.Client:UnequipItem(player: Player, itemName)
    if not InventoryService.EquippedPerPlayer[player] then
        return warn("MESSAGE/UnequipItem:  ", player.name, " doesn't have anything to unequip.")
    end

    local playerEquipped = InventoryService.EquippedPerPlayer[player]

    table.remove(playerEquipped, table.find(playerEquipped, itemName))

    if #playerEquipped <= 0 then
        InventoryService.EquippedPerPlayer[player] = nil
        playerEquipped = nil
    end

    EquippedChanged:Fire(player, playerEquipped)
    InventoryService.Client.Equipped:SetFor(player, playerEquipped)
end

return InventoryService