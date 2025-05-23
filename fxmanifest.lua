fx_version 'adamant'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'miojo.dev'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

files {
    'locales/*.json'
}

version '1.0.0'
lua54 'yes'