#!/bin/bash

browser=surf

declare -A sites
sites+=(
[ArchLinux]="https://archlinux.org/"
[DuckDuckGo]="https://duckduckgo.com/"
[Google]="https://www.google.com/"
[TypingClub]="https://www.typingclub.com/"
)

choice=$(printf "%s\n" "${!sites[@]}" | dmenu -i -c -l 4 -fn monospace-16 -p $browser)

# Execute choice if dmenu returns ok:
[ $? = 0 ] && $browser ${sites[$choice]}
