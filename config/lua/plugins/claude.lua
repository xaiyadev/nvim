local account = require('config/account')

require('claudecode').setup({
    terminal = {
        split_side = "right",
        split_width_percentage = 0.35,

        cwd_provider = function(_)
            if account.is_blmedia() then
                return "~/documents/development"
            end
        end,
    },

    diff_opts = {
        open_in_new_tab = true,
    },
})

vim.keymap.set("n", "<leader>c", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })
