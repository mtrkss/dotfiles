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

system.stateVersion = "24.05";
}
