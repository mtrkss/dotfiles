{ pkgs, ... }:
let
myDots = pkgs.fetchFromGitHub {
  owner = "mtrkss";
  repo = "dotfiles";
  rev = "e5c6f26";
  sha256 = "04pl7xglzv5zvm3bwpp3rlsyr9mf3ji0y46hyylxhkdlr347jkik";
}; in {
home.file = {
  ".icewm/themes/nOwOrd".source = "${myDots}/wm/icewm/themes/nOwOrd";
};
}
