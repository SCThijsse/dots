-- utils

local Iterator = require('plenary.iterators')
local Path = require('plenary.path')
local ts_locals = require('nvim-treesitter.locals')
local ts_parsers = require('nvim-treesitter.parsers')
local ts_query = require('nvim-treesitter.query')
local ts_utils = require('nvim-treesitter.ts_utils')

local CommandBuilder = require('thijssesc.plugins.ntula.command_builder')
local config = require('thijssesc.plugins.ntula.config')

local utils = {}
_NTulaCache = _NTulaCache or {}

local function ts_parse_query(query, nearest_end_row)
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
            table.insert(res, ts_utils.get_node_text(node)[1])
        end)
    end

    return res
end

local function get_test_subject()
    local packages = utils.get_packages()
    local classes = utils.get_classes()
    local methods = utils.get_methods()

    return packages[1], classes[1], methods[#methods]
end

-- based on `require('jdtls.setup').find_root { 'marker1', 'marker2' }`
local function find_root_pom(bufname)
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

local function get_project(class)
    local project = _NTulaCache[class]
    -- check if the cache was hit to return early
    if project ~= nil then
        return project
    end

    local lines = find_root_pom():readlines()
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

function utils.get_packages()
    local query = [[(program (package_declaration (scoped_identifier) @name))]]
    return ts_parse_query(query)
end

function utils.get_classes()
    local query = [[(program (class_declaration (identifier) @name))]]
    return ts_parse_query(query)
end

function utils.get_methods(nearest_end_row)
    -- try to get the nearest method between the first line and the line the
    -- cursor is currently on.
    nearest_end_row = nearest_end_row or vim.fn.line('.')

    -- gets the names of all the methods with an @Test annotation
    local query = [[
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
    local methods = ts_parse_query(query, nearest_end_row)

    -- if no methods are found get the first method.
    if next(methods) == nil then
        methods = ts_parse_query(query)
    end

    -- the results table includes the annotation names so filter them out.
    methods = Iterator.iter(methods):filter(function(o)
        return o ~= 'Test'
    end):tolist()

    return methods
end

function utils.get_cmd(with_debugee, execute_nearest)
    local package, class, method = get_test_subject()
    local project = get_project(class)
    local test_subject = package..'.'..class
    if execute_nearest then
      test_subject = test_subject..'#'..method
    end

    local builder = CommandBuilder:new():with_cmd('mvn')
        :with_opt('test')
        :with_opt('-DforkCount=0')
        :with_opt('-Dtest='..test_subject)
        :with_opt('-pl=:'..project)
    if with_debugee then
        builder:with_cmd('mvnDebug')
    end
    if config.options.offline then
        builder:with_opt('-o')
    end

    return builder:with_opt("\n"):build()
end

return utils
