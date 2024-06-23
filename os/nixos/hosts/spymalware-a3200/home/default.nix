{ config, ... }: {
imports = [
  ./firefox.nix
  ./packages.nix
  ./shell.nix
  ./gzdoom.nix
];

home.file = {
".gitconfig.moveme".text = ''
[gpg]
	format = ssh
[user]
	signingkey = /home/cone/.ssh/id_ed25519.pub
	email = itzmatrikzup@gmail.com
	name = mtrkss
[gpg "ssh"]
	allowedSignersFile = /home/cone/.ssh/allowed_signers
'';
".xinitrc".executable = true;
".xinitrc".text = ''
xrdb ~/.Xresources
dbus-launch --exit-with-session icewm-session
'';
};

# The state version is required and should stay at the version you
# originally installed.
home.stateVersion = "24.05";
}
