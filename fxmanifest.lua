fx_version 'cerulean'
author 'Marttins'
description 'Just simple script to create multiple businesses on only one resource'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'businesses/*'
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/*'
}

server_scripts {
    'server/*'
}

files {
    'locales/*'
}