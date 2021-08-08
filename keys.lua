local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")

mod = "Mod4"
keys = {}

keys.global = gears.table.join({
    awful.key(
        {mod}, "s",
        hotkeys_popup.show_help,
        {description="show help", group="awesome"}
    ),
    awful.key(
        {mod}, "Left",
        awful.tag.viewprev,
        {description = "view previous", group = "tag"}
    ),
    awful.key(
        {mod}, "Right",
        awful.tag.viewnext,
        {description = "view next", group = "tag"}
    ),
    awful.key(
        {mod}, "Escape",
        awful.tag.history.restore,
        {description = "go back", group = "tag"}
    ),
    awful.key(
        { mod}, "j",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key(
        {mod}, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key(
        {mod}, "w",
        function ()
            mymainmenu:show()
        end,
        {description = "show main menu", group = "awesome"}
    ),

    -- Layout manipulation
    awful.key(
        {mod, "Shift"}, "j",
        function ()
            awful.client.swap.byidx(1)
        end,
        {description = "swap with next client by index", group = "client"}
    ),
    awful.key(
        {mod, "Shift"}, "k",
        function ()
            awful.client.swap.byidx(-1)
        end,
        {description = "swap with previous client by index", group = "client"}
    ),
    awful.key(
        {mod, "Control"}, "j",
        function ()
            awful.screen.focus_relative(1)
        end,
        {description = "focus the next screen", group = "screen"}
    ),
    awful.key(
        {mod, "Control"}, "k",
        function ()
            awful.screen.focus_relative(-1)
        end,
        {description = "focus the previous screen", group = "screen"}
    ),
    awful.key(
        {mod}, "u",
        awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}
    ),
    awful.key(
        {mod}, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}
    ),

    -- Standard program
    awful.key(
        {mod}, "Return",
        function ()
            awful.spawn(terminal)
        end,
        {description = "open a terminal", group = "launcher"}
    ),
    awful.key(
        {mod, "Control"}, "r",
        awesome.restart,
        {description = "reload awesome", group = "awesome"}
    ),
    awful.key({ mod, "Shift"   }, "q", awesome.quit,
    {description = "quit awesome", group = "awesome"}),

    -- Layout manipulation
    awful.key(
        {mod}, "l",
        function ()
            awful.tag.incmwfact(0.05)
        end,
        {description = "increase master width factor", group = "layout"}
    ),
    awful.key(
        {mod}, "h",
        function ()
            awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}
    ),
    awful.key(
        {mod, "Shift"}, "h",
        function ()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = "increase the number of master clients", group = "layout"}
    ),
    awful.key(
        {mod, "Shift"}, "l",
        function ()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = "decrease the number of master clients", group = "layout"}
    ),
    awful.key(
        {mod, "Control"}, "h",
        function ()
            awful.tag.incncol(1, nil, true)
        end,
        {description = "increase the number of columns", group = "layout"}
    ),
    awful.key(
        {mod, "Control"}, "l",
        function ()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = "decrease the number of columns", group = "layout"}
    ),
    awful.key(
        {mod}, "space",
        function ()
            awful.layout.inc( 1)
        end,
        {description = "select next", group = "layout"}
    ),
    awful.key(
        {mod, "Shift"}, "space",
        function ()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}
    ),
    awful.key(
        {mod, "Control"}, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
            end
        end,
        {description = "restore minimized", group = "client"}),

    -- Powermenu
    awful.key(
        {mod, "Control"}, "p",
        function ()
            awful.spawn.with_shell("~/.config/awesome/scripts/powermenu.sh")
        end,
        {description = "launch powermenu ", group = "launcher"}
    ),

    -- Prompt
    awful.key(
        {mod}, "r",
        function ()
            awful.screen.focused().mypromptbox:run()
        end,
        {description = "run prompt", group = "launcher"}
    ),
    awful.key(
        {mod}, "d",
        function ()
            awful.spawn.with_shell("~/.config/awesome/scripts/launcher.sh")
        end,
        {description = "run rofi launcher", group = "launcher"}
    ),
    awful.key(
        {mod}, "x",
        function ()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {description = "lua execute prompt", group = "awesome"}
    ),

    -- Volume controls
    awful.key(
        {}, "XF86AudioRaiseVolume",
        function ()
            awful.spawn.with_shell("pamixer --increase 2")
        end,
        {description = "Increase volume", group = "media"}
    ),
    awful.key(
        {}, "XF86AudioLowerVolume",
        function ()
            awful.spawn.with_shell("pamixer --decrease 2")
        end,
        {description = "Decrease volume", group = "media"}
    ),
    awful.key(
        {}, "XF86AudioMute",
        function ()
            awful.spawn.with_shell("pamixer --toggle-mute")
        end,
        {description = "Toggle volume (mute/unmute)", group = "media"}
    )
})

keys.client = gears.table.join({
    awful.key(
        {mod}, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}
    ),

    awful.key(
        {mod, "Shift"}, "c",
        function (c)
            c:kill()
        end,
        {description = "close", group = "client"}
    ),
    awful.key(
        {mod, "Control"}, "space",
        awful.client.floating.toggle,
        {description = "toggle floating", group = "client"}
    ),
    awful.key(
        {mod, "Control"}, "Return",
        function (c)
            c:swap(awful.client.getmaster())
        end,
        {description = "move to master", group = "client"}
    ),
    awful.key(
        {mod}, "o",
        function (c)
            c:move_to_screen()
        end,
        {description = "move to screen", group = "client"}
    ),
    awful.key(
        {mod}, "t",
        function (c)
            c.ontop = not c.ontop
        end,
        {description = "toggle keep on top", group = "client"}
    ),
    awful.key(
        {mod}, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        {description = "minimize", group = "client"}
    ),
    awful.key(
        {mod}, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}
    ),
    awful.key(
        {mod, "Control"}, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}
    ),
    awful.key(
        {mod, "Shift"}, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"}
    )
})

return keys