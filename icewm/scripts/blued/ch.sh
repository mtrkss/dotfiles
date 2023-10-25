#!/bin/sh

#read -p "Connect headphones? [y/n]: " response
#if [[ $response =~ ^[Yy]$ ]]; then
#    echo "Okay!"
#    sudo virtual_oss -T /dev/sndstat -S -a o,-0.2 -C 2 -c 2 -r 44100 -b 16 -s 1024 \
#    -R /dev/null -P /dev/bluetooth/headphones -d dsp1 -t vdsp.ctl &
#    sleep 5
#    sudo rm -f /dev/dsp1 ; sudo ln -s /dev/dsp /dev/dsp1
#    sudo pkill virtual_oss
#    sudo virtual_oss -T /dev/sndstat -S -a o,-0.2 -C 2 -c 2 -r 44100 -b 16 -s 1024 \
#        -R /dev/null -P /dev/bluetooth/headphones -d dsp -t vdsp.ctl &
#elif [[ $response =~ ^[Nn]$ ]]; then
#    exit
#else
#    echo "Invalid input. Please choose 'y' or 'n'."
#fi

printf "Connect headphones? [y/n]: "
read response

if echo "$response" | grep -qE '^[Yy]$'; then
    echo "Okay!"
    sudo virtual_oss -T /dev/sndstat -S -a o,-0.2 -C 2 -c 2 -r 44100 -b 16 -s 32 \
        -R /dev/null -P /dev/bluetooth/headphones -d dsp6 -t vdsp.ctl &
    sleep 5
    sudo rm -f /dev/dsp6 ; sudo ln -s /dev/dsp /dev/dsp6
    sudo pkill virtual_oss
    sudo virtual_oss -T /dev/sndstat -S -a o,-0.2 -C 2 -c 2 -r 44100 -b 16 -s 512 \
        -R /dev/null -P /dev/bluetooth/headphones -d dsp -t vdsp.ctl &
    sleep 1
elif echo "$response" | grep -qE '^[Nn]$'; then

else
    echo "Invalid input. Please choose 'y' or 'n'."
fi

printf "Connect to ue0? [y/n]: "
read response
if echo "$response" | grep -qE '^[Yy]$'; then
    echo "Okay!"
    sudo dhclient ue0
    sleep 1
elif echo "$response" | grep -qE '^[Nn]$'; then
    exit
else
    echo "Invalid input. Please choose 'y' or 'n'."
fi

dbus-run-session pulseaudio &

sleep 1
