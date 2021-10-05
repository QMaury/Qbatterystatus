# Qbatterystatus
Program to let you know what your battery status

I made this because I was made that i3wm doesnt have a battery status reminder thing, and I found myself running out of battery simpl because I forgot to check occasionally.

This program literally just echoes you battery percentage and sends it to the desktop using `notify-send`.
 
# setup (long and convoluted cuz im retarded)

make sure you stick the script into your /bin/ because im retarded and can't do a makefile

of course, the program is pointless if it isn't automated. so to set it up you need a cron job.

first install `cronie` (its on the AUR, if you're an Arch User)

once you got it installed, the daemon should activate automatically but make sure its running just in case by running:
`# sudo sv status cronie`

then run `crontab -e` and write this:
`*/10 * * * * export DISPLAY=:0 ; export DBUS_SESSION_BUS_ADDRESS=$(cat /tmp/dbustempvar); batterystatus.sh`

the `*/10 * * * *` bit makes it so that the job runs every 10 minutes. you can chage it to `*/15` for every 15 minutes or `*/20`for 20, but make sure its in that format

now, you got the cronjob setup, but you gotta do one last thing before it works properly. 

you just need to stick this line into your i3config file.
`exec --no-startup-id "echo $DBUS_SESSION_BUS_ADDRESS > /tmp/dbustempvar"`

now, assuming you did everything right, you should have a popup like this appearing ever couple of minutes:
![image](https://user-images.githubusercontent.com/87496773/136070136-c057666e-c0b5-4ccc-b4c5-8078e2f22f29.png)

# Dependencies: 
notify-send |
cronie
