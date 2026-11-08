require('blink.cmp').setup({
    keymap = {
        ["<tab>"] = {
            "select_and_accept",
            "snippet_forward",
            "fallback",
        },

        ["<down>"] = { "select_next", "fallback" },
        ["<up>"] = { "select_prev", "fallback" },
    },

    appearance = {},

    signature = { enabled = true },

    completion = {
        ghost_text = { enabled = true },
        list = {
            cycle = {
                from_top = false,
                from_bottom = false,
            },
        },

        menu = {
            scrolloff = 0,
            border = "none",
            draw = {
                padding = 1,
                gap = 1,
                treesitter = { "buffer", "lsp" },
            },
        },
    },

    sources = { default = { "lsp", "path", "snippets", "buffer" } },

})

--  TODO: put in own files?
require('trouble').setup({ })
require('diffview').setup({ })
