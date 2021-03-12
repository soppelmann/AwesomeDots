local appmenu = {}

appmenu.Accessories = {
    { 'Bulk Rename', 'thunar --bulk-rename', '/usr/share/icons/hicolor/48x48/apps/org.xfce.thunar.png' },
    { 'Code - OSS', '/usr/lib/code-oss/bin/code-oss --no-sandbox --unity-launch' },
    { 'Kvantum Manager', 'kvantummanager', '/usr/share/icons/hicolor/scalable/apps/kvantum.svg' },
    { 'Mousepad', 'mousepad', '/usr/share/icons/hicolor/48x48/apps/org.xfce.mousepad.png' },
    { 'Neovim', 'xterm -e nvim' },
    { 'Thunar File Manager', 'thunar', '/usr/share/icons/hicolor/48x48/apps/org.xfce.thunar.png' },
    { 'compton', 'compton', '/usr/share/icons/hicolor/48x48/apps/compton.png' },
    { 'picom', 'picom' },
}

appmenu.Development = {
    { 'Code - OSS', '/usr/lib/code-oss/bin/code-oss --no-sandbox --unity-launch' },
    { 'Cutter', 'Cutter' },
    { 'Eclipse', 'eclipse', '/usr/share/icons/hicolor/256x256/apps/eclipse.png' },
    { 'Emacs', '/bin/emacs' },
    { 'Geany', 'geany', '/usr/share/icons/hicolor/48x48/apps/geany.png' },
    { 'IntelliJ IDEA Ultimate Edition', '"/opt/idea/idea-IU-202.7660.26/bin/idea.sh"', '/opt/idea/idea-IU-202.7660.26/bin/idea.svg' },
    { 'Qt5 Assistant', '/usr/bin/assistant-qt5', '/usr/share/icons/hicolor/32x32/apps/assistant-qt5.png' },
    { 'Qt5 Designer', '/usr/bin/designer-qt5', '/usr/share/icons/hicolor/128x128/apps/designer-qt5.png' },
    { 'Qt5 Linguist', '/usr/bin/linguist-qt5', '/usr/share/icons/hicolor/48x48/apps/linguist-qt5.png' },
    { 'Qt5 QDbusViewer', '/usr/bin/qdbusviewer-qt5', '/usr/share/icons/hicolor/32x32/apps/qdbusviewer-qt5.png' },
}

appmenu.Education = {
    { 'GNU Octave', '/usr/bin/octave --gui', '/usr/share/icons/hicolor/256x256/apps/octave.png' },
}

appmenu.Games = {
    { 'Lutris', 'lutris', '/usr/share/icons/hicolor/48x48/apps/lutris.png' },
}

appmenu.Graphics = {
    { 'GNU Image Manipulation Program', 'gimp-2.10', '/usr/share/icons/hicolor/256x256/apps/gimp.png' },
    { 'Gpick', 'gpick', '/usr/share/icons/hicolor/48x48/apps/gpick.png' },
    { 'Inkscape', 'inkscape', '/usr/share/icons/hicolor/256x256/apps/org.inkscape.Inkscape.png' },
    { 'Okular', 'okular', '/usr/share/icons/hicolor/48x48/apps/okular.png' },
}

appmenu.Internet = {
    { 'Chromium', 'chromium', '/usr/share/icons/hicolor/256x256/apps/chromium.png' },
    { 'Connman UI Setup', 'cmst', '/usr/share/icons/hicolor/36x36/apps/cmst.png' },
    { 'Firefox Web Browser', 'firefox', '/usr/share/icons/hicolor/256x256/apps/firefox.png' },
    { 'HexChat', 'hexchat --existing', '/usr/share/icons/hicolor/48x48/apps/hexchat.png' },
    { 'Telegram Desktop', 'telegram-desktop --', '/usr/share/icons/hicolor/256x256/apps/telegram.png' },
    { 'Transmission', 'transmission-gtk', '/usr/share/icons/hicolor/scalable/apps/transmission.svg' },
    { 'qBittorrent', 'qbittorrent', '/usr/share/icons/hicolor/36x36/apps/qbittorrent.png' },
    { 'qutebrowser', 'qutebrowser', '/usr/share/icons/hicolor/256x256/apps/qutebrowser.png' },
}

appmenu.Office = {
    { 'Okular', 'okular', '/usr/share/icons/hicolor/48x48/apps/okular.png' },
    { 'Zathura', 'zathura', '/usr/share/icons/hicolor/256x256/apps/org.pwmt.zathura.png' },
}

appmenu.Multimedia = {
    { 'PulseAudio Volume Control', 'pavucontrol-qt', '/usr/share/icons/Adwaita/256x256/legacy/multimedia-volume-control.png' },
}

