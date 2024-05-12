fx_version 'cerulean'
games { 'gta5' }

author 'Ghost DEV'
description 'GHOST Tax'
version '1.0.0'

dependency 'qb-core'

-- Server Scripts
server_scripts {
    'config.lua',
    'server.lua',
}

-- Client Scripts
client_scripts {
    'config.lua',
    'client.lua',
}

files {
    'config.lua'
}

lua54 'yes'
