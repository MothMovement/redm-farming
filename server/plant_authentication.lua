RegisterServerEvent('moth:requestPlant')
AddEventHandler('moth:requestPlant', function(vector3) 
    local playerId = source
    local requestData = PlantRequest[source]
    if requestData == nil then
        print('THIS IS BAD, HOW THIS HAPPEN. CHEATER???????')
        return
    end

    print(json.encode(requestData))
    local plantData = requestData.plantType
    
    CreateObject(GetHashKey(plantData.prop), vector3.x, vector3.y, vector3.z - plantData.offset, true, false, false)
    PlantRequest[playerId] = nil
end)

