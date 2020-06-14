print_date(){
	date '+%Y年%m月%d日 %H:%M'
}

print_mem(){
	memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	echo -e "$memfree"
}

xsetroot -name "[IP:$(ifconfig ens33 | grep "inet"| awk '{print $2}'| sed -n 1p)]>[Men:$(print_mem)M]in[$(print_date)] "
