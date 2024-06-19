{ pkgs, config, ... }: {
imports = [
  ./packages.nix
  ./virt 
  ./services.nix 
  ./hardware-configuration.nix 
];
nixpkgs.config.allowUnfree = true;
nixpkgs.config.allowAliases = false;

boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

fileSystems."/tmp" = {
  device = "none";
  fsType = "tmpfs";
  options = [ "size=2G" "mode=777" ];
};
 
security.polkit.enable = true;
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



programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  gamescopeSession.enable = true;
};

hardware = { 
  bluetooth = {
    enable = true;
    powerOnBoot = true;
 };
};

# you know the drill
system.stateVersion = "24.05";
}
