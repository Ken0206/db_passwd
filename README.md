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