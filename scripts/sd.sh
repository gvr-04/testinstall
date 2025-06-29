read -p "Do you want to proceed? (Y/n): " confirmation

case "$confirmation" in
    [nN]|[nN][oO])
        echo "Enjoy..."
        exit 0
        ;;
    *)
		echo "powering off..."
		sleep 5
		systemctl poweroff
        ;;
esac
