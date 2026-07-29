local wezterm = require("wezterm")
local config = {
    colors = {
        ansi = {
            "#473738",
            "#c98282",
            "#7fa88a",
            "#c8b878",
            "#7f9bb8",
            "#a88aa8",
            "#7fa8a0",
            "#818f7f",
        },

        brights = {
            "#5c4a4b",
            "#e09a9a",
            "#9bc49f",
            "#e0d08a",
            "#9bb8d8",
            "#c8a8c8",
            "#9bc8c0",
            "#aab8a8",
        },
    },
}

config.enable_tab_bar = false
config.window_background_opacity = 0.65

return config
