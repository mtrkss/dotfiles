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

# other
tree
curl
wget
dash
];
}
