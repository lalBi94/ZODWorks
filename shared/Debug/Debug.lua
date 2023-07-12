-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 01/07/2023 at 02:19
-- Name: [Zod]/ZODWorks/client/Debug/Debug

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks.Debug = {}

RegisterCommand("coords", function(s, a, raw)
    ZODWorks.Debug:showCoordsNow()
end)

--- Show coords in real time.
---@return void
function ZODWorks.Debug:showCoordsNow()
    Citizen.CreateThread(function()
        while(true) do
            Citizen.Wait(0)

            if(IsControlJustPressed(1, 52)) then
                return nil
            end

            local coords = GetEntityCoords(PlayerPedId(-1))

            ESX.ShowHelpNotification(
                    "Press ~b~(Q)~w~ to ~r~exit\n~g~x "..coords.x..
                            "\ny "..coords.y.."\nz "..coords.z
            )
        end
    end)
end

--- Print in the console a table reccursively.
---@param s table The table.
---@param l number The limit (a big value for infinity) (OPTIONNAL).
---@param i number The indentation (OPTIONNAL).
---@return number
function ZODWorks.Debug:rPrint(s, l, i)
    l = (l) or 100; i = i or ""

    if(l < 1) then
        print "ERROR: Item limit reached."
        return l-1
    end

    local ts = type(s)

    if(ts ~= "table") then
        print (i,ts,s)
        return l-1
    end

    print (i,ts)

    for k, v in pairs(s) do
        l = ZODWorks.Debug:rPrint(v, l, i.."\t["..tostring(k).."]");

        if (l < 0) then
            break
        end
    end

    return l
end

setmetatable(ZODWorks, { __index = ZODWorks.Debug })