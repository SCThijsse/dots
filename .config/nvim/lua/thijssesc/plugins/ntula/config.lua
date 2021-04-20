-- config

-- really just for myself
local function on_debugee_ready(host, port, callback)
    local client = vim.loop.new_tcp()
    client:bind(host, port)
    local res, err = client:getsockname()

    while not res ~= nil and err == nil do
        vim.loop.sleep(1000)
        if not client:is_closing() then
            client:close()
            client:bind(host, port)
            res, err = client:getsockname()
        end
    end

    callback()
end

local config = {
    -- config options for the plugin
    options = {
        offline = true,
        term = 1,
    },

    -- hook to execute before executing the command
    -- TODO: rewrite for sainer defaults without harpoon and dap, for
    -- inspiration see `dap.repl.toggle`:
    --  - new buffer
    --  - new tab
    --  - split buffer, height
    --  - vsplit buffer, width
    execute_hook = function(cmd, options, with_debugee, execute_nearest)
        local msg = {
            cmd = cmd,
            options = options,
            with_debugee = with_debugee,
            execute_nearest = execute_nearest,
        }
        -- log it
        print('execute_hook:', vim.inspect(msg))

        -- save it
        vim.cmd('write')

        -- send it
        require('harpoon.term').sendCommand(options.term, cmd)
        if not with_debugee then
            -- see it
            require('harpoon.term').gotoTerminal(options.term)
        end

        local dap = require('dap')
        local java_config = dap.configurations.java[1]
        -- debug it
        on_debugee_ready(java_config.hostName, java_config.port, dap.continue)
    end
}

function config.set_options(options)
    options = options or {}
    for opt, _ in pairs(config.options) do
        if options[opt] ~= nil then
            config.options[opt] = options[opt]
        end
    end
end

return config
