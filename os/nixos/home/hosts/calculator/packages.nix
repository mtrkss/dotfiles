{ pkgs, ... }:{
nixpkgs.config.allowUnfree = true;
home.packages = with pkgs; [
# net
nssTools
inetutils

# img/vid
gimp
mpv
feh

# sdfsdf
openboardview
pipx
xcolor
ventoy-full
drawterm
obs-studio
obs-studio-plugins.obs-gstreamer
gst_all_1.gst-plugins-base
gst_all_1.gst-plugins-good
gst_all_1.gst-plugins-ugly
gst_all_1.gst-plugins-bad
pfetch-rs
catimg

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
punes
gzdoom

# tracker
ft2-clone
#pt2-clone # breaks nix

# theming
xdgmenumaker
lxappearance
gtk2fontsel
];
}
