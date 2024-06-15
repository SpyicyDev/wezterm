local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "catppuccin-mocha"

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "MesloLGS NF",
})
config.font_size = 15.5

config.window_padding = {
    left = 0,
    right = 0,
    top = 80,
    bottom = 0,
}

config.default_prog = { "/usr/bin/tmux", "new-session", "-A", "-s", "main" }

config.scrollback_lines = 0

config.keys = {
    {
        key = "t",
        mods = "ALT",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "c" }
        }
    },

    {
        key = "T",
        mods = "ALT",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "c", mods = "CTRL" },
        }
    },


    {
        key = "w",
        mods = "ALT",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "x" },
        },
    },

    {
        key = "W",
        mods = "ALT",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "l", mods = "CTRL" },
        }
    },

}

for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = tostring(i) }
        }
    })
end

return config
