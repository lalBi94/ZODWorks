### Dependencies
- **ESX Legacy** (https://documentation.esx-framework.org/legacy/installation/).
- **OXMySQL** (https://overextended.dev/oxmysql#installation).

### Installation
1. Download this repository: https://github.com/lalBi94/ZODWorks/archive/refs/heads/master.zip.
2. Add this line to your `resources.cfg` file. (You can also start your core).
```cfg
ensure ZODWorks
```

### Usage
1. Import the **ZODWorks** object on your `fxmanifest.lua` script with these lines.
```lua
shared_scripts {
    "@ZODWorks/shared/ZODWorks.lua"
}
```
2. Now store the framework in a variable.
```lua
local ZODWorks = exports["ZODWorks"]:getSharedObject()
```
3. You can now use all available functions. Exemple :
```lua
local myMoney = ZODWorks.Player:getMoneyFrom("bank") 
local currencyConvert = ZODWorks.Utils:formatCurrency(tostring(myMoney))

print(myMoney) -- 75900
print(currencyConvert) -- 75 900$
```

### Add-Ons
You can add your own **functions or triggers** by placing them in `ZODWorks/shared/AddOns/`. Ideally, :
- `ZODWorks/shared/AddOns/<YOUR_SCRIPT>/locales/locales.lua` (to add some langages)
- `ZODWorks/shared/AddOns/<YOUR_SCRIPT>/server-side.lua`
- `ZODWorks/shared/AddOns/<YOUR_SCRIPT>/client-side.lua`

Exemple : <br/>
`ZODWorks/shared/AddOns/myCustomScript/myCustomScript.lua`
```lua
ZODWorks.myCustomScript = {}

---@param str1 string The first string.
---@param str2 string The second string.
---@return string
function ZODWorks.myCustomScript:stringFusion(str1, str2) 
    return ("%s %s"):format(str1, str2)
end
```

`[myCore]/myCustomScript/client.lua`
```lua
local fusionString = ZODWorks.myCustomScript:stringFusion("Onde", "Folie")
print(fusionString) -- Onde Folie
```

### Credit
Owner → General Zod (bilaaaaaaaaaal) <br/>
Discord → https://discord.gg/xpCc6XmUaX <br/>
Version → 1.0