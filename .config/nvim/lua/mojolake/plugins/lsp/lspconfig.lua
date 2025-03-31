-- return {}
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true},
    },
    config = function()

        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = { noremap = true, silent = true }

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show LSP references"
            vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Go to declaration"
            vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

            opts.desc = "Show LSP definitions"
            vim.keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", opts)

            opts.desc = "See available code actions"
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "Show buffer diagnostics"
            vim.keymap.set("n", "<leader>y", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            opts.desc = "Show documentation for what is under cursor"
            vim.keymap.set("n", "<leader>boc", vim.lsp.buf.hover, opts)


        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "i " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign"
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["jdtls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- lspconfig["clangd"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        lspconfig["basedpyright"].setup({
            capabilities = capabilities,
            -- on_attach = on_attach,
            settings = {
                basedpyright = {
                    typeCheckingMode = "standard",
                },
            },
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,

            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        }
                    }
                }
            }
        })

        lspconfig["ts_ls"].setup({
            settings = {
                jsx = "react",
            },
        })

    end,
}
