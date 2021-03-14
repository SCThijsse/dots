-- lightline

vim.g.lightline = {
    active = {
        left = {
            { 'mode', 'paste' },
            { 'gitbranch', 'readonly', 'filename', 'modified' }
        },
        right = {
            { 'lineinfo' },
            { 'percent' },
            { 'filetype' }
        }
    },
    inactive = {
        right = {
            { 'lineinfo' },
            { 'fileformat', 'fileencoding' }
        }
    },
    component_function = {
        gitbranch = "FugitiveHead"
    }
}
