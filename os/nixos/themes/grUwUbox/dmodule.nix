{ pkgs, ... }: {

imports = [ ../../templates/icewm.nix ];

fonts.packages = with pkgs; [
  spleen
  cozette
];

}
