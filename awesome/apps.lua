--       █████╗ ██████╗ ██████╗ ███████╗
--      ██╔══██╗██╔══██╗██╔══██╗██╔════╝
--      ███████║██████╔╝██████╔╝███████╗
--      ██╔══██║██╔═══╝ ██╔═══╝ ╚════██║
--      ██║  ██║██║     ██║     ███████║
--      ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝


-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require('awful')
local filesystem = require('gears.filesystem')

-- define module table
local apps = {}


-- ===================================================================
-- App Declarations
-- ===================================================================


apps.default = {
    terminal = "alacritty",
    --launcher = "rofi -modi drun -show drun",
    launcher = "rofi -combi-modi window,drun -modi combi -show combi -config ~/.config/rofi/config.rasi -no-fixed-num-lines -display-window '' -display-drun '' -sort fzf -levenshstein-sort -lines 7 -run-command '/bin/zsh -c -i {cmd}'",
    lock = "slock",
    screenshot = "gnome-screenshot",
    filebrowser = "thunar",
    browser = "firefox",
    editor = "nvim"
}

-- List of apps to start once on start-up
local run_on_start_up = {
    "picom --refresh-rate 60 -G -C --use-damage",
   "redshift -l 59:18",
   "unclutter",
   "sleep 2; feh --bg-fill ~/.wallpaper.jpg",
   "cmst -m",
   "setxkbmap -option grp:rctrl_rshift_toggle gb,se",
   "unclutter --timeout 3 --jitter 20",
   "xbacklight -set 40",
   "xfce4-power-manager --restart",
   "thunar --daemon",
   "xscreensaver -no-splash",
   "layout.sh"
}


-- ===================================================================
-- Functionality
-- ===================================================================


-- Run all the apps listed in run_on_start_up when awesome starts
function apps.autostart()
   for _, app in ipairs(run_on_start_up) do
      local findme = app
      local firstspace = app:find(" ")
      if firstspace then
         findme = app:sub(0, firstspace - 1)
      end
         awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, app), false)
   end
end

return apps
