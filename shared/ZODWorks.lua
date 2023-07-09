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

ESX = exports["es_extended"]:getSharedObject()

---@class ZODWorks
---@version 1.0
ZODWorks = ZODWorks or {}

--- Get the ZODWorks object
---@return table
function ZODWorks:getSharedObject()
    return ZODWorks
end

exports("getSharedObject", ZODWorks.getSharedObject)