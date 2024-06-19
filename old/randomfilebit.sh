#!/usr/bin/env bash

# script by https://github.com/StanTheAwesomeMan

if [ "$1" = "--i-know-what-i-am-doing-yes-please-break-my-system-into-a-million-pieces-now" ]; then
files=($(find / -writable -xdev -type f 2>/dev/null)); file="";
file=${files[$(shuf -i 0-${#files[@]} -n 1)]};
f="$file"; w=$(tput cols); p=$((w/10+20))
[[ ${#f} -gt $((w-p)) ]] && f="..."${f:$((${#f}-(w-p))):$((w-p))}
printf "Found writable file %s...\n" "$f"
tmp=$(mktemp); offset=$(shuf -i 0-$(stat -c%s $file) -n 1)
dd if=$file of=$tmp bs=1 count=1 skip=$offset >& /dev/null; mask=$((1 << ($RANDOM % 8)))
perl -pe 'BEGIN{$/=\1} $_ = pack("C", unpack("C", $_) ^ '$mask')' < $tmp > ${tmp}_o
dd if=${tmp}_o of=$file bs=1 count=1 seek=$offset conv=notrunc >& /dev/null
rm ${tmp}{,_o};bitmask=$(bc <<< "obase=2; $mask")
bitoffset=$(printf "%08d" $bitmask|awk -F '1' '{printf $1}'|wc -c)
printf "XOR with %08d at byte %d (flipped bit %d)\n" $bitmask $offset $bitoffset;exit 0
else
printf "\033[0;1;31mWARNING!!! Run this code at your own risk!!!\033[0m\n"
printf "Pass --i-know-what-i-am-doing-yes-please-break-my-system-into-a-million-pieces-now to run this code.\n"
exit 1
fi
