-- config

local config = {
    -- config options for the plugin
    options = { offline = true },
}

-- hook to execute before executing the command
function config.execute_hook(cmd, hook_options) ---@diagnostic disable-line: unused-local
    vim.cmd('write')
    vim.cmd('-tabnew')
    vim.fn.termopen(cmd)
end

function config.set_options(options)
    options = options or {}
    config.options = vim.tbl_extend('force', config.options, options)
end

return config
