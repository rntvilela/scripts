#!/bin/sh

update_cpu(){
    cpu=$(top -bn2 | grep '%Cpu' | tail -1 | awk '{print "CPU  " 100-$8 "%"}')
}

update_ram(){
    ram=$(free -h | awk '/^M/ {print "RAM  " $3}')
}

update_brightness(){
    brightness=$(awk '{print " " int($1*100/7) "%"}' < /sys/class/backlight/acpi_video0/brightness)
}

update_audio(){
    audio=$(amixer sget Master | awk '/Left:/ {gsub (/[\[\]]/,""); print $5" "$6}')

    [ "${audio% *}" = "0%" ] || [ "${audio#* }" = "off" ] && audio=" ${audio% *}" || audio=" ${audio% *}"
}

update_battery() {
    battery=$(acpi | awk '{gsub (",",""); print $3" "$4}')

    [ "${battery% *}" = "Discharging" ] && battery=" ${battery#* }" || battery=" ${battery#* }"
}

update_clock(){
    clock=$(date +" %a, %d %b %y, %H:%M")
}

update_status(){
        xsetroot -name " $cpu | $ram | $audio | $brightness | $battery | $clock"
}

s=0
update_audio && update_brightness && update_ram && update_clock && update_battery && update_status
update_cpu && update_status

while true; do
    sleep 1
    s=$((s+=1))
    
    update_audio && update_brightness
    [ $((s%15)) = 0 ] && update_cpu && update_ram
    [ $s = 60 ] && update_clock && update_battery && s=0
    update_status    
done
