{ conf, pkgs, ... }:{

systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
};

services = {
  xserver = {
    windowManager.icewm.enable = true;
    displayManager.startx.enable = true;
 };
  picom = {
    enable = true;
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
    rofi
    xdgmenumaker
  ];
  sessionVariables = rec {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    XDG_CURRENT_DESKTOP = "X-Generic";
  };
};

}
