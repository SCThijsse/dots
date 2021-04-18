-- ntula

local Path = require('plenary.path')
local term = require('harpoon.term')
local ts_locals = require('nvim-treesitter.locals')
local ts_parsers = require('nvim-treesitter.parsers')
local ts_query = require('nvim-treesitter.query')
local ts_utils = require('nvim-treesitter.ts_utils')

local ntula = {}
_NTulaCache = _NTulaCache or {}
_NTulaLastCmd = _NTulaLastCmd or ''

local config = {
    term = 2,
    execute = true,
    offline = true,
}

function config.set_options(opts)
    opts = opts or {}
    for opt, _ in pairs(config) do
        if opts[opt] ~= nil then
            config[opt] = opts[opt]
        end
    end
end

table.filter = function(t, filterIter)
    local out = {}
    for k, v in pairs(t) do
        if filterIter(v, k, t) then
            table.insert(out, v)
        end
    end
    return out
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
    methods = table.filter(methods, function(o)
        return o ~= 'Test'
    end)

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
    local artifacts = table.filter(lines, function(o)
        return string.match(o, '<artifactId>') ~= nil
    end)

    -- assumes <parent> tag has the first <artifactId> tag
    project = artifacts[2]:gsub('%s+<artifactId>', ''):gsub('</artifactId>', '')
    -- set the cache for later
    _NTulaCache[class] = project

    return project
end

function ntula.get_cmd(is_nearest)
    local package, class, method = ntula.get_test_subject()
    local project = ntula.get_project(class)
    local test_subject = package..'.'..class
    if is_nearest then
      test_subject = test_subject..'#'..method
    end

    -- TODO: creating the command with a builder pattern, maybe?
    local cmd = { 'mvn', 'test', '-Dtest='..test_subject, '-pl=:'..project }
    if config.offline then
        table.insert(cmd, '-o')
    end
    if config.execute then
        table.insert(cmd, "\n")
    end

    return table.concat(cmd, ' ')
end

function ntula.test(is_nearest)
    -- if the last executed command is not set, assign is.
    if _NTulaLastCmd == '' then
        _NTulaLastCmd = ntula.get_cmd(is_nearest)
    end

    term.sendCommand(config.term, _NTulaLastCmd)
    term.gotoTerminal(config.term)
end

function ntula.test_last()
    -- don't reset the cached last executed command to rerun it.
    ntula.test()
end

function ntula.test_file()
    -- reset the last executed command to assign it later.
    _NTulaLastCmd = ''
    ntula.test()
end

function ntula.test_nearest()
    -- reset the last executed command to assign it later.
    _NTulaLastCmd = ''
    ntula.test(true)
end

function ntula.setup(opts)
    config.set_options(opts)
end

function ntula.foo()
    -- gets the names of all the methods with an @Test annotation
    local methods_query = [[
      (program
        (class_declaration
          (identifier)
          (class_body
            (method_declaration
              (modifiers (marker_annotation (identifier) @annotation (#eq? @annotation "Test")))
              (identifier) @name))))
    ]]

    local res = ntula.ts_parse_query(methods_query)
    print(vim.inspect(res))
end

-- setup if I decide to more this to it's own repo
ntula.setup {
    term = 2,
    execute = true,
    offline = true,
}

return ntula
