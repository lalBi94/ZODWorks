-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 01/07/2023 at 02:19
-- Name: [Zod]/ZODWorks/client/Game/Game

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks.Game = {}

---@title 3D Text

--- Create a 3d Text.
---@param text string The showed message.
---@param coords vector3 The coordonates.
---@param color table RGBA.
---@param size number Font size (OPTIONNAL).
---@param center boolean Has to be centered ? (OPTIONNAL).
function ZODWorks.Game:create3dText(text, coords, color, size, center)
    SetTextScale(0.35, 0.35)
    SetTextFont(size or 4)
    SetTextProportional(1)
    SetTextColour(color.r or 255, color.g or 255, color.b or 255, color.a or 255)
    SetTextEntry("STRING")
    SetTextCentre(center or true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


---@title Marker

--- Create a marker on the map.
---@param id number The marker type.
---@param coords vector3 The coords of the marker.
---@param color table RGBA.
---@param canJump number false = 0, true = 1 (OPTIONNAL).
---@param canRotate number false = 0, true = 1 (OPTIONNAL).
function ZODWorks.Game:createMarker(id, coords, color, canJump, canRotate)
    return DrawMarker(id or 1, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0,
            0.0, 0.0, 0.5, 0.5, 0.5, color.r, color.g, color.b, color.a,
            canJump or 0, 1, 2, canRotate or 0, nil,
            nil, 0
    )
end


---@title Blips
--- All Blips table have to follow this example ->
--- blip = {id = 0, title = "Wsh la street", color = 0, vector3(-51, 100, 2) }
--- IDs (id) of the blip is here -> https://docs.fivem.net/docs/game-references/blips/#blips
--- Colors (color) of the blip is -> here https://docs.fivem.net/docs/game-references/blips/#blip-colors

--- Create a variable with Blip type
---@param blip table Blips info like the EXAMPLE in line 20]
---@return Blip
function ZODWorks.Game:createBlip(blip)
    local new_blip = AddBlipForCoord(blip.coords.x, blip.coords.y, blip.coords.z)
    SetBlipSprite(new_blip, blip.id)
    SetBlipDisplay(new_blip, 4)
    SetBlipScale(new_blip, 1.0)
    SetBlipColour(new_blip, blip.color)
    SetBlipAsShortRange(new_blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blip.title)
    EndTextCommandSetBlipName(new_blip)

    return new_blip
end

--- Remove a blip
---@param blip Blip The blip to detete
---@return void
function ZODWorks.Game:deleteBlip(blip)
    RemoveBlip(blip)
end


---@title Pets

--- Spawn a pet
---@author Onde Folie (ma womaan)
---@param race string The pet's race.
---@param name string The pets name (OPTIONNAL) { rottweiler, cat, husky, retriever, westy, crow }.
---@return Ped
function ZODWorks.Game:spawnPet(race, name)
    pets = {
        ["rottweiler"] = {
            model = "a_c_chop",
            hash = GetHashKey("a_c_chop"),
            type = 0
        }, ["cat"] = {
            model = "a_c_cat_01",
            hash = GetHashKey("a_c_cat_01"),
            type = 0
        }, ["husky"] = {
            model = "a_c_husky",
            hash = GetHashKey("a_c_husky"),
            type = 0
        }, ["retriever"] = {
            model = "a_c_retriever",
            hash = GetHashKey("a_c_retriever"),
            type = 0
        }, ["westy"] = {
            model = "a_c_westy",
            hash = GetHashKey("a_c_westy"),
            type = 0
        }, ["crow"] = {
            model = "a_c_crow",
            hash = GetHashKey("a_c_crow"),
            type = 0
        }
    }

    if(not ZODWorks.Utils:tableContainsKey(pets, race)) then
        ESX.ShowNotification((Locales.pets.wrong[CurrentLocale]):format(race))
        return nil
    end

    RequestModel(pets[race].hash)
    while not HasModelLoaded(pets[race].model) do
        Citizen.Wait(1)
    end

    AddRelationshipGroup("petmaster")

    local me = PlayerPedId(-1)
    local coords = GetEntityCoords(me)
    local heading = GetEntityHeading(me)

    pet = CreatePed(pets[race].type, pets[race].hash, coords.x + 1, coords.y, coords.z-0.20, heading, true, true)
    FreezeEntityPosition(pet, false)
    SetPedRelationshipGroupHash(me, GetHashKey("petmaster"))
    SetPedRelationshipGroupHash(pet, GetHashKey("petmaster"))
    TaskGoToEntity(pet, me, -1, 200, 100.0, 1073741824, 0)
    SetPedMoveRateOverride(pet, 22.50)

    Citizen.CreateThread(function()
        while(true) do
            local coordspet = GetEntityCoords(pet)
            ZODWorks.Game:create3dText(name, vector3(coordspet.x, coordspet.y, coordspet.z + 0.5),
                    { r = 255, g = 255, b = 255, a = 255 }, 4, true)
            Citizen.Wait(1)
        end
    end)

    ESX.ShowNotification((Locales.pets.succes[CurrentLocale]):format(name))
    return pet
end