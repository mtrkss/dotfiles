{
  description = "oh god please help me";

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
    ...}@inputs: {
      nixosConfigurations =
        let
          myMachine = { system, hostname, username, userdesc, theme }:
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
                home-manager.nixosModules.home-manager
                {
                  home-manager.extraSpecialArgs = { inherit inputs; };
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.${username} = {
                    imports = [
                      ./home/hosts/${hostname}
                      ./home/shared
                      ./themes/${theme}
                    ];
                  };
                }
              ];
            };
        in
        {
          spymalware-a3200 = myMachine {
            system = "x86_64-linux";
            hostname = "spymalware-a3200";
            username = "cone";
            userdesc = "VLC Media Player";
            theme = "grUwUbox";
          };
          calculator = myMachine { # thinkpad x250
            system = "x86_64-linux";
            hostname = "calculator";
            username = "cone";
            userdesc = "VLC Media Player";
            theme = "gnomedefault";
          };
        };
    };
}
