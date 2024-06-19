{ pkgs, ... }:{
nixpkgs.config.allowUnfree = true;
home.packages = with pkgs; [
# net
nssTools
youtube-dl

# img/vid
gimp
mpv
feh

# sdfsdf
fragments
openboardview
pfetch-rs
xarchiver
catimg
pcmanfm
shared-mime-info
scrot
xcolor
ventoy-full
drawterm

# audio
cmus
audacity
gsm

# games
mindustry
flips
summoning-pixel-dungeon
pcsxr
fceux
yabause
dgen-sdl
mednafen
gzdoom
#wineWowPackages.stable
#winetricks
#bottles
#prismlauncher
#temurin-jre-bin # minecraft deps
#dolphin-emu

# tracker
punes
ft2-clone
#pt2-clone # breaks nix

# theming
xdgmenumaker
lxappearance
gtk2fontsel

];
}
