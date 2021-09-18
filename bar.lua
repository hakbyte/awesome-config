-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Widget and layout library
local wibox = require("wibox")

-- Widgets
local volumebar = require("widget.volumebar")

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button(
        {}, 1,
        function(t)
            t:view_only()
        end
    ),
    awful.button(
        {modkey}, 1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button(
        {}, 3,
        awful.tag.viewtoggle
    ),
    awful.button(
        {modkey}, 3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    awful.button(
        {}, 4,
        function(t)
            awful.tag.viewnext(t.screen)
        end
    ),
    awful.button(
        {}, 5,
        function(t)
            awful.tag.viewprev(t.screen)
        end
    )
)

-- Create systray widget
local mysystray = wibox.widget.systray()
mysystray:set_base_size(beautiful.systray_icon_size)

local systray_margin = (beautiful.wibar_height-beautiful.systray_icon_size)/2

local systray_container = {
    mysystray,
    top = systray_margin,
    bottom = systray_margin,
    widget = wibox.container.margin
}

awful.screen.connect_for_each_screen(
    function(s)
        -- Each screen has its own tag table.
        awful.tag({"1", "2", "3", "4", "5"}, s, awful.layout.layouts[1])

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()
        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(
            gears.table.join(
                awful.button(
                    {}, 1,
                    function ()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {}, 3,
                    function ()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button(
                    {}, 4,
                    function ()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {}, 5,
                    function ()
                        awful.layout.inc(-1)
                    end
                )
            )
        )
        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = taglist_buttons
        }

        -- Create the wibox
        s.mywibox = awful.wibar({
            position = "top",
            screen = s,
            height = beautiful.wibar_height
        })

        -- Add widgets to the wibox
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            {
                {
                    -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    s.mytaglist,
                    s.mypromptbox
                },
                left = beautiful.wibar_margin,
                widget = wibox.container.margin
            },
            {
                { -- Middle
                    align = "center",
                    widget = mytextclock,
                },
                layout  = wibox.layout.flex.horizontal
            },
            {
                {
                    -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    spacing = beautiful.wibar_spacing,
                    volumebar({
                        main_color = "#af13f7",
                        mute_color = "#7f7f7f7f",
                        bg_color = "#c1c7c97f",
                        width = beautiful.widget_volumebar_width,
                        shape = "rounded_bar",
                        margins = (beautiful.wibar_height-beautiful.widget_volumebar_height)/2,
                    }),
                    systray_container,
                    s.mylayoutbox
                },
                right = beautiful.wibar_margin,
                widget = wibox.container.margin
            }
        }
    end
)
