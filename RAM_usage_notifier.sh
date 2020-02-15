#!/bin/sh
percentFree=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1);
echo $percentFree;
## upper limit of RAM usage. Currently it is set for 90% and above.
if [ $percentFree -ge 90 ]; then
	## Set email address to send
        echo "Low memory on server as on $(date)" |
     mail -s "Alert: Server running low on memory $percentFree%" test@gmail.com
fi
