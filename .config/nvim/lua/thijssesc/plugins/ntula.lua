-- ntula

local Iterator = require('plenary.iterators')
local Path = require('plenary.path')
-- local dap = require('dap')
local term = require('harpoon.term')
local ts_locals = require('nvim-treesitter.locals')
local ts_parsers = require('nvim-treesitter.parsers')
local ts_query = require('nvim-treesitter.query')
local ts_utils = require('nvim-treesitter.ts_utils')

local ntula = {
    config = {
        term = 1,
        execute = true,
        offline = true,
        write = true,
    }
}
_NTulaCache = _NTulaCache or {}
_NTulaLastCmd = _NTulaLastCmd or ''

function ntula.config.set_config(opts)
    opts = opts or {}
    for opt, _ in pairs(ntula.config) do
        if opts[opt] ~= nil then
            ntula.config[opt] = opts[opt]
        end
    end
end

function ntula.ts_parse_query(query, nearest_end_row)
    local bufnr = vim.fn.bufnr()
    local lang = vim.api.nvim_buf_get_option(bufnr, 'filetype')

    local parsed_query = vim.treesitter.parse_query(lang, query)

    local parser = ts_parsers.get_parser(bufnr, lang)
    local root = parser:parse()[1]:root()
    local start_row, _, end_row, _ = root:range()
    end_row = nearest_end_row or end_row

    local res = {}
    for match in ts_query.iter_prepared_matches(parsed_query, root, bufnr, start_row, end_row) do
        ts_locals.recurse_local_nodes(match, function(_, node)
            -- res =  ts_utils.get_node_text(node)[1]
            table.insert(res, ts_utils.get_node_text(node)[1])
        end)
    end

    return res
end

function ntula.get_test_subject()
    local packages = ntula.ts_parse_query [[(program (package_declaration (scoped_identifier) @name))]]
    local classes = ntula.ts_parse_query [[(program (class_declaration (identifier) @name))]]

    -- gets the names of all the methods with an @Test annotation
    local methods_query = [[
      (program
        (class_declaration
          (identifier)
          (class_body
            (method_declaration
              (modifiers [
                  (annotation (identifier) @annotation (#eq? @annotation "Test"))
                  (marker_annotation (identifier) @annotation (#eq? @annotation "Test"))
              ])
              (identifier) @name))))
    ]]

    -- try to get the nearest method between the first line and the line the
    -- cursor is currently on.
    local nearest_end_row = vim.fn.line('.')
    local methods = ntula.ts_parse_query(methods_query, nearest_end_row)


    -- if no methods are found get the first method.
    if next(methods) == nil then
        methods = ntula.ts_parse_query(methods_query)
    end

    -- the results table includes the annotation names so filter them out.
    methods = Iterator.iter(methods):filter(function(o)
        return o ~= 'Test'
    end):tolist()

    return packages[1], classes[1], methods[#methods]
end

-- based on `require('jdtls.setup').find_root { 'marker1', 'marker2' }`
function ntula.find_root_pom(bufname)
    bufname = bufname or vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
    local dirname = Path:new(vim.fn.fnamemodify(bufname, ':p:h'))

    while not (Path:new(dirname:parent()).filename == dirname.filename) do
        local pom_file = dirname:joinpath('pom.xml')
        if pom_file:exists() then
            return pom_file
        end
        dirname = Path:new(dirname:parent())
    end
end

function ntula.get_project(class)
    local project = _NTulaCache[class]
    -- check if the cache was hit to return early
    if project ~= nil then
        return project
    end

    local lines = ntula.find_root_pom():readlines()
    local artifacts = Iterator.iter(lines):filter(function(o)
        return string.match(o, '<artifactId>') ~= nil
    end)

    -- assumes <parent> tag has the first <artifactId> tag, so get the second
    -- artifact tag.
    project = artifacts:tolist()[2]:gsub('%s+<artifactId>', ''):gsub('</artifactId>', '')
    -- set the cache for later
    _NTulaCache[class] = project

    return project
end

function ntula.get_cmd(is_nearest, is_debug)
    local package, class, method = ntula.get_test_subject()
    local project = ntula.get_project(class)
    local test_subject = package..'.'..class
    if is_nearest then
      test_subject = test_subject..'#'..method
    end

    -- TODO: creating the command with a builder pattern, maybe?
    local cmd_opts = { 'test', '-Dtest='..test_subject, '-pl=:'..project }
    if ntula.config.offline then
        table.insert(cmd_opts, '-o')
    end
    if ntula.config.execute then
        table.insert(cmd_opts, "\n")
    end

    local cmd = { 'mvn', unpack(cmd_opts) }
    if is_debug then
        cmd = { 'mvnDebug', unpack(cmd_opts) }
    end

    return table.concat(cmd, ' ')
end

function ntula.test(is_nearest, is_debug)
    -- if the last executed command is not set, assign is.
    if _NTulaLastCmd == '' then
        _NTulaLastCmd = ntula.get_cmd(is_nearest, is_debug)
    end

    if ntula.config.write then
        vim.cmd('write')
    end

    term.sendCommand(ntula.config.term, _NTulaLastCmd)
    term.gotoTerminal(ntula.config.term)
end

function ntula.test_last(is_nearest, is_debug)
    -- don't reset the cached last executed command to rerun it.
    ntula.test(is_nearest, is_debug)
end

function ntula.test_file(is_debug)
    -- reset the last executed command to assign it later.
    _NTulaLastCmd = ''
    ntula.test(false, is_debug)
end

function ntula.test_nearest(is_debug)
    -- reset the last executed command to assign it later.
    _NTulaLastCmd = ''
    ntula.test(true, is_debug)
end

-- TODO: dap should start when mvnDebug is listening on port
function ntula.debug_last()
    ntula.test_last(true)
    -- dap.continue()
end

function ntula.debug_file()
    ntula.test_file(true)
    -- dap.continue()
end

function ntula.debug_nearest()
    ntula.test_nearest(true)
    -- dap.continue()
end

-- setup to override the default config.
function ntula.setup(opts)
    ntula.config.set_config(opts)
end

-- setup if I decide to more this to it's own repo
ntula.setup {
    term = 2,
    execute = true, -- TODO: not sure I like this for debugging
    offline = true,
    write = true,
}






return ntula
