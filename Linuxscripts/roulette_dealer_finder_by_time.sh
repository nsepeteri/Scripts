# Dealer analysis
#!/bin/bash/

#$1 is time - 00:00:00 (HH:MM:SS)
#$2 is AM/PM
#$3 is date - 0000 (MMDD)

rday=$(echo $3_Dealer_schedule)

grep -i $1 $rday | grep -iw $2 | awk -F" " '{print $1, $2, $5, $6}'
