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

    config.execute_hook(_NTulaLastCmd, config.options, with_debugee, execute_nearest)
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
end

ntula.setup {
    options = { term = 2 },
}

return ntula

