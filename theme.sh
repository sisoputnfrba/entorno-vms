#!/bin/bash -x

set -e

sudo apt-get update -y

sudo apt-get install -y arc-theme

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

download() {
  file=${1:?}
  wget -O ~/$file "https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/$file"
}

# Terminator config
mkdir -pv ~/.config/terminator
download ".config/terminator/config"

# GTK config
mkdir -pv ~/.config/gtk-3.0
download ".config/gtk-3.0/bookmarks"
download ".config/gtk-3.0/gtk.css"

# Whisker Menu config
mkdir -pv ~/.config/xfce4/panel
download ".config/xfce4/panel/whiskermenu-6.rc"

# Panel profile
download "panel.tar.bz2"
xfce4-panel-profiles load ~/panel.tar.bz2
rm -v ~/panel.tar.bz2

# Desktop entries
mkdir -pv ~/.local/share/applications
download ".local/share/applications/eclipse.desktop"
