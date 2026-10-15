require('neo-tree').setup({
    close_if_last_window = true,

    event_handlers = {
        {
            event = "file_opened", -- close neo-tree once a file has been selected
            handler = function() vim.cmd("Neotree close") end,
        },
    },

    pupup_border_style = "",
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_ignored = false,
        },

        follow_current_file = {
            enabled = true,
            leave_dirs_open = true
        },
    },
})

-- TODO: find out how to manage keymaps
vim.keymap.set({ "n" }, "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle tree view" })
