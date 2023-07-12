-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 01/07/2023 at 03:46
-- Name: [Zod]/ZODWorks/client/Player

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks.Player = {}

--- Get coordonates.
---@param vect4 boolean Return a vector4 value (+heading) OPTIONNAL
---@return vector3, vector4
function ZODWorks.Player:getCoords(vect4)
    local coords = GetEntityCoords(PlayerPedId(-1))

    if(vect4) then
        local h = GetEntityHeading(PlayerPedId(-1))
        return vector4(coords.x, coords.y, coords.z, h)
    else
        return vector3(coords.x, coords.y, coords.z)
    end
end

--- Player do an animation
---@param dictionary string The dictionnary of your anim.
---@param name string The name.
---@return void
function ZODWorks.Player:doAnimation(dictionary, name)
    Citizen.CreateThread(function()
        RequestAnimDict(dictionary)
        while (not HasAnimDictLoaded(dictionary)) do
            Citizen.Wait(0)
        end

        local player = PlayerPedId(-1)
        TaskPlayAnim(player, dictionary, name, 8.0, 8.0, 3000, 48, 1, false, false, false)
    end)
end

--- Stop an animation
---@return void
function ZODWorks.Player:stopAnimation()
    local player = PlayerPedId(-1)
    FreezeEntityPosition(player, false)
end

--- Teleport the player in coords.
---@param coords vector3 The destination.
---@return void
function ZODWorks.Player:teleport(coords)
    SetEntityCoords(PlayerPedId(-1), coords.x, coords.y, coords.z, 0, 0, 0, false)
end

--- Get the player data.
---@return table
function ZODWorks.Player:getData()
    return ESX.GetPlayerData()
end

--- Send ESX notify.
---@param msg string The message.
---@return void
function ZODWorks.Player:notify(msg)
    ESX.ShowNotification(msg)
end

--- Get the player indentity.
---@return table
function ZODWorks.Player:getIndentity()
    local ply = ZODWorks.Player:getData()

    return {
        identifier = ply.identifier,
        firstname = ply.firstName,
        lastname = ply.lastName,
        birthday = ply.dateofbirth,
        sex = ply.sex,
    }
end

--- To restructure the ESX.GetAccounts.
---@return table
function privateMoneyObjectCreator()
    local ply = ZODWorks.Player:getData().accounts
    local obj = {}

    for i=1, #ply do
        local cur = ply[i]

        if(cur.name == Config.Moneys.types.bank) then
            obj.bank = cur.money
        elseif cur.name == Config.Moneys.types.cash then
            obj.cash = cur.money
        elseif cur.name == Config.Moneys.types.black_cash then
            obj.black_cash = cur.money
        end
    end

    return obj
end

--- Get the players account
---@param account string { black_cash, cash, bank }
---@return number
function ZODWorks.Player:getMoneyFrom(account)
    local obj = privateMoneyObjectCreator()

    if(account == Config.Moneys.types.cash) then
        return obj.cash
    elseif account == Config.Moneys.types.black_cash then
        return obj.black_cash
    elseif account == Config.Moneys.types.bank then
        return obj.bank
    end
end

--- Get the players accounts
---@return table { bank, dirty_cash, cash }
function ZODWorks.Player:getMoneys()
    return privateMoneyObjectCreator()
end

--- Get only the items who player have.
---@return table
function ZODWorks.Player:getInventory()
    local ply = ZODWorks.Player:getData().inventory
    local newobj = {}

    for i = 1, #ply do
        local v = ply[i]

        if v.count > 0 then
            table.insert(newobj, {
                name = v.name,
                canRemove = v.canRemove,
                label = v.label,
                rare = v.rare,
                usable = v.usable,
                count = v.count,
                weight = v.weight
            })
        end
    end

    return newobj
end

--- Get the player weapons
---@return table
function ZODWorks.Player:getWeapons()
    return ZODWorks.Player:getData().weapons
end

--- Get job info of player.
---@return table
function ZODWorks.Player:getJob()
    return ZODWorks.Player:getData().job
end

setmetatable(ZODWorks, { __index = ZODWorks.Player })