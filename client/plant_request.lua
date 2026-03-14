RegisterNetEvent('moth:startPlanting', function()
    print('called')
    local playerId = PlayerPedId()
    local playerCords = GetEntityCoords(playerId)
    local found, z = GetGroundZFor_3dCoord(playerCords.x, playerCords.y, playerCords.z)

    --TODO replace this with logic for checking job and using that if it exists. For now default to base.
    local base = PlantingTimesConfig.Base 

    TILLING_ANIMATION = base.TillingAnimation
    TILLING_DICT = base.TillingAnimDict
    TILLING_TIME = base.TillingTime

    SEEDING_ANIMATION =  base.TillingAnimation
    SEEDING_DICT = base.TillingAnimDict
    SEEDING_TIME = base.TillingTime
    
    RequestAnimDict(TILLING_ANIMATION)
    while not HasAnimDictLoaded(TILLING_ANIMATION) and not HasAnimDictLoaded(SEEDING_ANIMATION) do
        Wait(0)
    end
    
    TaskPlayAnim(playerId, TILLING_ANIMATION, TILLING_DICT,  8.0, -8.0, -1, 1, 0, true, 0, false, 0, false)
    Wait(base.TillingTime)
    ClearPedTasks(playerId)


    TaskPlayAnim(playerId, SEEDING_ANIMATION, SEEDING_DICT,  8.0, -8.0, -1, 1, 0, true, 0, false, 0, false)
    Wait(base.SeedingTime)
    ClearPedTasks(playerId)



    TriggerServerEvent('moth:requestPlant', vector3(playerCords.x, playerCords.y, z))
    
end)