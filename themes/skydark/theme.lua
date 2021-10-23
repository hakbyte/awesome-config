local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local theme_path = "~/.config/awesome/themes/skydark/"

local theme = {}
--local wibar = require("wibar")
theme.nord0  = "#2E3440"
theme.nord1  = "#3B4252"
theme.nord2  = "#434C5E"
theme.nord3  = "#4C566A"
theme.nord4  = "#D8DEE9"
theme.nord5  = "#E5E9F0"
theme.nord6  = "#ECEFF4"
theme.nord7  = "#8FBCBB"
theme.nord8  = "#88C0D0"
theme.nord9  = "#81A1C1"
theme.nord10 = "#5E81AC"
theme.nord11 = "#BF616A"
theme.nord12 = "#D08770"
theme.nord13 = "#EBCB8B"
theme.nord14 = "#A3BE8C"
theme.nord15 = "#B48EAD"

theme.font          = "SF Pro Text Semibold 11"
theme.transparent   = "#00000000"

theme.bg_normal     = theme.nord0
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.nord4
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal

theme.useless_gap   = dpi(6)
theme.border_width  = dpi(3)
theme.border_focus  = theme.bg_normal
theme.border_normal = theme.bg_normal
theme.border_marked = theme.nord11

theme.tasklist_bg_focus        = theme.nord0
theme.tasklist_icon_size       = dpi(5)
theme.tasklist_plain_task_name = true
theme.taglist_spacing          = dpi(5)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

--
-- Awesome menu
--

theme.menu_submenu_icon = theme_path .. "submenu.png"
theme.menu_height       = dpi(24)
theme.menu_font         = "SF Pro Text Regular 12"
theme.menu_border_width = dpi(0)
theme.menu_width        = dpi(140)

theme.wallpaper   = theme_path .. "wallpaper.jpg"
theme.background  = theme.nord0

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

theme.icon_theme = nil

theme.taglist_text_font     = "JetBrains Mono 20"
theme.taglist_text_empty    = {"", "", "", "", "", "", "", "", ""}
theme.taglist_text_occupied = {"", "", "", "", "", "", "", "", ""}
theme.taglist_text_focused  = {"", "", "", "", "", "", "", "", ""}
theme.taglist_text_urgent   = {"", "", "", "", "", "", "", "", ""}

-- theme.taglist_font = "Roboto 12"
theme.taglist_bg_focus    = theme.bg_normal
theme.taglist_fg_focus    = theme.nord13
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_fg_occupied = theme.nord14
theme.taglist_bg_empty    = theme.bg_normal
theme.taglist_fg_empty    = theme.nord9
theme.taglist_bg_urgent   = theme.bg_normal
theme.taglist_fg_urgent   = theme.nord11

--
-- Wibar
--

theme.wibar_height      = dpi(35)
theme.wibar_margin      = dpi(10)
theme.wibar_spacing     = dpi(10)
theme.systray_icon_size = dpi(28)

--
-- Widgets
--

theme.widget_volumebar_height = 7
theme.widget_volumebar_width  = 80

--
-- Titlebar buttons
--

theme.titlebar_close_button_normal              = theme_path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme_path .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal           = theme_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme_path .. "titlebar/minimize_focus.png"

theme.titlebar_maximized_button_normal_active   = theme_path .. "titlebar/maximized_normal.png"
theme.titlebar_maximized_button_normal_inactive = theme_path .. "titlebar/maximized_normal.png"
theme.titlebar_maximized_button_focus_active    = theme_path .. "titlebar/maximized_focus.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path .. "titlebar/maximized_focus.png"

theme.titlebar_ontop_button_normal_inactive     = theme_path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme_path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = theme_path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme_path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = theme_path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme_path .. "titlebar/floating_focus_active.png"

--
-- Layout icons
--

theme.layout_fairh      = theme_path.."layouts/fairhw.png"
theme.layout_fairv      = theme_path.."layouts/fairvw.png"
theme.layout_floating   = theme_path.."layouts/floatingw.png"
theme.layout_magnifier  = theme_path.."layouts/magnifierw.png"
theme.layout_max        = theme_path.."layouts/maxw.png"
theme.layout_fullscreen = theme_path.."layouts/fullscreenw.png"
theme.layout_tilebottom = theme_path.."layouts/tilebottomw.png"
theme.layout_tileleft   = theme_path.."layouts/tileleftw.png"
theme.layout_tile       = theme_path.."layouts/tilew.png"
theme.layout_tiletop    = theme_path.."layouts/tiletopw.png"
theme.layout_spiral     = theme_path.."layouts/spiralw.png"
theme.layout_dwindle    = theme_path.."layouts/dwindlew.png"
theme.layout_cornernw   = theme_path.."layouts/cornernww.png"
theme.layout_cornerne   = theme_path.."layouts/cornernew.png"
theme.layout_cornersw   = theme_path.."layouts/cornersww.png"
theme.layout_cornerse   = theme_path.."layouts/cornersew.png"

return theme
