-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 06/07/2023 at 05:53
-- Name: resources/[Zod]/ZODWorks/shared/AddOns/KRPDrugs/KRPDrugs

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks = ZODWorks or {}
ZODWorks.KRPDrugs = ZODWorks.KRPDrugs or {}

--- Recolt the drug
---@param drug table The drug object.
---@param coords vector3 The coords of the drug plantation.
---@return void
function ZODWorks.KRPDrugs:playerRecolt(drug, coords)
    ZODWorks.Game:Trigger("zod::playerRecolt", drug, coords)
end

--- Check if player have drug seed. If yes, use it.
---@param drug table The drugs.
---@return void
function ZODWorks.KRPDrugs:haveSeed(drug)
    ZODWorks.Game:Trigger("zod::haveSeed", drug)
end

setmetatable(ZODWorks, {__index, ZODWorks.KRPDrugs})