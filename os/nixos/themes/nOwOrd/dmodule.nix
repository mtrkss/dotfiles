{ config, pkgs, ... }: {

imports = [ ../../templates/icewm.nix ];

fonts.packages = with pkgs; [
  spleen
  terminus_font
  terminus_font_ttf
];

boot.kernelParams = [
  "vt.color=0x0F"
  "vt.default_red=0,142,154,140,148,185,180,220,132,184,193,217,132,157,200,220"
  "vt.default_grn=0,132,168,142,150,168,182,214,134,168,209,225,134,132,200,214"
  "vt.default_blu=0,164,185,166,180,192,212,228,164,192,223,236,164,164,238,228"
];

}
