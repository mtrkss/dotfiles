{ pkgs, ... }:
let
myDots = pkgs.fetchFromGitHub {
  owner = "mtrkss";
  repo = "dotfiles";
  rev = "1182e6d";
  sha256 = "16wizx4yp8n27gl416szn3vv44gf6yz50bp932k2xhrfpgknlcgq";
}; in {
home.file = {
  ".icewm/themes/grUwUbox".source = "${myDots}/wms/icewm/themes/grUwUbox";
};
}
