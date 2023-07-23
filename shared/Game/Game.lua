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

--- Send a help notify to client (in top-left of screen)
---@param msg string The message content.
function ZODWorks.Game:helpNotify(msg)
    ESX.ShowHelpNotification(msg, false, false, -1)
end

--- Redefinition of TriggerServerEvent.
---@param event string Trigger event name.
---@param ... table Arguments
function ZODWorks.Game:Trigger(event, ...)
    TriggerServerEvent(event, ...)
end

--- Redefinition of getClosestObject (no originality yes but 0 ESX import in client side)
function ZODWorks.Game:getClosestObject()
    return ESX.Game.GetClosestObject()
end

--- Redefinition of getClosestObject (no originality yes but 0 ESX import in client side)
---@param dist number? If you want use the distance
function ZODWorks.Game:getClosestPlayer(dist)
    local player, distance = ESX.Game.GetClosestObject()
    if(dist and distance > dist and player ~= -1) then
        return player
    else
        return player
    end
end
--- Create a 3d Text (cannot remove it).
---@param text string The showed message.
---@param coords vector3 The coordonates.
---@param color table RGBA.
---@param size number? Font size.
---@param center boolean? Has to be centered ?.
function ZODWorks.Game:create3dText(text, coords, color, size, center)
    ESX.Game.Utils.DrawText3D(coords, text, 2.0, 1)
end

--- Create a marker on the map.
---@param id number The marker type.
---@param coords vector4 The coords of the marker.
---@param color table RGBA.
---@param canJump number? false = 0, true = 1.
---@param canRotate number? false = 0, true = 1.
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

setmetatable(ZODWorks, { __index = ZODWorks.Game })