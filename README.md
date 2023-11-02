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

## Component Diagram
Here's a first draft driagram of how the base of the inventory service will oppereate.  https://miro.com/app/board/uXjVNTIk1yU=/?share_link_id=775905120723 ;<br>

## SOLID Principles
Origionally, I had thought of seperating the functionality of adding itms to a player's inventory and then a player equipping items added to their inventory.  After reviewing the `interface segregation` principle and the `single responsibility` principle, I've made a decision to keep both the inventory and equip classes combined into one inventory class.  This is because to equip items we will always need to access our inventory and if items get removed from our inventory we may need to check to see if a player has them equipped.  These classes (or now class) are also dependent on client interaction and are not server dependent on whether they're used or not.;<br>
Thinking about how Roact works, I don't think it completely aligns with the `dependency inversion` principle.  Because of this, I would much rather use react-lua or roact-hooks because the base of the ui would feel more centralized and overall organied.  Vs having multiple trees which could be a lot to manage, you would end up having central points of functionality and components to just make up the design.;<br>
I chose to structured the inventory service so that I can just continue to add features to it and not have to worry about modifying the core functionality of the class.;<br>

## Optimize for Performance
Clean up all not needed tables of items;<br>
Handle user functionality on client;<br>
Defensive coding on server to prevent exploit, bugs, or spam `have not added spam protection [using something like a player state] in this project`;<br>

## Test Driven Development
Make use of promises and defensive coding practices;<br>

*proper commits have not been made for this project*
