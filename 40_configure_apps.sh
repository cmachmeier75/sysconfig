#!/bin/bash

echo "Configuring AWS"
# aws configure --profile cm

echo "Refreshing font-cache.."
fc-cache -fv

echo "Enabling Gnome Shell extensions.."
gsettings set org.gnome.shell disable-user-extensions false
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable no-title-bar@jonaspoehler.de

echo "Configuring spicetify-cli.."
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps/ -R
spicetify config current_theme Dribbblish color_scheme Dracula
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify apply
