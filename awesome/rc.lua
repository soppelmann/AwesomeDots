--       █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗
--      ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝
--      ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗
--      ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝
--      ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗
--      ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Import theme
local xresources = require("beautiful.xresources")
local beautiful = require("beautiful")
local dpi = xresources.apply_dpi
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- Import Keybinds
local keys = require("keys")
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

-- Import rules
local create_rules = require("rules").create
awful.rules.rules = create_rules(keys.clientkeys, keys.clientbuttons)

-- Notification library
require("components.notifications")

-- Import Tag Settings
local tags = require("tags")

-- Volume widget
volume_widget = require("awesome-wm-widgets.volume-widget.volume")
volume_widget_widget = volume_widget({display_notification = true})

-- CPU widget
cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")

-- Battery
batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")

-- Brightness
brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")

-- Keyboard
mykeyboardlayout = awful.widget.keyboardlayout()

-- Import components
require("components.wallpaper")
require("components.exit-screen")
require("components.volume-adjust")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Autostart specified apps
local apps = require("apps")
apps.autostart()

-- ===================================================================
-- Set Up Screen & Connect Signals
-- ===================================================================

-- Define tag layouts
awful.layout.layouts = {
   awful.layout.suit.tile,
--   awful.layout.suit.floating,
   awful.layout.suit.magnifier,
}

-- Set up each screen
local top_panel = require("components.top-panel")


awful.screen.connect_for_each_screen(function (s)
    for i, tag in pairs(tags) do
        awful.tag.add(i, {
            icon = tag.icon,
            icon_only = true,
            layout = awful.layout.suit.tile,
            screen = s,
            selected = i == 1
        })
    end
    s.mylayoutbox = awful.widget.layoutbox(s)
	-- Add the top panel to the screen
    top_panel.create(s)

    --decrease useless gap size near the borders of the screen
    s.padding = {
    --    left = dpi(-3),
    --    right = dpi(-4),
    --    top = dpi(-4),
        bottom = dpi(-0.4)
    }
end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the window as a slave (put it at the end of others instead of setting it as master)
    if not awesome.startup then
        awful.client.setslave(c)
    end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Autofocus a new client when previously focused one is closed
require("awful.autofocus")

-- Focus clients under mouse
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

-- broken

--Remove borders when window is maximized
--screen.connect_signal("arrange", function (s)
    --local max = s.selected_tag.layout.name == "max"
    --local only_one = #s.tiled_clients == 1 -- use tiled_clients so that other floating windows don't affect the count
    ---- but iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
    --for _, c in pairs(s.clients) do
        --if (max or only_one) and not c.floating or c.maximized then
            --c.border_width = 0
        --else
            --c.border_width = beautiful.border_width
        --end
    --end
--end)

local menubar = require("menubar")
-- Appmenu/
local appmenu = require("appmenu")

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "applications", appmenu.Appmenu },
                                    { "open terminal", terminal }
                                  }
                        })


mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu,
									 width = 500, })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}


local nice = require("nice")
nice {
 --   titlebar_radius	= 12,
    win_shade_enabled = false,
    no_titlebar_maximized = true,
    titlebar_color = "#00ff00",
    ontop_color = "#A991F1",
    sticky_color = "#61AFEF",
    
    -- You only need to pass the parameter you are changing
    context_menu_theme = {
        width = 300, 
    },
    
    titlebar_items = {
    left = {"close", "minimize", "maximize"},
    middle = "title",
    right = {"sticky", "ontop"},
	},
    -- Swap the designated buttons for resizing, and opening the context menu
    mb_resize = nice.MB_MIDDLE,
    mb_contextmenu = nice.MB_RIGHT,
}

client.connect_signal("property::floating", function(c)
    local b = false;
    if c.first_tag ~= nil then
        b = c.first_tag.layout.name == "floating"
    end
    if c.floating or b then
        awful.titlebar.show(c)
    else
        awful.titlebar.hide(c)
    end
end)

client.connect_signal("manage", function(c)
    if c.floating or c.first_tag.layout.name == "floating" then
        awful.titlebar.show(c)
    else
        awful.titlebar.hide(c)
    end
end)

tag.connect_signal("property::layout", function(t)
    local clients = t:clients()
    for k,c in pairs(clients) do
        if c.floating or c.first_tag.layout.name == "floating" then
            awful.titlebar.show(c)
        else
            awful.titlebar.hide(c)
        end
    end
end)

--awful.spawn("xrandr --output eDP1 --primary --mode 2400x1600 --pos 0x1080 --rotate normal --output DP1 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off")

-- ===================================================================
-- Garbage collection (allows for lower memory consumption)
-- ===================================================================

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
