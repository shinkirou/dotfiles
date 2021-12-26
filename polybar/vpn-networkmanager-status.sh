#!/bin/sh

vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"

if [ -n "$vpn" ]; then
	echo " %{F#3F5360}| %{F-} %{F#9E9E9E}%{T5}%{T-}%{F-} $vpn"
else
	echo ""
fi
