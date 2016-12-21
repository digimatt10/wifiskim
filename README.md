# wifiskim
Bash Shell script to collect wifi probe requests


sort with awk -F\| '{print $3, $4}' wifiskim.dump | sort | uniq -c
