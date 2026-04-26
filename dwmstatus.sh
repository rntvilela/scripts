#!/bin/sh

update_cpu() {
    cpu=$(top -bn1 | grep '%Cpu' | head -1 | awk -F ',' '{print "CPU ", 100-$4 "%"}')
}

update_ram() {
    ram=$(free -h | awk '/^M/ {print "RAM ", $3}')
}

update_brightness() {
	brightness=$(awk '{print "", int($1*20/51) "%"}' < /sys/class/backlight/amdgpu_bl0/brightness)
}

update_audio() {
    audio=$(amixer sget Master | awk '/Left:/ {gsub (/[\[\]]/,""); print $5, $6}')

    [ "${audio% *}" = "0%" ] || [ "${audio#* }" = "off" ] && audio=" ${audio% *}" || audio=" ${audio% *}"
}

update_battery() {
    battery=$(acpi | grep -v "unavailable" | awk '{gsub (",|Not",""); print $3, $4}')

    [ "${battery% *}" = "Discharging" ] && battery=" ${battery#* }" || battery=" ${battery#* }"
}

update_clock() {
    clock=$(date +" %a, %d %b %y, %H:%M")
}

update_temp() {
	temp=$(awk '{printf " %.1f°C\n", $1/1000}' /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon4/temp1_input)
}

update_status() {
    xsetroot -name " $cpu  | $ram | $temp | $audio | $brightness | $battery | $clock"
}

s=0
update_clock && update_battery && update_temp

while true 
do
    update_audio && update_brightness
    [ $((s%10)) = 0 ] && update_cpu && update_ram
    [ $s = 60 ] && update_clock && update_battery && update_temp && s=0
    update_status   

    sleep 1
    s=$((s+=1)) 
done
