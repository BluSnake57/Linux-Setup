#crontab -l > crontab_old
#cp crontab_old crontab_new
#echo "@reboot sh $(pwd;)/onrebutt.sh" >> crontab_new
./fixcrontab.sh
#cd "$(dirname "$0")"
touch ./rebuttworked.txt
