{ config, pkgs, ... }:{

gtk = {
 enable = true;
/* theme = {
  name = "Colloid-Compact";
  package = pkgs.colloid-gtk-theme.override {
   themeVariants = [ "default" ]; # "default" "purple" "pink" "red" "orange" "yellow" "green" "teal" "grey" "all"
   sizeVariants = [ "compact" ]; # "standard" "compact" 
   tweaks = [ "rimless" "normal" ]; # "nord" "dracula" "gruvbox" "all" "black" "rimless" "normal" "float"
   colorVariants = [ "standard" ]; # "standard" "light" "dark"
  };
 }; */
 iconTheme = {
  name = "Colloid-light";
  package = pkgs.colloid-icon-theme.override {
   schemeVariants = [ "default" ]; # "default" "nord" "dracula" "all"
   colorVariants = [ "default" ]; # "default" "purple" "pink" "red" "orange" "yellow" "green" "teal" "grey" "all"
  };
 };
 font = {
  name = "Ubuntu";
  size = 10;
  package = pkgs.ubuntu_font_family;
 };
};

/*xdg.configFile = {
  "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
};*/


}

