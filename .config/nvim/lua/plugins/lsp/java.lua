-- java

local jdtls = require('jdtls')
local jdtls_setup = require('jdtls.setup')
local on_attach = require('plugins.lsp.on_attach')

jdtls.start_or_attach {
     cmd = { 'jdtls' },
     root_dir = jdtls_setup.find_root { 'gradle.build', 'pom.xml' },
     on_attach = on_attach,
 }
