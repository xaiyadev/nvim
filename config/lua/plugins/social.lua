-- check if cord exists (only installed if 'withCord' nix variable is set to true)
local ok, cord = pcall(require, 'cord')
if not ok then return end

-- cord configuration
cord.setup({
    editor = {
        icon = "https://raw.githubusercontent.com/IogaMaster/neovim/main/.github/assets/nixvim-dark.webp";
    }
})

