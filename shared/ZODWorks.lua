-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 30/06/2023 at 23:55
-- Name: client/ZODWorks

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

Citizen.CreateThread(function()
    print("^1┌--------------------------------------┐")
    print("^1|^6 Author: bilaaaaaaaaaal ^7(General ^3Zod^7) ^1|")
    print("^1|^7 Version: ^51.0                         ^1|")
    print("^1|^3 ZODWorks ^2started...                  ^1|")
    print("^1└--------------------------------------┘")
end)

ESX = exports["es_extended"]:getSharedObject()

---@class
---@version 1.0
ZODWorks = ZODWorks or {}

--- Get the ZODWorks object
---@return table
function ZODWorks:getSharedObject()
    return ZODWorks
end

setmetatable(ZODWorks, {__index, getSharedObject})

exports("getSharedObject", ZODWorks.getSharedObject)