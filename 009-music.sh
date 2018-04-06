#!/bin/bash
clear

sudo pacman -S --needed --noconfirm mpd

installto=$HOME/.config/mpd
username=$(whoami)
interface=$(ip route show | awk '{print $NF}' | tail -1)
echo "What is the full path of the directory containing your music?"
read -e -p "> " music_dir

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
music_directory                  "$music_dir"
db_file                          "$installto/database"
log_file                         "$installto/log"
pid_file                         "$installto/pid"
state_file                       "$installto/state"
playlist_directory               "$installto/playlists"
log_level                        "default"
#password                        "password@read,add,control,admin"
#default_permissions             "read,add,control,admin"
#user                            "$username"
#bind_to_address                 "$interface"
bind_to_address                  "127.0.0.1"
bind_to_address                  "$installto/socket"
port                             "6600"
gapless_mp3_playback             "yes"
auto_update                      "yes"
#auto_update_depth               "3"

input {
        plugin                   "curl"
        proxy                    "proxy.isp.com:8000"
        proxy_user               "user"
        proxy_password           "password"
}
$AUDIO
#audio_output {
#               type             "alsa"
#               name             "Alsa output"
#               device           "hw:0,0"
#               format           "44100:16:2"
#               mixer_type       "hardware"
#               mixer_device     "default"
#               mixer_control    "PCM"
#               mixer_index      "0"
#}
#audio_output {
#               type             "httpd"
#               name             "Internet Stream"
#               encoder          "lame"
#               port             "8000"
#               bind_to_address  "$interface"
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
#audio_buffer_size               "2048"
#buffer_before_play              "10%"
#connection_timeout              "60"
#max_connections                 "10"
#max_playlist_length             "16384"
#max_command_list_size           "2048"
#max_output_buffer_size          "8192"
#filesystem_charset              "UTF-8"
#id3v1_encoding                  "ISO-8859-1"
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
