local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")
local Controllers = ReplicatedStorage:WaitForChild("Controllers")

local Knit = require(Packages:WaitForChild("knit"))

Knit.AddControllers(Controllers)

Knit.Start():andThen(function()
    print("MESSAGE/Knit:  client start.")
end):catch(warn):await()