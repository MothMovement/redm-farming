PlantRequest = {}
-- TODO ensure configurability with config for extra items. Not sure how in depth I want it
CreateThread(function()

    CREATEDATABSAE()
    REGISTERITEMS()
    
    print('INITIALIZING MOTH-FARMING')
end)



function CREATEDATABSAE()
    SQL_TABLE_CREATION_QUERY = [[
    CREATE TABLE IF NOT EXISTS current_plants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plant_type VARCHAR(50) NOT NULL,
    growth_stage INT NOT NULL DEFAULT 0,
    watered TINYINT(1) NOT NULL DEFAULT 0,
    trimmed TINYINT(1) NOT NULL DEFAULT 0,
    fertilized TINYINT(1) NOT NULL DEFAULT 0,
    planted_by VARCHAR(60) NOT NULL,
    planted_by_job VARCHAR(50) NOT NULL,
    pos_x FLOAT NOT NULL,
    pos_y FLOAT NOT NULL,
    pos_z FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    INDEX idx_pos_xy (pos_x, pos_y)
    );
    ]]

    MySQL.query(SQL_TABLE_CREATION_QUERY)
end


function REGISTERITEMS()
    --Will probably loop through config to add all items, just hardcoding one item for now. 
    exports.vorp_inventory:registerUsableItem('Yarrow_Seed', function(data) 
        local plantingUser = GetPlayerPed(data.source)
        print(PlantRequest[data.source])
        if PlantRequest[data.source] ~= nil then 
            print('this is not nill')
            return -- Can put logic for cheating here, or webook this is probably broken
        end
        exports.vorp_inventory:subItem(data.source, data.item.item, 1)
        PlantRequest[data.source] = {
            beginTime = os.time(),
            plantType = PlantConfig.Seeds['Yarrow'],
            playInitCords = GetEntityCoords(plantingUser)
        }
        print(PlantRequest[data.source])

        TriggerClientEvent('moth:startPlanting', data.source)
        
    end)
end