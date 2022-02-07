#!/bin/sh

update_weather()
{
    weather=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c16- | head -2 | echo " $(xargs)")
}

update_cpu(){
    cpu=$(top -bn2 | grep '%Cpu' | tail -1 | awk '{print "CPU  " 100-$8 "%"}')
}

update_ram(){
    ram=$(free -h | awk '/^M/ {print "RAM  " $3 " / " $2}')
}

update_brightness(){
    brightness=$(cat /sys/class/backlight/acpi_video0/brightness | awk '{print " " int($1*100/7) "%"}')
}

update_audio(){
    audio=$(amixer sget Master | awk '/Left:/ {gsub (/[\[\]]/,""); print $5" "$6}')

    [ ${audio% *} = "0%" ] || [ ${audio#* } = "off" ] && audio=" ${audio% *}" || audio=" ${audio% *}"
}

update_battery() {
    battery=$(acpi | awk '{gsub (",",""); print $3" "$4}')

    [ ${battery% *} = "Discharging" ] && battery=" ${battery#* }" || battery=" ${battery#* }"
}

update_clock(){
    clock=$(date +" %a, %d %b %y, %H:%M")
}

update_status(){
        xsetroot -name " $weather | $cpu | $ram | $brightness | $audio | $battery | $clock"
}

s=0

update_audio && update_brightness && update_ram && update_clock && update_battery && update_status
update_cpu && update_status
update_weather && update_status

while true; do
    sleep 1
    s=$((s+=1))
    
    update_audio && update_brightness
    [ $((s%15)) = 0 ] && update_cpu && update_ram
    [ $((s%60)) = 0 ] && update_clock && update_battery 
    [ $s = 3600 ] && update_weather && s=0
    update_status    
done
