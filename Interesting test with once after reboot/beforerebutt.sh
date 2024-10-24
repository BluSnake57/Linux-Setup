crontab -l > crontab_old
cp crontab_old crontab_new
echo "@reboot sh $(pwd;)/onrebutt.sh" >> crontab_new
crontab crontab_new
rm crontab_new

