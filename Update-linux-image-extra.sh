#!/bin/bash
#Var
#!/bin/bash
var=$(< kernel.txt);
file="kernel.txt"
if [ -f "$file" ]
then
echo "$file found."
else
echo "$file not found."
echo "script run - uname -r "
uname -r >> kernel.txt
fi
rm -f umame.txt
uname -r >> umame.txt
u=$(<umame.txt);
#echo "$u."
if [ "$var" == "$u" ]
then
echo "Same var."
echo "Same var - $var ." >> update.log;
else
echo "stop docker service"
service docker stop
apt-get -y install linux-image-extra-$(uname -r)
echo "rm  -f  kernel.txt."
rm  -f  kernel.txt 
uname -r >> kernel.txt
echo "The kernel updated." >> update.log;
echo "start docker service. "
service docker start
fi