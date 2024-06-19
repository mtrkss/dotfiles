{ pkgs, inputs, ... }:{
programs.firefox = {
 enable = true;
 profiles.nixtime = {   
  name = "nixingh";
  id = 0;
  isDefault = true;
  settings = {
  	"browser.startup.homepage" = "https://duckduckgo.com";
  	"browser.search.defaultenginename" = "DuckDuckGo";
  	"browser.search.order.1" = "DuckDuckGo";
  	"extensions.pocket.enabled" = false;
  	"browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
  	"browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  	"browser.newtabpage.activity-stream.feeds.topsites" = false;
  	"browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
  	"browser.newtabpage.activity-stream.showSponsored" = false;
  	"browser.tabs.firefox-view" = false;
  	"identity.fxaccounts.enabled" = false;
  	
  };
  search = {
  	force = true;
  	default = "DuckDuckGo";
  	order = [ "DuckDuckGo" "NixPKGs" ];
  	engines = {
  	 "DuckDuckGo" = {
  	  urls = [{ template = "https://searx.aicampground.com/?q={searchTerms}"; }];
  	  iconUpdateURL = "http://duckduckgo.com/favicon.png";
  	  updateInterval = 24 * 60 * 60 * 1000; # every 24hrs
  	  definedAliases = [ "@d" ];
  	 };
  	 "NixPKGs" = {
  	  urls = [{
  	  template = "https://search.nixos.org/packages";
  	  params = [
  	    { name = "type"; value = "packages"; }
  	    { name = "query"; value = "{searchTerms}"; }
  	   ];
  	  }];
  	  icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
  	  definedAliases = [ "@np" ];
  	 };
  	 "NixOS Wiki" = {
     urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
     iconUpdateURL = "https://nixos.wiki/favicon.png";
     updateInterval = 24 * 60 * 60 * 1000; # every 24hrs
     definedAliases = [ "@nw" ];
    };
   };
  };
  extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
   ublock-origin
   user-agent-string-switcher
   darkreader
   clearurls
   search-by-image
   disable-javascript
   buster-captcha-solver
  ];
 };
};

}
