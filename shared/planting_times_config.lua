-- This is a possible file if we want different planting times for different jobs.

PlantingTimesConfig = {}

-- Base states for everyone, if everyone is allowed to plant.
PlantingTimesConfig.Base = {
    TillingTime = 1000,
    TillingAnimation = 'amb_work@world_human_farmer_rake@male_a@idle_a',
    TillingAnimDict = "idle_a",
    SeedingTime = 1000,
    SeedingAnimation = "amb_work@world_human_feed_chickens@female_a@base", -- I dont know which one to use 
    SeedingAnimDict = "base" -- Help
}

PlantingTimesConfig.Base.__index = PlantingTimesConfig.Base

PlantingTimesConfig.Jobs = {
    Farmer = {
        TillingTime = 500,
        SeedingTime = 3000
    }
}

-- Have every job inherit from base if its not overwritten.
for jobName, jobConfig in pairs(PlantingTimesConfig.Jobs) do
    setmetatable(jobConfig, PlantingTimesConfig.Base)
end