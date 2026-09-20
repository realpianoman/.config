local function latexify()
    local start_row = vim.fn.line("'<") - 1
    local end_row = vim.fn.line("'>")

    local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row, false)

    for i, line in ipairs(lines) do
        -- Greek letters
        local replacements = {
            { "alpha", "\\alpha" },
            { "beta", "\\beta" },
            { "gamma", "\\gamma" },
            { "delta", "\\delta" },
            { "epsilon", "\\epsilon" },
            { "theta", "\\theta" },
            { "lambda", "\\lambda" },
            { "mu", "\\mu" },
            { "pi", "\\pi" },
            { "sigma", "\\sigma" },
            { "phi", "\\phi" },
            { "psi", "\\psi" },
            { "omega", "\\omega" },

            -- Relations
            { "<=", "\\leq" },
            { ">=", "\\geq" },
            { "!=", "\\neq" },
            { "->", "\\to" },
            { "=>", "\\Rightarrow" },

            -- Operators
            { "in", "\\in" },
            { "*", "\\cdot" },
            { "forall", "\\forall" },
            { "exists", "\\exists" },
            { "infty", "\\infty" },

            -- Functions
            { "sin", "\\sin" },
            { "cos", "\\cos" },
            { "tan", "\\tan" },
            { "log", "\\log" },
            { "ln", "\\ln" },
        }

        for _, pair in ipairs(replacements) do
            line = line:gsub(pair[1], pair[2])
        end

        -- sqrt(x) -> \sqrt{x}
        line = line:gsub("sqrt%((.-)%)", "\\sqrt{%1}")

        -- x^2 -> x^{2}
        line = line:gsub("([%w%)%]])^([%w]+)", "%1^{%2}")

        -- x_1 -> x_{1}
        line = line:gsub("([%w%)%]])_([%w]+)", "%1_{%2}")

        -- Add line break
        line = line:gsub("%s+$", "")

        if not line:match("\\\\$") then
            line = line .. " \\\\"
        end

        lines[i] = line
    end

    vim.api.nvim_buf_set_lines(0, start_row, end_row, false, lines)
end

vim.keymap.set("v", "<leader>ll", latexify, {
    desc = "Convert visual selection to LaTeX",
})
