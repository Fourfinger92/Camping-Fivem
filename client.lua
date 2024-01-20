local lustigecoords = {
    [vector3(2952.8,5325.69,101.02)] = 100,
    [vector3(-2171.8940, 2686.3433, 2.8952)]= 100,
    [vector3(-1123.8300, 4927.8804, 218.9099)]= 100,
    [vector3(1535.0085, 6619.7031, 2.3542)]= 100,
    [vector3(-436.6933, 1578.6030, 357.9863)]= 100,
    [vector3(5109.3804, -5151.1831, 1.8992)] = 1000,
}

local campingblibs = {
    {blip = vector3(2952.8,5325.69,101.02),id=417,colour=47, title = "Lurch Campingplatz 1"},
    {blip =vector3(-2171.8940, 2686.3433, 2.8952),id=417,colour =47, title = "Jagdgebiet Campingplatz 1"},
    {blip =vector3(-1123.8300, 4927.8804, 218.9099),id=417,colour=47, title = "Jagdgebiet Campingplatz 1"},
    {blip =vector3(1535.0085, 6619.7031, 2.3542),id=417,colour=47, title = "Campingplatz 2"},
    {blip =vector3(-436.6933, 1578.6030, 357.9863),id=417,colour=47, title = "Campingplatz 3"},
}

local stuhlmussgeloeschtwerden = nil
local stuhltyp = nil
local dergrillistda = nil
local grilltyp = nil
RegisterNetEvent('lurch-Camping')
AddEventHandler('lurch-Camping',function(item, lurch)
    local b=PlayerPedId()
    local c=GetEntityCoords(PlayerPedId())

    if IsPedInAnyVehicle(b)then 
    else 
        local isdrin = false
        for i,k in pairs(lustigecoords) do
            if #(i-c)<k then 
                isdrin = true
            end 
        end


        if isdrin or lurch.areaausnahme then


            TriggerServerEvent('lurch-Campkontroll', item, lurch)
        else 
            TriggerServerEvent("stuhlzurueck", item,"lurcheandieMacht")
            TriggerEvent("hud:notify","Camping",'Sie können nur in ausgewiesenen Bereichen campen.',"notification")
        end
    end
end)
    
RegisterNetEvent("lurch-Kur:createobject")
AddEventHandler("lurch-Kur:createobject",function(item, lurch)
    local ped=PlayerPedId()
    local j=GetEntityCoords(ped)
    for i, k in pairs(lurch) do  
        local ausnahme = false
        if item == "chair1" or item == "chair2" then   
            ausnahme = "chair"
        elseif item == "grill" then
            ausnahme = "grill"
        end       
        if ausnahme == "chair" and stuhlmussgeloeschtwerden then
            TriggerEvent("hud:notify","Camping","Du kannst immer nur einen Klappstuhl gleichzeitig stehen haben.", "notification")
            TriggerServerEvent("stuhlzurueck", item,"lurcheandieMacht")
        elseif ausnahme == "grill" and dergrillistda then
            TriggerEvent("hud:notify","Camping","Du kannst immer nur einen Grill gleichzeitig stehen haben.", "notification")
            TriggerServerEvent("stuhlzurueck", item,"lurcheandieMacht")
                
        else               
            crouch()
            local prob =nil
            if k.noOffset then
                prob = CreateObjectNoOffset(GetHashKey(k.name),j.x+k.xOffset,j.y+k.yOffset,j.z+k.zOffset,true,false)
                if ausnahme == "chair" then
                    stuhlmussgeloeschtwerden = prob
                    stuhltyp = item
                    despawnchair()
                    SetEntityRotation(prob, 0.0, 0.0, GetEntityHeading(ped)-180, false, true)
                elseif ausnahme == "grill" then
                    dergrillistda = prob
                    grilltyp = item
                    despawngrill()
                    SetEntityRotation(prob, 0.0, 0.0, k.heading, false, true)
                else
                    SetEntityRotation(prob, 0.0, 0.0, k.heading, false, true)
                end
            else
                prob = CreateObject(GetHashKey(k.name),j.x+k.xOffset,j.y+k.yOffset,j.z+k.zOffset,true,false)
                SetEntityRotation(prob, 0.0, 0.0, k.heading, false, true)
            end
            local z=ObjToNet(prob)            
            if k.freezed then                
                FreezeEntityPosition(prob,true)
            end


        end            


    end
end) 



