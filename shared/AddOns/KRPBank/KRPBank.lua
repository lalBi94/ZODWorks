-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 03/07/2023 at 03:50
-- Name: [Zod]/ZODWorks/client/KRPBank/KRPBank

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks.KRPBank = {}

--- Withdraw some money from account bank.
---@param amount number The value of the withdraw.
---@param atmlist table The all of ATM coords (Security but optionnal).
---@return void
function ZODWorks.KRPBank:withdrawMoney(amount, atmlist)
    TriggerServerEvent("zod::withdrawMoney", amount, atmlist or nil)
end

--- Deposit some money from account bank.
---@param amount number The value of the withdraw.
---@param atmlist table The all of ATM coords (Security but optionnal).
function ZODWorks.KRPBank:depositMoney(amount, atmlist)
    TriggerServerEvent("zod::depositMoney", amount, atmlist or nil)
end