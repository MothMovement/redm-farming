
-- TODO ensure configurability with config for extra items. Not sure how in depth I want it
CreateThread(function()
    createDatabase()

end)



local function createDatabase()
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
    pos_x DOUBLE NOT NULL,
    pos_y DOUBLE NOT NULL,
    pos_z DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    ]]

    MySQL.query(SQL_TABLE_CREATION_QUERY)
end


local function registerItems()
    --Will probably loop through config to add all items, just hardcoding one item for now. 
    exports.vorp_inventory:registerUsableItem('corn_seed', function(data) 
        print(data)
    end)
end