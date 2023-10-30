local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")

local Roact = require(Packages:WaitForChild("roact"))

local InventoryDisplay = Roact.Component:extend("InventoryDisplay")

function InventoryDisplay:init()
    self.onEquipHandleButtonActivated = function(equipHandle, itemName)
        self.props.handleEquip:Fire(equipHandle, itemName)
    end
end

function InventoryDisplay:render()
    local inventory = self.props.inventory
    local equipped = self.props.equipped

    local onEquipHandleButtonActivated = self.onEquipHandleButtonActivated

    local inventoryItems = {}
    for _itemTypes, itemNames in inventory do
        for itemName, _itemInfo in itemNames do
            inventoryItems[#inventoryItems+1] = Roact.createElement("TextButton", {
                Text = "Name: " .. " / Amount:  " .. itemName,
                [Roact.Event.Activated] = function(_element)
                    onEquipHandleButtonActivated("EQUIP", itemName)
                end
            })
        end
    end

    local equippedItems = {}
    for _, itemName in equipped do
        equippedItems[#equippedItems+1] = Roact.createElement("TextButton", {
            Text = itemName,
            [Roact.Event.Activated] = function(_element)
                onEquipHandleButtonActivated("UNEQUIP", itemName)
            end
        })
    end

    return Roact.createElement("ScreenGui", {
        ResetOnSpawn = false,
    }, {
        InventoryScrolling = Roact.createElement("ScrollingFrame", {
            Position = UDim2.fromScale(0, 0.2),
            Size = UDim2.fromScale(0.5, 0.7),
        }, {
            UIGridLayout = Roact.createElement("UIGridLayout", {

            }),
            InventoryIttems = Roact.createFragment(inventoryItems)
        }),
        EquippedHolder = Roact.createElement("Frame", {
            Size = UDim2.fromScale(1, 0.2),
        }, {
            UIGridLayout = Roact.createElement("UIGridLayout", {

            }),
            EquippedItems = Roact.createFragment(equippedItems)
        })
    })
end

return InventoryDisplay