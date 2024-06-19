{ config, pkgs, ... }:{
services = {
  printing.enable = true;
  flatpak.enable = true;
  dbus.enable = true;
  gvfs.enable = true;
  udisks2.enable = true;
  xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    xkb = {
      variant = "";
      layout = "us,ru";
      options = "grp:alt_shift_toggle";
    };
  };
  libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0.07";
      tapping = true;
      tappingDragLock = false;
      middleEmulation = false;
    };
  };
  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };  
};
xdg.portal = {
  enable = true;
  wlr.enable = false;
  config.common.default = "*";
  extraPortals = [ pkgs.xdg-desktop-portal ];
};
  
hardware.pulseaudio.enable = false;
}
