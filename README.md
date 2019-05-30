### db_passwd.sh
```
監視 password.txt 內容是否已變更，
如已變更，同步更新到 config_file 內的
7,DB2 DB USER PASSWORD  :10-xxxxxxxxxx
改為︰
7,DB2 DB USER PASSWORD  :10-??????????
?????????? 是新的 password.txt 內容
```
---
### mkpasswd.sh
```
每幾秒產生密碼並存到 password.txt
```
---
### etc_systemd_system_dbpasswd.service
```
systemd service config

RHEL7 / CentOS7 respawn

於 /etc/systemd/system/ 新增一個檔案 xxx.service
(檔名請自定，檔名就是 service name，附檔名.service)
內容︰
[Unit]
Description=respawn demo
After=getty.target network.target

[Service]
Type=simple
User=root
Group=root
Restart=always
ExecStart=/path/application options
TimeoutSec=10

[Install]
WantedBy=multi-user.target


以上 xxx.service 內容︰
Description 請自行定義
ExecStart 請自行定義要 respawn 的程式和參數

重整服務
systemctl daemon-reload

設定開機自動執行︰
systemctl enable xxx

目前執行情況︰
systemctl status xxx

立即執行︰
systemctl start xxx

立即停止執行︰
systemctl stop xxx

如果不再需要 respawn︰
systemctl stop xxx
systemctl disable xxx
mv /etc/systemd/system/xxx.service /etc/systemd/system/xxx.service.backup


鳥哥認識系統服務 (daemons)
http://linux.vbird.org/linux_basic/0560daemons.php#systemd_cfg





RHEL6 / CentOS6


於 /etc/init/ 新增一個檔案 xxx.conf(檔名請自定)
內容︰
start on runlevel [2345]
stop on runlevel [!2345]
respawn
exec /path/application options


以上 xxx.conf 內容︰
exec 請自行定義要 respawn 的程式和參數


讀取設定︰
initctl reload-configuration

啟動:
initctl start xxx

停止︰
initctl stop xxx

如果不再需要 respawn︰
initctl stop xxx
mv /etc/init/xxx.conf /etc/init/xxx.conf.backup
initctl reload-configuration


```