-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 02/07/2023 at 07:06
-- Name: [Zod]/ZODWorks/server/Player/Player.lua

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

--- Withdraw a money.
---@param amount number The value of cash to withdraw.
---@param atmlist table The all of ATM coords (Security but optionnal).
RegisterNetEvent("zod::withdrawMoney", function(amount, atmlist)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local curBalance = xPlayer.getAccount("bank").money

    if(amount <= curBalance) then
        xPlayer.removeAccountMoney("bank", amount)
        xPlayer.addAccountMoney("money", amount)
        xPlayer.showNotification((Locales.withdrawMoney.succes[CurrentLocale]):format(amount))
    else
        xPlayer.showNotification((Locales.depositMoney.wrong[CurrentLocale]):format(amount))
    end
end)

--- Withdraw a money.
---@param amount number The value of cash to withdraw.
---@param atmlist table The all of ATM coords (Security but optionnal).
RegisterNetEvent("zod::depositMoney", function(amount, atmlist)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local curBalance = xPlayer.getAccount("bank").money

    if(amount <= curBalance) then
        xPlayer.removeAccountMoney("money", amount)
        xPlayer.addAccountMoney("bank", amount)
        xPlayer.showNotification((Locales.depositMoney.succes[CurrentLocale]):format(amount))
    else
        xPlayer.showNotification((Locales.depositMoney.wrong[CurrentLocale]):format(amount))
    end
end)