return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                rust = { "rustfmt" },
                jsonc = { "prettier" },
                arduino = { "clang_format" },
                java = { "clang_format" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },
}
