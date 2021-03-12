--      ████████╗ ██████╗ ██████╗     ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--         ██║   ██║   ██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--         ██║   ██║   ██║██╔═══╝     ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--         ██║   ╚██████╔╝██║         ██║     ██║  ██║██║ ╚████║███████╗███████╗
--         ╚═╝    ╚═════╝ ╚═╝         ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local screen = awful.screen.focused()


-- import widgets
local task_list = require("widgets.task-list")
local tag_list = require('widgets.tag-list')
local vseparator = require("widgets.vertical-separator")
local battery = require('widgets.battery')
local layout_box = require("widgets.layout-box")
local calendar = require("widgets.calendar")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

-- define module table
local top_panel = {}


--create separator
wibox.widget {
    separator = wibox.widget.separator
}

local taskbarWidth = screen.geometry.width / 25 * 17

-- ===================================================================
-- Bar Creation
-- ===================================================================

top_panel.create = function(s)
   local panel = awful.wibar({
      bg = "#262A32",
      --bg = "#00000000",
      --border_width = 0,
      border_width = 3,
      border_color = "#262A32",
      --border_color = "#00000000",
      screen = s,
      position = "top",
      --shape = gears.shape.rounded_bar,
      --shape = gears.shape.rounded_bar,
      height = beautiful.top_panel_height,
      width = s.geometry.width,
   })

   panel:setup {
      expand = "none",
      layout = wibox.layout.align.horizontal,
      {
         layout = wibox.layout.fixed.horizontal,
         vseparator,
         tag_list.create(s),
         vseparator,
         wibox.container.constraint (task_list.create(s), 'max', taskbarWidth, dpi(28)),
      },
         separator,
      {
         layout = wibox.layout.fixed.horizontal,
         {
               	wibox.layout.margin(wibox.widget.systray(true), 8, 8, 5, 5),
              	shape = gears.shape.rounded_bar,
               	bg = "#262A32",
              	widget = wibox.container.background
         },
	 vseparator,
         {
		wibox.layout.margin(cpu_widget({
		enable_kill_button = true, }), 12, 12, 2, 2),
               	shape = gears.shape.rounded_bar,
              	bg = "#262A32",
               	widget = wibox.container.background
         },
	 vseparator,
         {
		wibox.layout.margin(batteryarc_widget({
            	show_current_level = true,
            	}), 12, 12, 2, 2),
               	shape = gears.shape.rounded_bar,
              	bg = "#262A32",
               	widget = wibox.container.background
         },
	 vseparator,
         {
		wibox.layout.margin(brightness_widget{
         	   type = 'icon_and_text',
         	   program = 'xbacklight',
         	   step = 1,        
        	}, 8, 8, 5, 5),
               	shape = gears.shape.rounded_bar,
              	bg = "#262A32",
               	widget = wibox.container.background
         },
        
		vseparator,
         {
		     volume_widget_widget,
             shape = gears.shape.rounded_bar,
             bg = "#262A3",
             widget = wibox.container.background
         },
         vseparator,
         {
		wibox.layout.margin(mykeyboardlayout,  8, 8, 3, 3),
               	shape = gears.shape.rounded_bar,
              	bg = "#262A32",
               	widget = wibox.container.background
         },
         vseparator,
         {
               	s.mylayoutbox,
               	shape = gears.shape.rounded_bar,
               	bg = "#262A32",
               	widget = wibox.container.background
         },
         vseparator,
         {
               	calendar,
               	shape = gears.shape.rounded_bar,
               	bg = "#262A32",
               	shape_clip = true,
               	widget = wibox.container.background
         },
         vseparator,

      }
   }
end

return top_panel
