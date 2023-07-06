-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 06/07/2023 at 05:54
-- Name: resources/[Zod]/ZODWorks/shared/AddOns/KRPDrugs/SKRPDrugs

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("zod::haveSeed", function(drug)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item = xPlayer.hasItem(drug["Seed"]["name"])
    if(item) then
        xPlayer.removeInventoryItem(drug["Seed"]["name"], 1)
        TriggerClientEvent("zod::receiveHaveSeed", _src, true, drug)
    else
        TriggerClientEvent("zod::receiveHaveSeed", _src, false, drug)
    end
end)

RegisterNetEvent("zod::playerRecolt", function(drug, coords)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local winGrain = math.random() >= 0.5 and 1 or 0

    if(xPlayer.canCarryItem(drug["Recolt"]["name"], 10)) then
        if(winGrain == 1) then
            xPlayer.addInventoryItem(drug["Seed"]["name"], 1)
            xPlayer.showNotification(("Une %s ~s~ a survecu !"):format(drug["Seed"]["label"]))
        end

        xPlayer.addInventoryItem(drug["Recolt"]["name"], 10)
        xPlayer.showNotification(("Vous venez de recuperer x10 %s ~s~!"):format(drug["Recolt"]["label"]))
        TriggerClientEvent("zod::receiveDrugEnd", _src, coords)
    else
        xPlayer.showNotification(("~r~Vous n'avez pas assez de place dans votre inventaire !"))
        TriggerClientEvent("zod::receiveDrugEnd", _src, nil)
    end
end)