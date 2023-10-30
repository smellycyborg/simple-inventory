# simple-invetnory

## player can [access-invetnory]
## player can [equip-items] ```if player owns item/s```
## player can [unequip-items]

# todo:
## [inventory-service] create add and remove methods for inventory
## [invetnory-data] ```manage through inventory service``` create invetnory table per player
## [equipped] ```manage through inventroy service``` create equipped items table per player

# [inventory-data]
provide ease of access to be able to search for items in inventory

# classes
inventory service - handle players inventory
equip service - handle equipping and unequipping items (for this project i kept inside inventory service)
- equip service would be able to access inventory service through methods such as [InventoryService:GetPlayerInventory] or [InventoryService:DoesPlayerOwnItem()]
roact components for front end - be able to manage states per player effeciently and maintain smooth developement down the line

# to optimize game performance
clean up all not needed tables of items
handle user functionality on client
defensive coding on server to prevent exploit, bugs, or spam ````have not added spam protection [using something like a player state] in this project``

# test driven devleopment
make use of promises and defensive coding practices

# proper commits have not been made for this project