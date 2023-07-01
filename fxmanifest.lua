fx_version 'adamant'
game 'gta5'

author "General Zod | Discord: bilaaaaaaaaaal"
description ""

client_scripts {
    -- Locales
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
    "client/ZODWorks.lua",
    "client/Debug/Debug.lua",
    "client/Utils/Utils.lua",
    "client/Player/Player.lua",
    "client/Game/Game.lua",
}

server_scripts {
    "config.lua"
}

exports {
    "getSharedObject"
}

shared_script '@es_extended/imports.lua'