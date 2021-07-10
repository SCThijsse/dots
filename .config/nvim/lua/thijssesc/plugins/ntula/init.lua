-- ntula

local config = require('thijssesc.plugins.ntula.config')
local utils = require('thijssesc.plugins.ntula.utils')

local ntula = {}
_NTulaCache = _NTulaCache or {}
_NTulaLastCmd = _NTulaLastCmd or ''

local function test(with_debugee, execute_nearest)
    with_debugee = with_debugee or false
    execute_nearest = execute_nearest or false

    -- if the last executed command is not set, assign is.
    if _NTulaLastCmd == '' then
        _NTulaLastCmd = utils.get_cmd(with_debugee, execute_nearest)
    end

    local hook_options = vim.tbl_extend('keep', config.options, {
        with_debugee = with_debugee,
        execute_nearest = execute_nearest,
    })
    config.execute_hook(_NTulaLastCmd, hook_options)
end

function ntula.test_last(with_debugee)
    -- don't reset the cached last executed command to rerun it.
    test(with_debugee)
end

function ntula.test_file(with_debugee)
    -- reset the last executed command to assign it later.
    _NTulaLastCmd = ''
    test(with_debugee, false)
end

function ntula.test_nearest(with_debugee)
    -- reset the last executed command to assign it later.
    _NTulaLastCmd = ''
    test(with_debugee, true)
end

function ntula.debug_last()
    -- same as `ntula.test_last` but with the debugee flag on
    ntula.test_last(true)
end

function ntula.debug_file()
    -- same as `ntula.test_file` but with the debugee flag on
    ntula.test_file(true)
end

function ntula.debug_nearest()
    -- same as `ntula.test_nearest` but with the debugee flag on
    ntula.test_nearest(true)
end

-- setup to override the default config.
function ntula.setup(custom_config)
    custom_config = custom_config or {}
    config.set_options(custom_config.options)
    if custom_config.execute_hook ~= nil then
        config.execute_hook = custom_config.execute_hook
    end
end

ntula.setup {
    options = {
        offline = true,
        term = 2,
        debug = true,
    },
    execute_hook = function(cmd, hook_options)
        local msg = { cmd, hook_options }
        if hook_options.debug then
            print('execute_hook:', vim.inspect(msg))
        end

        local term = require('harpoon.term')
        term.sendCommand(hook_options.term, cmd.."\n")
        if not hook_options.with_debugee then
            term.gotoTerminal(hook_options.term)
        end

        local dap = require('dap')
        local java_config = dap.configurations.java[1]
        local th_utils = require('thijssesc.utils')
        th_utils.on_debugee_ready(java_config.hostName, java_config.port, dap.continue)
    end,
}

return ntula

