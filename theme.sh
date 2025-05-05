#!/bin/bash -x

set -e

sudo apt-get update -y

# Instalar tema
sudo apt-get install -y arc-theme

# Instalar pack de iconos
git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela-icon-theme
./install.sh
cd ..
rm -rf Tela-icon-theme

# Tema
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Darker"
xfconf-query -c xfwm4 -p /general/theme -n -t string -s "Arc-Darker"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-dark"

# Fuentes
xfconf-query -c xsettings -p /Gtk/FontName -s "Ubuntu 10"
xfconf-query -c xfwm4 -p /general/title_font -n -t string -s "Ubuntu Bold 10"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "Ubuntu Mono 11"

# Terminator config
mkdir -pv ~/.config/terminator
cat > ~/.config/terminator/config <<EOF
[global_config]
[keybindings]
[profiles]
  [[default]]
    allow_bold = False
    cursor_color = "#aaaaaa"
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
[plugins]
EOF

# GTK config
mkdir -pv ~/.config/gtk-3.0

cat > ~/.config/gtk-3.0/gtk.css <<EOF
#pulseaudio-button image { -gtk-icon-transform: scale(0.5); }
#xfce4-notification-plugin > image { -gtk-icon-transform: scale(0.5); }
EOF

cat > ~/.config/gtk-3.0/bookmarks <<EOF
file://$HOME/Documents
file://$HOME/Downloads
file://$HOME/Music
file://$HOME/Pictures
file://$HOME/Videos
EOF

# Whisker Menu config
mkdir -pv ~/.config/xfce4/panel

cat > ~/.config/xfce4/panel/whiskermenu-6.rc <<EOF
favorites=code_code.desktop,eclipse.desktop,exo-web-browser.desktop,exo-file-manager.desktop,exo-terminal-emulator.desktop
recent=
button-icon=distributor-logo-xubuntu
button-single-row=false
show-button-title=false
show-button-icon=true
launcher-show-name=true
launcher-show-description=true
launcher-show-tooltip=true
launcher-icon-size=2
hover-switch-category=false
category-show-name=true
category-icon-size=1
sort-categories=true
view-mode=1
default-category=0
recent-items-max=10
favorites-in-recent=true
position-search-alternate=true
position-commands-alternate=true
position-categories-alternate=true
position-categories-horizontal=false
stay-on-focus-out=false
profile-shape=0
confirm-session-command=true
menu-width=450
menu-height=500
menu-opacity=100
command-settings=xfce4-settings-manager
show-command-settings=true
command-lockscreen=xflock4
show-command-lockscreen=true
command-switchuser=dm-tool switch-to-greeter
show-command-switchuser=false
command-logoutuser=xfce4-session-logout --logout --fast
show-command-logoutuser=false
command-restart=xfce4-session-logout --reboot --fast
show-command-restart=false
command-shutdown=xfce4-session-logout --halt --fast
show-command-shutdown=false
command-suspend=xfce4-session-logout --suspend
show-command-suspend=false
command-hibernate=xfce4-session-logout --hibernate
show-command-hibernate=false
command-logout=xfce4-session-logout
show-command-logout=true
command-menueditor=menulibre
show-command-menueditor=true
command-profile=mugshot
show-command-profile=true
search-actions=6

[action0]
name=Man Pages
pattern=#
command=exo-open --launch TerminalEmulator man %s
regex=false

[action1]
name=Search the Web
pattern=?
command=exo-open --launch WebBrowser https://www.google.com/search?q=%u
regex=false

[action2]
name=Search for Files
pattern=-
command=catfish --path=~ --start %s
regex=false

[action3]
name=Run in Terminal
pattern=!
command=exo-open --launch TerminalEmulator %s
regex=false

[action4]
name=Open URI
pattern=^(file|http|https):\\/\\/(.*)$
command=exo-open \\0
regex=true
EOF

# Panel profile
mkdir -pv panel/launcher-11 panel/launcher-12 panel/launcher-13

