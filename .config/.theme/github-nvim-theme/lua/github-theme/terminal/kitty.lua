local palette = require('github-theme.palette')
local util = require('github-theme.util')

---Generate github theme for kitty terminal.
---@param cfg gt.ConfigSchema
return function(cfg)
  local colors = palette.get_palette(cfg.theme_style)

  local kitty = util.template(
    [[
# github colors for Kitty

background ${bg}
foreground ${fg_term}
selection_background ${bg_visual_selection}
selection_foreground ${fg_term}
url_color ${fg_term}
cursor ${cursor}
cursor_text_color background

# Tabs
active_tab_background ${blue}
active_tab_foreground ${bg2}
inactive_tab_background ${fg_dark}
inactive_tab_foreground ${bg2}

# Windows Border
active_border_color ${bg_visual}
inactive_border_color ${bg_visual}

# normal
color0 ${black}
color1 ${red}
color2 ${green}
color3 ${yellow}
color4 ${blue}
color5 ${magenta}
color6 ${cyan}
color7 ${white}

# bright
color8 ${bright_black}
color9 ${bright_red}
color10 ${bright_green}
color11 ${bright_yellow}
color12 ${bright_blue}
color13 ${bright_magenta}
color14 ${bright_cyan}
color15 ${bright_white}

# extended colors
color16 ${bright_yellow}
color17 ${bright_red}
]],
    colors
  )
  return kitty
end
