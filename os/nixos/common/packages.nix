{ pkgs, ... }:{
environment.systemPackages = with pkgs; [
# timewasters
neofetch
fastfetch
cmatrix
cbonsai
asciiquarium
bsdgames

# some CLI tools
tmux
htop
hexedit
btop
micro

# Dev / useful
nixpkgs-fmt
ripgrep
ffmpeg
imagemagick
python313Full
python313Packages.tkinter
tk
tcl
unzip
p7zip
unrar
lf
bat
bc
gst_all_1.gstreamer
gst_all_1.gst-plugins-base
gst_all_1.gst-plugins-good
gst_all_1.gst-plugins-bad
gst_all_1.gst-plugins-ugly

# other
tree
uwuify
curl
wget
dash
steam-run
];
}
