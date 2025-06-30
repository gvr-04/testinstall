fpath=$(dirname "$(realpath $0)")

initializing(){
	# updating
	sudo pacman -Syu 
	echo -e "\n\n\n\ndone updating\n\n\n"
	sleep 3
	# install dependencies
	$fpath/scripts/check.sh
	mkdir ~/repo
	echo -e "\n\n\n\ndone initializing\n\n\n"
	sleep 3
}

hyprland(){
	mkdir ~/Pictures
	mkdir ~/Pictures/screenshots
	ln -s ~/$fpath/wallp/ ~/Pictures/wallp
	echo "source = $fpath/mytheme.conf" >> ~/.config/hypr/hyprland.conf
	echo -e "\n\n\ndone hyprland\n\n\n"
	sleep 3
}
kitty(){
	mkdir ~/.config/kitty
	echo "include $fpath/mykitty.conf" >> ~/.config/kitty/kitty.conf
	echo -e "\n\n\ndone kitty\n\n\n"
	sleep 3

}
ranger(){
	git clone https://github.com/ranger/ranger/ ~/repo/ranger
	cp -r ~/repo/ranger/ranger/config/ ~/.config/
	mv ~/.config/config ~/.config/ranger
	echo "source $fpath/myranger.conf" >> ~/.config/ranger/rc.conf
	echo -e "\n\n\ndone ranger\n\n\n"
	sleep 3
}
bash(){
	echo "source $fpath/.mybash" >> ~/.bashrc
	echo -e "\n\n\ndone bash\n\n\n"
	sleep 3
}
dunst(){
	ln -s $fpath/dunst/ ~/.config/dunst
	echo -e "\n\n\ndone dunst\n\n\n"
	sleep 3
}
nvimset(){
	ln -s $fpath/nvim/ ~/.config/nvim
	echo -e "\n\n\ndone nvim\n\n\n"
	sleep 3
}
initializing
hyprland
kitty
ranger
bash
dunst
nvimset
