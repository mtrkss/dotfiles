{
description = "oh god please help me";

/*
*  I don't know what I'm doing.
*  the only thing I use NixOS for is gaming and some apps which
*  just work better on Linux, everything else is done on FreeBSD.
*/

inputs = {
 firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
 nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
 # nix-colors.url = "github:Misterio77/nix-colors/main";
 home-manager.url = "github:nix-community/home-manager/release-24.05";
 home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = {
 self,
 nixpkgs,
 home-manager,
 ...
}@inputs:{
 nixosConfigurations =
 let myMachine = { system, hostname, username, userdesc, theme }:
 inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs username; };
  modules = [
   ./common
   ./hosts/${hostname}
   ./themes/${theme}/dmodule.nix
   { networking.hostName = hostname; }
   ({
    users.users.${username} = {
     isNormalUser = true;
     description = userdesc;
     extraGroups = [ "networkmanager" "wheel" "games" "video" "audio" ];
    };
   })
   home-manager.nixosModules.home-manager {
    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${username} = { imports = [
     ./hosts/${hostname}/home
     ./themes/${theme}
     ./hosts/${hostname}/virt/home.nix
    ];};
   }
  ];
 }; in {
  spymalware-a3200 = myMachine {
   system = "x86_64-linux";
   hostname = "spymalware-a3200";
   username = "cone";
   userdesc = "VLC Media Player";
   theme = "gnomedefault";
  }; # maybe gonna add more machines
 };
};

}
