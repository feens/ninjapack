if [[ -e /usr/local/bin/atom ]]; then
	export EDITOR="/usr/local/bin/atom -w"
elif [[ -e /usr/bin/nano ]]; then
	export EDITOR=/usr/bin/nano
else
	echo "Neither Atom nor nano present, enjoy your VI."
fi
