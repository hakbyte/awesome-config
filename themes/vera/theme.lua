---------------------------
-- Awesome Theme
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. "themes/vera/"

local theme = {}

--
-- Font
--

theme.font           = "SF Pro Text Semibold 11"

--
-- Theme colors
--

theme.bg_normal      = "#f5f6fa"
theme.bg_focus       = "#f5f6fa"
theme.bg_urgent      = "#f5f6fa"
theme.bg_minimize    = "#f5f6fa"
theme.bg_systray     = theme.bg_normal
theme.bg_normal_dark = "#262729BB"
theme.bg_focus_dark  = "#262729BB"
theme.bg_urgent_dark = "#262729BB"

theme.fg_normal_dark = "#dadbde"
theme.fg_focus_dark  = "#ffffff"
theme.fg_urgent      = "#dadbde"
theme.fg_minimize    = "#dadbde"
theme.fg_normal      = "#252525"
theme.fg_focus       = "#000000"

theme.border_width   = dpi(3)
theme.border_focus   = "#f5f6fa"
theme.border_normal  = "#f5f6fa"
theme.border_marked  = "#91231c"

theme.separator      = "#dadbde"
theme.useless_gap    = dpi(6)

--
-- Taglist
--

theme.taglist_bg_focus = "#ff0000"

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

theme.menu_submenu      = "" -- right arrow key (U+F0DA)
theme.menu_height       = dpi(24)
theme.menu_font         = "SF Pro Text Regular 12"
theme.menu_border_width = dpi(0)
theme.menu_width        = dpi(140)

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

--
-- Awesome icon
--

theme.awesome_icon = nil

--
-- Application icon
-- If not set then icons from /usr/share/icons and /usr/share/icons/hicolor will be used.
--

theme.icon_theme = nil

return theme
