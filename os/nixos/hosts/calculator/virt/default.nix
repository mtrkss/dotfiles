{ config, ... }:{

virtualisation = {
  docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  libvirtd.enable = true;
  waydroid.enable = false;
};

programs.virt-manager.enable = true;
}
