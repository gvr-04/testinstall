#!/bin/bash
# checks for packages installed or not

packages=(
	# version control
	git
	lazygit
	github-cli
	# essentials
	neovim
	wl-clipboard
	python-pillow
	libnotify
	grim
	jq
	slurp
	hyprpaper
	starship
	# fonts
	noto-fonts-emoji
	ttf-font-awesome
	ttf-nerd-fonts-symbols
	ttf-jetbrains-mono-nerd
	ttf-dejavu
	# optional
	# waybar
	less
	# udisks2

)
packages1=(
	cmus
	bluetui
)

missing=()

for pkg in "${packages[@]}"; do
    if ! pacman -Q "$pkg" &> /dev/null; then
        missing+=("$pkg")
    fi
done

if [ ${#missing[@]} -eq 0 ]; then
    echo -e "\nAll packages are installed.\n"
else
	echo -e "\ninstalling...\n${missing[@]}\n"
    sudo pacman -S ${missing[@]}
fi

