{ pkgs, ... }: {
fonts.packages = with pkgs; [
# fonts
noto-fonts-color-emoji
hack-font
unifont
cozette
spleen
noto-fonts
liberation_ttf
];

environment.systemPackages = with pkgs; [
# Dev / useful
unrar
flashrom
acpitool
git
usbutils
pciutils
dmidecode
brotli
age

# other
rxvt-unicode
es
pasystray
pavucontrol
networkmanagerapplet
v4l-utils
adb-sync
android-tools
gamemode
mangohud
jp2a
pulseaudio
bluez
polkit_gnome
file
gsm

# xorg
xorg.xwd
xorg.twm
xorg.xeyes
xorg.xclock
xorg.xfontsel
xorg.xmessage
xorg.xinit
xorg.xmag
xclip
xsel
];
}
