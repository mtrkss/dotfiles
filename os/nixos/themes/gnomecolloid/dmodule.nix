{ config, pkgs, ... }: {

# desktops
services = {
 xserver = {
  windowManager.icewm.enable = true;
  desktopManager.gnome.enable = true;
  displayManager = {
   startx.enable = true;
   gdm.enable = true;
  };
 };
 picom = {
  enable = false; # enable for wm
  fade = false;
  vSync = false;
  shadow = true;
  backend = "glx";
  menuOpacity = 1;
 };
};

environment = {
 gnome.excludePackages = (with pkgs; [
  gnome-tour
  gnome-connections
 ]) ++ (with pkgs.gnome; [
  epiphany
  geary
  evince
 ]);
 systemPackages = (with pkgs; [
  libsForQt5.qt5ct	
  libsForQt5.qtstyleplugin-kvantum
  qt6Packages.qtstyleplugin-kvantum
  qt6Packages.qt6ct
  qt6Packages.qt6gtk2
  qt6Packages.qt6gtk2
  libsForQt5.qtstyleplugins
 ]) ++ ( with pkgs.gnomeExtensions; [
  blur-my-shell
  pop-shell
  zen
  wiggle
  wifi-qrcode
  vitals
  user-themes-x
  unite
  desktop-icons-ng-ding
 ]);
};

# fonts.fontconfig = {
# enable = true;
# antialias = true;
# };

}
