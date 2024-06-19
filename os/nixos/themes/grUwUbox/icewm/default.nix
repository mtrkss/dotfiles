{

imports = [
  ./combo.nix
  ./theme.nix
];

home.file = {
".icewm/keys".text = ''
key "Super+x" urxvt
key "Super+f" firefox
key "Print" ~/.icewm/combo screen-del
key "Super+Print" ~/.icewm/combo screen-save
key "Super+s" xmag
'';

".icewm/preferences".text = ''
TaskBarShowWorkspaces=0
TaskBarShowStartMenu=0
TaskBarShowShowDesktopButton=0
TaskBarTaskGrouping=1
TaskBarShowWindowListMenu=0
TaskBarAtTop=0
ShowWindowList=0
TaskbarButtonWidthDivisor=7
SnapMove=0
TaskBarShowAPMStatus=0
TaskBarShowAPMAuto=0
TaskBarShowCPUStatus=0
TaskBarShowMailboxStatus=0
TaskBarShowMEMStatus=0
TaskBarShowNetStatus=0
'';

".icewm/menu".text = ''
prog URxvt _none_ urxvt
prog Files _none_ pcmanfm
include ~/.icewm/appmenu
menu Stuff _none_ {
	prog reload _none_ ~/.icewm/combo mkmenu
}
'';

".icewm/toolbar".text = ''
# nothing here
}
'';

".icewm/theme".text = ''
Theme="grUwUbox/default.theme"
'';

".icewm/startup.moveme".text = ''
#!/bin/sh
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144
xrandr --output HDMI-A-0 --mode 1920x1080 --rate 75
[ -f $HOME/.fehbg ] && $HOME/.fehbg
$HOME/.icewm/combo mkmenu
pasystray &
nm-applet &
/nix/store/*polkit-gnome*/libexec/polkit-gnome-authentication-agent-1 &
'';
".icewm/startup".executable = true;
};

}
