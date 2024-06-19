{ pkgs, ... }:
let
myDots = pkgs.fetchFromGitHub {
  owner = "mtrkss";
  repo = "dotfiles";
  rev = "52b61c5";
  sha256 = "04pl7xglzv5zvm3bwpp3rlsyr9mf3ji0y46hyylxhkdlr347jkik";
}; in {
home.file = {
  ".icewm/themes/grUwUbox".source = "${myDots}/wm/icewm/themes/grUwUbox";
};
}
