{
home.file.".icewm/combo".text = ''
#!/bin/sh
screendir="$HOME/screenshots"
case "$1" in
	"mkmenu")
		xdgmenumaker -f icewm > $HOME/.icewm/appmenu &&
		icewm --restart
	;;
	"screen-save")
		[ -d "$screendir" ] || mkdir -pv "$screendir"
		scrot -s -f -l style=solid,color=#abb0ba,width=2 "$screendir"/img.png -e 'xclip -selection clipboard -target image/png -i $f'
	;;
	"screen-del")
		scrot -s -f -l style=solid,color=#abb0ba,width=2 -| xclip -sel c -target image/png
	;;
	*)
		echo ughhhh
	;;
esac
'';
home.file.".icewm/combo".executable = true;
}
