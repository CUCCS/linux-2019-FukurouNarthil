echo "------------------------------------"
if [ "$1" = "h" ]
then 
	echo "1 top100 hostname"
	echo "2 top100 ip"
	echo "3 top100 url"
	echo "4 different status code"
	echo "5 4xx status code"
	echo "[url]"
elif [ "$1" = "1" ]
then
	grep -oP '^(\w+\.)+[A_Za-z]+' web_log.tsv | sort -n | uniq -c | sort -nr -k1 | head -100
	echo "------------------------------------"
elif [ "$1" = "2" ]
then
	grep -oP '(\d+\.){3}\d+\s' web_log.tsv | sort -nr | uniq -c | sort -nr -k1 | head -100
	echo "------------------------------------"
elif [ "$1" = "3" ]
then
	grep -oP '(\/[^\s]+)+' web_log.tsv | sort -n | uniq -c | sort -nr -k1 | head -100
	echo "------------------------------------"
elif [ "$1" = "4" ]
then
	grep -oP '\s+\d{3}\s+(?=\d+)' web_log.tsv | sort | uniq -c | sort -nr -k1 | awk '{array[$2]=$1; sum+=$1} END { for (i in array) printf "%-20s %-15d %6.6f%%\n", i, array[i], array[i]/sum*100}'
	echo "------------------------------------"
elif [ "$1" = "5" ]
then
	grep -oP '\s+4\d{2}\s+(?=\d+)' web_log.tsv | sort -u | xargs -i sh -c "grep -P '\s+{}(?=\d+)' web_log.tsv | awk '{printf \"%s %d \n\",\$5,\$6}' | sort | uniq -c | sort -nr -k1 | head -10"
	echo "------------------------------------"
else
	grep -P $1'\s+' web_log.tsv | awk '{printf "%s \n",$1}' | sort | uniq -c | sort -nr -k1 | head -100
	echo "------------------------------------"
fi
