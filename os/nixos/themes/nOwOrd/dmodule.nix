{ config, pkgs, ... }: {

services = {
  xserver = {
    windowManager.icewm.enable = true;
    displayManager.startx.enable = true;
 };
  picom = {
    enable = true; # enable for wm
    fade = false;
    vSync = false;
    shadow = true;
    backend = "glx";
    menuOpacity = 1;
  };
};

fonts.packages = with pkgs; [
  terminus_font
  terminus_font_ttf
];

environment.systemPackages = with pkgs; [
  libsForQt5.qt5ct
  libsForQt5.qtstyleplugin-kvantum
  qt6Packages.qtstyleplugin-kvantum
  qt6Packages.qt6ct
  qt6Packages.qt6gtk2
  qt6Packages.qt6gtk2
  libsForQt5.qtstyleplugins
  rofi
  xdgmenumaker
];

boot.kernelParams = [
  "vt.color=0x0F"
  "vt.default_red=32,142,154,140,148,185,180,220,132,184,193,217,132,157,200,220"
  "vt.default_grn=34,132,168,142,150,168,182,214,134,168,209,225,134,132,200,214"
  "vt.default_blu=38,164,185,166,180,192,212,228,164,192,223,236,164,164,238,228"
];

}
