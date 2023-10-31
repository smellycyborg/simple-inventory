# Simple Inventory

As a player, I can `access my inventory`;<br>
As a player, I can `equip items` [if `i own them` and `my inventory isn't full`];<br>
As a player, I `unequip itmes` from my inventory;<br>
As a player, I can `attack using` my `activated weapon`;<br>


# Todo
Inventory Service:  create add and remove methods for inventory;<br>
Invetnory Data:  `manage through inventory service` create invetnory table per player, provide ease of access to be able to search for items in inventory;<br>
Equipped:  `manage through inventroy service` create equipped items table per player;<br>

## Classes
Inventory Service - handle players inventory;<br>
Equip Service - handle `equipping` and `unequipping` items (for this project i kept inside inventory service);<br>
[NOTE:] Equip Service would be able to access inventory service through methods such as `InventoryService:GetPlayerInventory` or `InventoryService:DoesPlayerOwnItem()`;<br>
Roact Components for front-end - be able to manage states per player effeciently and maintain smooth developement down the line;<br>

## Optimize for Performance
Clean up all not needed tables of items;<br>
Handle user functionality on client;<br>
Defensive coding on server to prevent exploit, bugs, or spam `have not added spam protection [using something like a player state] in this project`;<br>

## Test Driven Development
Make use of promises and defensive coding practices;<br>

*proper commits have not been made for this project*