function despawnchair ()
    Citizen.CreateThread(function()
        local i=PlayerPedId()             
        local e=GetEntityCoords(stuhlmussgeloeschtwerden)
        local drinnen = false
        while stuhlmussgeloeschtwerden do                
            local j=GetEntityCoords(i)
            local sleep = 1000
            local dist = #(j-e)
            if dist <7 then
                sleep = 200
                if dist <3 then   
                    if not drinnen then
                        TriggerEvent("hud:notify", "Camping","Drücke Z um den Klappstuhl einzupacken", "notification")  
                    end                   
                    drinnen = true
                    sleep = 0
                    if IsControlJustPressed(0,246) then
                        crouch()
                        DeleteEntity(stuhlmussgeloeschtwerden)
                        stuhlmussgeloeschtwerden = nil
                        TriggerServerEvent("stuhlzurueck", stuhltyp, "lurcheandieMacht")
                    end
                else 
                    drinnen = false
                end
            else 
                drinnen = false
            end
            Wait(sleep)
        end
    end)
end

function crouch()
    TaskStartScenarioInPlace(GetPlayerPed(-1),'world_human_gardener_plant',0,false)
    Wait(3000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end


local isindim = false
local isinmadim = false

Citizen.CreateThread(function()
    local drinnen = false
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)
        local entity = GetClosestObjectOfType(pcoords, 1.0, `prop_beach_fire`, false, false, false)
        local entityCoords = GetEntityCoords(entity)

        if DoesEntityExist(entity) and #(pcoords-entityCoords) < 3.5 then
            if isindim == false then
                startAnim()
                Citizen.Wait(1000)
                isindim = true
                isinmadim = false
            end
        else
            if isindim == true and isinmadim == false then
                StopAnimTask(GetPlayerPed(-1),"bs_2a_mcs_10-6","hc_hacker_dual-6",-1)
                isindim = false
                isinmadim = true
            end
        end

        Wait(sleep)
    end
end)



RegisterNetEvent("Grillendlich")
AddEventHandler("Grillendlich",function(item, lurch)
    local pcoords = GetEntityCoords(PlayerPedId())
    local entity2 = nil
    for i, k in pairs(lurch.probs) do
        entity2 = GetClosestObjectOfType(pcoords, 1.0, k, false, false, false)
        print(entity2.." "..k)
        if entity2 ~= 0 then
            break
        end
    end        
    local e=GetEntityCoords(entity2)
    local dist = #(pcoords-e)
    if dist <3 then                                   
        TaskStartScenarioInPlace(GetPlayerPed(-1),'PROP_HUMAN_BBQ',0,false)
        Wait(5000)
        TriggerServerEvent("ichhabgegrillt",lurch.ergebnis )
        ClearPedTasksImmediately(PlayerPedId())

    else
        TriggerEvent("hud:notify","Grillen", "Du musst in der Nähe einses Grills sein","notification")
        TriggerServerEvent("stuhlzurueck", item,"lurcheandieMacht")
    end
end)

function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("bs_2a_mcs_10-6")
        while not HasAnimDictLoaded("bs_2a_mcs_10-6")do 
            Citizen.Wait(0)
        end;
        TaskPlayAnim(GetPlayerPed(-1),"bs_2a_mcs_10-6","hc_hacker_dual-6",8.0,-8.0,-1,50,0,false,false,false)
    end)
end

Citizen.CreateThread(function()
    for a,b in pairs(campingblibs)do 
        b.blip=AddBlipForCoord(b.blip.x,b.blip.y,b.blip.z)
        SetBlipSprite(b.blip,b.id)
        SetBlipDisplay(b.blip,4)
        SetBlipScale(b.blip,0.7)
        SetBlipColour(b.blip,b.colour)
        SetBlipAsShortRange(b.blip,true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(b.title)
        EndTextCommandSetBlipName(b.blip)
    end
end)


--grill despawn


function despawngrill ()
    Citizen.CreateThread(function()
        local i=PlayerPedId()             
        local e=GetEntityCoords(dergrillistda)
        local drinnen = false
        while dergrillistda do                
            local j=GetEntityCoords(i)
            local sleep = 1000
            local dist = #(j-e)
            if dist <7 then
                sleep = 200
                if dist <3 then   
                    if not drinnen then
                        TriggerEvent("hud:notify", "Camping","Drücke Z um den Grill einzupacken", "notification")  
                    end                   
                    drinnen = true
                    sleep = 0
                    if IsControlJustPressed(0,246) then
                        crouch()
                        DeleteEntity(dergrillistda)
                        dergrillistda = nil
                        TriggerServerEvent("stuhlzurueck", grilltyp, "lurcheandieMacht")
                    end
                else 
                    drinnen = false
                end
            else 
                drinnen = false
            end
            Wait(sleep)
        end
    end)
end