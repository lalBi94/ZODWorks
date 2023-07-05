fx_version 'adamant'
game 'gta5'

author "General Zod | Discord: bilaaaaaaaaaal"
description "ZODWorks tool"

client_scripts {
    -- Locales
    "locales/locales.lua",

    -- RageUI
    "rui/RMenu.lua",
    "rui/menu/RageUI.lua",
    "rui/menu/Menu.lua",
    "rui/menu/MenuController.lua",
    "rui/components/*.lua",
    "rui/menu/elements/*.lua",
    "rui/menu/items/*.lua",
    "rui/menu/panels/*.lua",
    "rui/menu/windows/*.lua",

    -- Client
    "config.lua",
    "shared/ZODWorks.lua",
    "shared/Debug/Debug.lua",
    "shared/Utils/Utils.lua",
    "shared/Player/Player.lua",
    "shared/Game/Game.lua",

    -- ADD-ONS
    "shared/AddOns/**/*.lua"
}

shared_scripts {
    "@es_extended/imports.lua"
}

server_scripts {
    -- SQL
    '@oxmysql/lib/MySQL.lua',

    -- Locales
    "locales/locales.lua",
    "config.lua",

    -- ADD-ONS
    "shared/AddOns/**/*"
}

exports {
    "getSharedObject"
}