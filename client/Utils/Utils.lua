-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 01/07/2023 at 02:18
-- Name: [Zod]/ZODWorks/client/Utils/Utils

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks.Utils = {}

--- Format a number to currency
---@param amount string The string to convert to currency
function ZODWorks.Utils:formatCurrency(amount)
    local chain = ""
    local count = 0

    for i = string.len(amount), 1, -1 do
        count = count + 1
        chain = ("%s%s"):format(string.sub(amount, i, i), chain)

        if count % 3 == 0 and i ~= 1 then
            chain = (" %s"):format(chain)
        end
    end

    return ("%s$"):format(chain)
end

--- Display a input popup.
---@param msg string The title of the popup frame.
---@return string
function ZODWorks.Utils:inputPopup(msg)
    DisplayOnscreenKeyboard(1, msg, "", "", "", "", "", 30)

    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end

    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
        return result
    end
end

--- Check is the string contains only number (0123456789).
---@param str string The chain to check.
---@return string.
function ZODWorks.Utils:strIsNumber(str)
    return str:match("^%d+$") ~= nil
end

--- Get distance between coords (Vector3).
---@param coords1 vector3 First point.
---@param coords2 vector3 Second point.
---@return vector3
function ZODWorks.Utils:getDistanceBetween(coords1, coords2)
    return #(coords1 - coords2)
end

--- Check if an key-element is present in table.
---@param t table The table.
---@param key any The value.
---@return boolean
function ZODWorks.Utils:tableContainsKey(t, key)
    for k, _ in pairs(t) do
        if k == key then
            return true
        end
    end

    return false
end

--- Check if an element is present in table.
---@param t table The table.
---@param key any The value.
---@return boolean
function ZODWorks.Utils:tableContainsValue(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end

    return false
end