-- check if current profile is not set to blmedia
local account = require('config/account')
if account.is_blmedia() then return end

local ok, cord = pcall(require, 'cord')
if not ok then return end

-- cord configuration
cord.setup({
    editor = {
        icon = "https://raw.githubusercontent.com/IogaMaster/neovim/main/.github/assets/nixvim-dark.webp";
    }
})

