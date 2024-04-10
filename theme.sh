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
#pulseaudio-button > image { -gtk-icon-transform: scale(0.5); }
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
wget "https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/panel.tar.bz2"
xfce4-panel-profiles load panel.tar.bz2
rm -v panel.tar.bz2
