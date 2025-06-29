fpath=$(dirname "$(realpath $0)")
initializing(){
	# updating
	sudo pacman -Syu 
	echo -e "\n\n\n\ndone updating\n\n\n\n\n"
	sleep 3
	clear
	# install dependencies
	$fpath/scripts/check.sh
	mkdir ~/repo
}
hyprland(){
	mkdir ~/Pictures
	mkdir ~/Pictures/screenshots
	mkdir ~/Pictures/wallp
	echo "source = ~/$fpath/mytheme.conf" >> ~/.config/hypr/hyprland.conf
}
kitty(){
	if [ ! -d "~/.config/kitty" ]; then
		mkdir -p "~/.config/kitty"
	else
		echo "Directory already exists: ~/.config/kitty"
	fi
	echo "window_padding_width 20" >> ~/.config/kitty/kitty.conf

}
ranger(){
	git clone https://github.com/ranger/ranger/ ~/repo/ranger
	cp -r ~/repo/ranger/ranger/config/ ~/.config/
	mv ~/.config/config ~/.config/ranger
	echo "set preview_images_method kitty" >> ~/.config/ranger/rc.conf
	echo "set preview_images true" >> ~/.config/ranger/rc.conf
	echo "set show_hidden true" >> ~/.config/ranger/rc.conf
	echo "map xc shell wl-copy < %f" >> ~/.config/ranger/rc.conf
	echo "map <F1> shell hyprctl hyprpaper reload ,%d/%f" >> ~/.config/ranger/rc.conf
}
bash(){
	cat << EOL >>~/.bashrc
	clear
	export EDITOR="nvim"
	alias sb="source ~/.bashrc"
	alias n="nvim"
	alias lg="lazygit"
	alias f="python2 ~/repo/ranger/ranger.py"
	alias sd="~/$fpath/scripts/control.sh sd"
	eval "$(starship init bash)"
EOL
}
dunst(){
	cp -r $fpath/dunst/ ~/.config/dunst
}
initializing
hyprpaper
kitty
ranger
bash
dunst
