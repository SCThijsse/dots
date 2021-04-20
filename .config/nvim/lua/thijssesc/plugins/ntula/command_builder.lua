-- command_builder

local CommandBuilder = {}

function CommandBuilder:new(opts)
    opts = opts or {}
    setmetatable(opts, self)
    self.__index = self
    self.opts = {}

    return opts
end

function CommandBuilder:with_cmd(cmd)
    self.cmd = cmd
    return self
end

function CommandBuilder:with_opt(opt)
    if type(opt) == 'string' then
        table.insert(self.opts, opt)
    elseif type(opt) == 'table' then
        for _, v in ipairs(opt) do
          table.insert(self.opts, v)
        end
    end

    return self
end

function CommandBuilder:build()
    local build = { self.cmd }
    for _, v in ipairs(self.opts) do
        table.insert(build, v)
    end

    return table.concat(build, ' ')

end

return CommandBuilder

