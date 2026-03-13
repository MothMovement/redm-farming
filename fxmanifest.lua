fx_version 'cerulean'
game 'rdr3'
lua54 'yes'

author 'Moth'
description 'A farming script for redm'
version '1.0.0'

shared_scripts {
    '@vorp_core/imports.lua',
    'config.lua',
    'shared/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

dependencies {
    'vorp_core'
}

escrow_ignore {

}