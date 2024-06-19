{
home.file = {
".icewm/moveus/keys".text = ''
key "Super+x" urxvt
key "Super+f" firefox
key "Print" ~/.icewm/combo screen-del
key "Super+Print" ~/.icewm/combo screen-save
key "Super+Enter" rofi -show-icons -show drun
key "Super+s" xmag
'';

".icewm/moveus/preferences".text = ''
ShowTaskBar=0
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

".icewm/moveus/menu".text = ''
prog URxvt _none_ urxvt
prog Files _none_ pcmanfm
include ~/.icewm/appmenu
menu Stuff _none_ {
	prog reload _none_ ~/.icewm/combo mkmenu
}
'';

".icewm/moveus/toolbar".text = ''
# nothing here
}
'';

".icewm/moveus/startup".text = ''
#!/bin/sh
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144
xrandr --output HDMI-A-0 --mode 1920x1080 --rate 75
[ -f $HOME/.fehbg ] && $HOME/.fehbg
$HOME/.icewm/combo mkmenu
pasystray &
nm-applet &
/nix/store/*polkit-gnome*/libexec/polkit-gnome-authentication-agent-1 &
'';
".icewm/moveus/startup".executable = true;

".icewm/copyfiles".text = ''
#!/bin/sh
icefiles="menu toolbar keys preferences startup"
[ -d $HOME/.icewm/backup ] || mkdir $HOME/.icewm/backup
for file in $icefiles; do
	if [ -f $HOME/.icewm/$file ]; then
		cksum="$(shasum<$file|head -c16)"
		mv -fv $HOME/.icewm/$file $HOME/.icewm/backup/$file.$cksum.bak
	fi
	cp -v $HOME/.icewm/moveus/$file $HOME/.icewm/$file
done
'';
".icewm/copyfiles".executable = true;
};
}
