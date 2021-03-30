-- dap

local dap = require('dap')
local variables = require('dap.ui.variables')
local launchjs = require('dap.ext.vscode')
local utils = require('utils')

local nnoremap = utils.keymap.nnoremap

launchjs.load_launchjs()

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.getenv('HOME')..'/Software/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    skipFiles = { '<node_internals>/**' },
  },
}
dap.configurations.typescript = vim.tbl_extend('force', {
    outFiles = { '${workspaceFolder}/build/**/*.js' },
}, dap.configurations.javascript)
dap.configurations.typescript = dap.configurations.typescript

nnoremap { '<leader>dc', dap.continue }
nnoremap { '<leader>dd', dap.down }
nnoremap { '<leader>dg', dap.goto_ }
nnoremap { '<leader>dh', variables.hover }
nnoremap { '<leader>di', dap.step_into }
nnoremap { '<leader>do', dap.step_out }
nnoremap { '<leader>dO', dap.step_over }
nnoremap { '<leader>dr', function() dap.repl.toggle({}, 'vsplit') end }
nnoremap { '<leader>ds', variables.scopes }
nnoremap { '<leader>dt', dap.toggle_breakpoint }
nnoremap { '<leader>du', dap.up }

