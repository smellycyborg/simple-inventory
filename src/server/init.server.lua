local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Packages = ReplicatedStorage.Packages
local Services = ServerStorage.Services

local Knit = require(Packages.knit)

Knit.AddServices(Services)

Knit.Start():catch()