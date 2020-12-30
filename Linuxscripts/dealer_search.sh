# Dealer analysis
#!/bin/bash/


grep -i '02:00:00 PM' $1 | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_working_during_losses