appmenu.Settings = {
    { 'ARandR', 'arandr' },
    { 'Connman UI Setup', 'cmst', '/usr/share/icons/hicolor/36x36/apps/cmst.png' },
    { 'Customize Look and Feel', 'lxappearance', '/usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-theme.png' },
    { 'File Manager Settings', 'thunar-settings', '/usr/share/icons/hicolor/48x48/apps/org.xfce.thunar.png' },
    { 'Kvantum Manager', 'kvantummanager', '/usr/share/icons/hicolor/scalable/apps/kvantum.svg' },
    { 'Power Manager', 'xfce4-power-manager-settings', '/usr/share/icons/hicolor/48x48/apps/org.xfce.powermanager.png' },
    { 'Qt5 Settings', 'qt5ct', '/usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-theme.png' },
    { 'Screensaver', 'xscreensaver-demo' },
    { 'Theme Configuration', 'gtk-theme-config', '/usr/share/icons/hicolor/scalable/apps/gtk-theme-config.svg' },
}

appmenu.System = {
    { 'Alacritty', 'alacritty' },
    { 'Bulk Rename', 'thunar --bulk-rename', '/usr/share/icons/hicolor/48x48/apps/org.xfce.thunar.png' },
    { 'Connman UI Setup', 'cmst', '/usr/share/icons/hicolor/36x36/apps/cmst.png' },
    { 'Htop', 'xterm -e htop', '/usr/share/icons/hicolor/scalable/apps/htop.svg' },
    { 'Thunar File Manager', 'thunar', '/usr/share/icons/hicolor/48x48/apps/org.xfce.thunar.png' },
    { 'conky', 'conky --daemonize --pause=1', '/usr/share/icons/hicolor/scalable/apps/conky-logomark-violet.svg' },
    { 'ranger', 'xterm -e ranger', '/usr/share/icons/Adwaita/48x48/legacy/utilities-terminal.png' },
    { 'rxvt-unicode', 'urxvt' },
}

appmenu.Miscellaneous = {
    { 'Bitmap to Component Converter', 'bitmap2component', '/usr/share/icons/hicolor/48x48/apps/bitmap2component.png' },
    { 'Eeschema (Standalone)', 'eeschema', '/usr/share/icons/hicolor/48x48/apps/eeschema.png' },
    { 'Emacs', '/bin/emacs' },
    { 'GerbView', 'gerbview', '/usr/share/icons/hicolor/48x48/apps/gerbview.png' },
    { 'KiCad', 'kicad', '/usr/share/icons/hicolor/48x48/apps/kicad.png' },
    { 'MATLAB R2020a', 'matlab -desktop' },
    { 'Mathematica 12', '/opt/Mathematica/Executables/Mathematica' },
    { 'PCB Calculator', 'pcb_calculator', '/usr/share/icons/hicolor/48x48/apps/pcbcalculator.png' },
    { 'Pcbnew (Standalone)', 'pcbnew', '/usr/share/icons/hicolor/48x48/apps/pcbnew.png' },
    { 'Ripcord', '/opt/Ripcord-0.4.26-x86_64.AppImage' },
    { 'Ripcord', '/opt/Ripcord-0.4.26-x86_64.AppImage' },
}

appmenu.Appmenu = {
    { 'Accessories', appmenu.Accessories, '/usr/share/icons/Adwaita/48x48/legacy/applications-utilities.png' },
    { 'Development', appmenu.Development, '/usr/share/icons/Adwaita/256x256/legacy/applications-development.png' },
    { 'Education', appmenu.Education, '/usr/share/icons/Adwaita/48x48/legacy/applications-science.png' },
    { 'Games', appmenu.Games, '/usr/share/icons/Adwaita/48x48/legacy/applications-games.png' },
    { 'Graphics', appmenu.Graphics, '/usr/share/icons/Adwaita/256x256/legacy/applications-graphics.png' },
    { 'Internet', appmenu.Internet, '/usr/share/icons/Adwaita/48x48/legacy/applications-internet.png' },
    { 'Office', appmenu.Office, '/usr/share/icons/Adwaita/256x256/legacy/applications-office.png' },
    { 'Multimedia', appmenu.Multimedia },
    { 'Settings', appmenu.Settings, '/usr/share/icons/Adwaita/48x48/legacy/applications-accessories.png' },
    { 'System', appmenu.System, '/usr/share/icons/Adwaita/48x48/legacy/applications-system.png' },
    { 'Miscellaneous', appmenu.Miscellaneous, '/usr/share/icons/Adwaita/48x48/legacy/applications-other.png' },
}

return appmenu