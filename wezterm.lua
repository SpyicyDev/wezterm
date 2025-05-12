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
config.font_size = 14.5

config.window_padding = {
    left = 0,
    right = 0,
    top = 0, -- was 80
    bottom = 0,
}

config.default_prog = { "/opt/homebrew/bin/tmux", "new-session", "-A", "-s", "main" }

config.native_macos_fullscreen_mode = false
config.macos_fullscreen_extend_behind_notch = true

config.window_close_confirmation = 'NeverPrompt'

config.scrollback_lines = 0

config.keys = {
    {
        key = "t",
        mods = "CMD",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "c" }
        }
    },

    {
        key = "T",
        mods = "CMD",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "c", mods = "CTRL" },
        }
    },


    {
        key = "w",
        mods = "CMD",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "x" },
        },
    },

    {
        key = "W",
        mods = "CMD",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = "l", mods = "CTRL" },
        }
    },

}

for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "CMD",
        action = wezterm.action.Multiple {
            wezterm.action.SendKey { key = "s", mods = "CTRL" },
            wezterm.action.SendKey { key = tostring(i) }
        }
    })
end

return config
