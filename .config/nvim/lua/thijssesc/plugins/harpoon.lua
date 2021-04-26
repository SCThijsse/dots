-- harpoon

local harpoon = require('harpoon')
local mark = require('harpoon.mark')
local term = require('harpoon.term')
local ui = require('harpoon.ui')
local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap

local projects = {}
for _, v in pairs({ 1, 2, 3, 4, 5 }) do
    projects['$PROJECT'..v] = {
        term = {
            cmds = {
                "mvn clean install -Dmaven.javadoc.skip -Dmaven.test.skip\n",
                "mvn clean install -Ptest-content -Dmaven.javadoc.skip -Dmaven.test.skip && mvn -Pcargo.run -Drepo.path=./storage\n",
            },
        },
    }
end

harpoon.setup {
    global_settings = {
        save_on_toggle = true,
        save_on_change = true,
    },
    projects = projects,
}

nnoremap { '<C-n>', mark.add_file }
nnoremap { '<C-t>', ui.toggle_quick_menu }
nnoremap { '<C-q>', mark.rm_file }

nnoremap { '<leader>tt', function() term.gotoTerminal(1) end }
nnoremap { '<leader>tr', function() term.gotoTerminal(2) end }
nnoremap { '<leader>te', function() term.gotoTerminal(3) end }
nnoremap { '<leader>s1', function() term.sendCommand(1, 1) end  }
nnoremap { '<leader>s2', function() term.sendCommand(1, 2) end  }
nnoremap { '<leader>hh', function() ui.nav_file(1) end }
nnoremap { '<leader>jj', function() ui.nav_file(2) end }
nnoremap { '<leader>kk', function() ui.nav_file(3) end }
nnoremap { '<leader>ll', function() ui.nav_file(4) end }

