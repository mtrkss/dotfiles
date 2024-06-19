{ pkgs, config, ... }: {

imports = [
  ./packages.nix
  ./vim.nix
];

nixpkgs.config.allowUnfree = true;

boot = {
  loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = false;
    grub = {
      enable = false;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
    };
  }; # loader
  kernel = {
    sysctl = {
    "net.ipv4.ip_default_ttl" = "65";
    "net.ipv6.conf.all.hop_limit" = "65";
    };
  };
  kernelParams = [
    "cgroup_no_v1=all"
    "systemd.unified_cgroup_hierarchy=yes"
  ];
  extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
    chipsec
  ];
};

environment.etc."libinput/local-overrides.quirks".text =
''
[testbouce]
MatchUdevType=mouse
ModelBouncingKeys=1
'';

time.timeZone = "Europe/Minsk";
nix.settings.experimental-features = [ "nix-command" "flakes" ];
sound.enable = true;
security.rtkit.enable = true;
programs.dconf.enable = true;
networking.networkmanager.enable = true;

}
