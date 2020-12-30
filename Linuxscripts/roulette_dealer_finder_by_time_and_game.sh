# Dealer analysis with game selection
#!/bin/bash/

#$1 time - 00:00:00 (HH:MM:SS)
#$2 AM/PM
#$3 date - 0000 (MMDD)
#$4 BlackJack or Roulette or Texas

rday=$(echo $3_Dealer_schedule)

if [ $4 = BlackJack ]
then
grep -i $1 $rday | grep -iw $2 | awk -F" " '{print $1, $2, $3, $4}'

	elif [ $4 = Roulette ]
	then
	grep -i $1 $rday | grep -iw $2 | awk -F" " '{print $1, $2, $5, $6}'


        elif [ $4 = Texas ]
        then
        grep -i $1 $rday | grep -iw $2 | awk -F" " '{print $1, $2, $7, $8}'

else 

echo "Invalid game parameter. Please use BlackJack, Roulette or Texas"

fi
