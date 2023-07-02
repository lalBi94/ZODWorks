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

--- Withdraw some money from account bank.
---@param amount number The value of the withdraw.
---@param atmlist table The all of ATM coords (Security but optionnal).
---@return void
function ZODWorks.Player:withdrawMoney(amount, atmlist)
    TriggerServerEvent("zod::withdrawMoney", amount, atmlist or nil)
end

--- Deposit some money from account bank.
---@param amount number The value of the withdraw.
---@param atmlist table The all of ATM coords (Security but optionnal).
function ZODWorks.Player:depositMoney(amount, atmlist)
    TriggerServerEvent("zod::depositMoney", amount, atmlist or nil)
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

--- Get the players account
---@param account string { black_cash, cash, bank }
---@return number
function ZODWorks.Player:getMoneyFrom(account)
    local ply = ZODWorks.Player:getData().accounts

    if(account == "cash") then
        return ply[3].money
    elseif account == "dirty_cash" then
        return ply[1].money
    elseif account == "bank" then
        return ply[2].money
    else
        return nil
    end
end

--- Get the players accounts
---@return table { bank, cash, dirty_cash }
function ZODWorks.Player:getMoneys()
    local ply = ZODWorks.Player:getData().accounts

    return {
        bank = ply[2].money,
        cash = ply[3].money,
        dirty_cash = ply[1].money,
    }
end

--- Get coordonates.
---@return vector3
function ZODWorks.Player:getCoords()
    local coords = GetEntityCoords(PlayerPedId(-1))
    local h = GetEntityHeading(PlayerPedId(-1))
    return vector4(coords.x, coords.y, coords.z, h)
end

--- Get only the items who player have.
---@return table
function ZODWorks.Player:getInventory()
    local ply = ZODWorks.Player:getData().inventory
    local newobj = {}

    for _, v in pairs(ply) do
        if(v.count > 0) then
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