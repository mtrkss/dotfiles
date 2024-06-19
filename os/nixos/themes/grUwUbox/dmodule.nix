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

environment = {
  systemPackages = with pkgs; [
    libsForQt5.qt5ct	
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    qt6Packages.qt6gtk2
    qt6Packages.qt6gtk2
    libsForQt5.qtstyleplugins
  ];
};

}
