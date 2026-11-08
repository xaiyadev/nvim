vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- check if there is even an lsp to attach
        if client == nil then
            return
        end

        local opts = { buffer = ev.buf }


        -- enable the inlay_hints
        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

        -- keymaps
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    end
})

local servers = {
    bashls = {},
    cssls = {},
    dockerls = {},
    emmet_language_server = {
        filetypes = {
            "css",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact"
        }
    },

    gopls = {
        single_file_support = true,
        filetypes = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },

        cmd = {
            "gopls", -- share the gopls instance if there is one already

            "-remote.debug=:0",
            "-remote=auto",
        },

        settings = {
            gopls = {
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },

                usePlaceholders = true,
                completeUnimported = true,
                staticcheck = true,
                matcher = "Fuzzy",
                diagnosticsDelay = "500ms",
                symbolMatcher = "fuzzy",
                semanticTokens = true,
            },
        },
    },

    html = {},
    jsonls = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            }
        }
    },
    pyright = {},
    -- stylelint_lsp = {},
    ts_ls = {},
    -- vue_ls = {}, -- maybe check later?
    yamlls = {},

    nil_ls = {
        cmd = { "nil" },
    }

}

for server, config in pairs(servers) do
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end