cat > panel/config.txt << EOF
/configver 2
/panels [<1>]
/panels/panel-1/autohide-behavior uint32 0
/panels/panel-1/background-alpha uint32 100
/panels/panel-1/background-style uint32 0
/panels/panel-1/disable-struts false
/panels/panel-1/enter-opacity uint32 100
/panels/panel-1/leave-opacity uint32 100
/panels/panel-1/length uint32 100
/panels/panel-1/length-adjust true
/panels/panel-1/mode uint32 0
/panels/panel-1/nrows uint32 1
/panels/panel-1/plugin-ids [<6>, <9>, <12>, <13>, <11>, <2>, <3>, <4>, <14>, <5>, <1>, <7>]
/panels/panel-1/position 'p=8;x=512;y=752'
/panels/panel-1/position-locked true
/panels/panel-1/size uint32 41
/plugins/plugin-1 'notification-plugin'
/plugins/plugin-11 'launcher'
/plugins/plugin-11/items [<'terminator.desktop'>]
/plugins/plugin-12 'launcher'
/plugins/plugin-12/items [<'filemanager.desktop'>]
/plugins/plugin-13 'launcher'
/plugins/plugin-13/items [<'firefox.desktop'>]
/plugins/plugin-14 'pulseaudio'
/plugins/plugin-14/enable-keyboard-shortcuts true
/plugins/plugin-2 'tasklist'
/plugins/plugin-2/flat-buttons false
/plugins/plugin-2/grouping uint32 1
/plugins/plugin-2/include-all-monitors true
/plugins/plugin-2/include-all-workspaces false
/plugins/plugin-2/middle-click uint32 0
/plugins/plugin-2/show-handle true
/plugins/plugin-2/show-labels false
/plugins/plugin-2/show-only-minimized false
/plugins/plugin-2/show-wireframes false
/plugins/plugin-2/sort-order uint32 0
/plugins/plugin-3 'separator'
/plugins/plugin-3/expand true
/plugins/plugin-3/style uint32 0
/plugins/plugin-4 'systray'
/plugins/plugin-4/names-ordered [<'networkmanager applet'>, <'network'>]
/plugins/plugin-4/names-visible [<'networkmanager applet'>]
/plugins/plugin-4/show-frame true
/plugins/plugin-4/size-max uint32 22
/plugins/plugin-4/square-icons true
/plugins/plugin-5 'clock'
/plugins/plugin-5/digital-format '%I:%M %p'
/plugins/plugin-5/mode uint32 2
/plugins/plugin-5/show-frame true
/plugins/plugin-5/tooltip-format '%A %d %B %Y'
/plugins/plugin-6 'whiskermenu'
/plugins/plugin-7 'showdesktop'
/plugins/plugin-9 'separator'
/plugins/plugin-9/style uint32 2
EOF

cat > panel/launcher-11/terminator.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Exec=exo-open --launch TerminalEmulator
Icon=utilities-terminal
StartupNotify=true
Terminal=false
Categories=Utility;X-XFCE;X-Xfce-Toplevel;
OnlyShowIn=XFCE;
X-AppStream-Ignore=True
Name=Terminal Emulator
Comment=Use the command line
X-XFCE-Source=file:///usr/share/applications/exo-terminal-emulator.desktop
EOF

cat > panel/launcher-12/filemanager.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Exec=exo-open --launch FileManager %u
Icon=system-file-manager
StartupNotify=true
Terminal=false
Categories=Utility;X-XFCE;X-Xfce-Toplevel;
OnlyShowIn=XFCE;
X-XFCE-MimeType=inode/directory;x-scheme-handler/trash;
X-AppStream-Ignore=True
Name=File Manager
Comment=Browse the file system
X-XFCE-Source=file:///usr/share/applications/exo-file-manager.desktop
EOF

cat > panel/launcher-13/firefox.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Exec=exo-open --launch WebBrowser %u
Icon=web-browser
StartupNotify=true
Terminal=false
Categories=Network;X-XFCE;X-Xfce-Toplevel;
OnlyShowIn=XFCE;
X-XFCE-MimeType=x-scheme-handler/http;x-scheme-handler/https;
X-AppStream-Ignore=True
Name=Web Browser
Comment=Browse the web
X-XFCE-Source=file:///usr/share/applications/exo-web-browser.desktop
EOF

(
  cd panel || exit 1
  tar -cvjSf panel.tar.bz2 **
  xfce4-panel-profiles load panel.tar.bz2
)

rm -rfv panel
