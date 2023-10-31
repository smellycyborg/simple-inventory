# Simple Inventory

As a player, I can `access my inventory`;

As a player, I can `equip items` [if `i own them` and `my inventory isn't full`];

As a player, I `unequip itmes` from my inventory;

As a player, I can `attack using` my `activated weapon`;


# Todo
Inventory Service:  create add and remove methods for inventory;

Invetnory Data:  `manage through inventory service` create invetnory table per player, provide ease of access to be able to search for items in inventory;

Equipped:  `manage through inventroy service` create equipped items table per player;

## Classes
Inventory Service - handle players inventory;

Equip Service - handle `equipping` and `unequipping` items (for this project i kept inside inventory service);

[NOTE:] Equip Service would be able to access inventory service through methods such as `InventoryService:GetPlayerInventory` or `InventoryService:DoesPlayerOwnItem()`;

Roact Components for front-end - be able to manage states per player effeciently and maintain smooth developement down the line;

## Optimize for Performance
Clean up all not needed tables of items;

Handle user functionality on client;

Defensive coding on server to prevent exploit, bugs, or spam `have not added spam protection [using something like a player state] in this project`;

## Test Driven Development
Make use of promises and defensive coding practices;

*proper commits have not been made for this project*