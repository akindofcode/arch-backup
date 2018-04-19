#!/bin/bash
clear

sudo pacman -S --needed --noconfirm mpd ncmpcpp mpc mpv

packer -S --noedit --noconfirm cava 

# install beets

packer -S --noedit --noconfirm beets beets-copyartifacts-git

sudo pacman -S --needed --noconfirm python-pip

sudo pip install --upgrade pip

sudo pip install discogs-client

sudo pip install pylast

sudo pip install requests

#sudo pip install beets-copyartifacts
# if copyartifacts doesn't work
# replace /usr/lib/python3.6/site-packages/beetsplug/copyartifacts.py
# with https://raw.githubusercontent.com/sbarakat/beets-copyartifacts/master/beetsplug/copyartifacts.py

# we need kid3 (pacman) o kid3-cli (aur) for reading lyrics from id3 tags (mpdlyrics script)
#packer -S --noedit --noconfirm kid3-cli
sudo pacman -S --needed --noconfirm kid3


installto=$HOME/.config/mpd
username=$(whoami)
interface=$(ip route show | awk '{print $NF}' | tail -1)
#echo "What is the full path of the directory containing your music?"
#read -e -p "> " music_dir

if test -n "$(pgrep pulseaudio)";
  then
	  AUDIO='
audio_output {
               type              "pulse"
               name              "Pulseaudio"
}
'
  else
	  echo "No PulseAudio seems to be used, using autodetection instead"
	  AUDIO=""
fi

cat <<EOF


Ready to write config file.
This will delete and re-create directory "$installto"

EOF
read -p "Continue? (y/n) " yn

DO_CONFIG=
case $yn in
        [Yy]*) DO_CONFIG=yes ;;
        [Nn]*) exit;;
        *) echo "Please answer yes or no."; exit;;
esac

if test x$DO_CONFIG = xyes;
  then
  	echo "Deleting $installto folder"
	rm -fr $installto
	mkdir -p $installto/playlists
    touch $installto/log
	cat > $installto/mpd.conf <<EOF
music_directory                  "/run/media/chema/Music/"
db_file                          "/home/chema/.config/mpd/database"
log_file                         "/home/chema/.config/mpd/log"
pid_file                         "/home/chema/.config/mpd/pid"
state_file                       "/home/chema/.config/mpd/state"
playlist_directory               "/home/chema/.config/mpd/playlists"
log_level                        "default"
#password                        "password@read,add,control,admin"
#default_permissions             "read,add,control,admin"
#user                            "chema"
#bind_to_address                 "202"
bind_to_address                  "localhost"
#bind_to_address                  "/home/chema/.config/mpd/socket"
#port                             "6600"
gapless_mp3_playback             "yes"
auto_update                      "no"
#auto_update_depth               "3"

input {
        plugin                   "curl"
        proxy                    "proxy.isp.com:8000"
        proxy_user               "user"
        proxy_password           "password"
}

audio_output {
               type             "alsa"
               name             "Alsa output"
               device           "hw:0,0"
               format           "44100:16:2"
               mixer_type       "software"
               mixer_device     "default"
               mixer_control    "PCM"
               mixer_index      "0"
}

audio_output {
               type              "pulse"
               name              "Pulseaudio"
}

audio_output {
  type      "fifo"
  name      "mpd_fifo"
  path      "/tmp/mpd.fifo"
  format      "44100:16:2"
}


#audio_output {
#               type             "httpd"
#               name             "Internet Stream"
#               encoder          "lame"
#               port             "8000"
#               bind_to_address  "202"
#               quality          "5.0"
#               bitrate          "128"
#               format           "44100:16:1"
#               max_clients      "3"
#}

#audio_output {
#               type             "recorder"
#               name             "My recorder"
#               encoder          "vorbis"
#               path             "/home/carnager/stream.ogg"
#               quality          "7.0" # do not define if bitrate is defined
#               bitrate          "128" # do not define if quality is defined
#               format           "44100:16:1"
#}

#replaygain                       "album"
#replaygain_preamp                "0"
#volume_normalization            "no"
audio_buffer_size               "2048"
#buffer_before_play              "10%"
#connection_timeout              "60"
#max_connections                 "10"
#max_playlist_length             "16384"
#max_command_list_size           "2048"
#max_output_buffer_size          "8192"
#filesystem_charset              "UTF-8"
#id3v1_encoding                  "ISO-8859-1"

decoder { 
        plugin "ffmpeg" 
        enabled "no" 
} 

filesystem_charset "UTF-8"
EOF
	clear
	cat <<EOF

EOF
echo "Setting up systemd --user mpd service."
systemctl --user enable mpd
echo "Setup complete"
echo " "
echo "If you want mpd to start even before you login"
echo "enable linger for your user by running"
echo "\"loginctl enable-linger $username\""
echo " "
echo "Otherwise simply run "mpd" as user now."

  else
	echo "No config written, aborting"
	exit
fi