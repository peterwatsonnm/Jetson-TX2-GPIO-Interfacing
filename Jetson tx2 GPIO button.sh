#shell script to interpret GPIO button input on GPIO pin 7  (gpio 396)
#must have root access for this script

cd /sys/class/gpio/

echo 398 > export #export GPIO pin to the user space

cd gpio398/

echo in > direction

cat direction #check current direction
sleep 1
cat edge
sleep 1
cat value

#loop that runs looking for a change in voltage on pin 398
variable=$( cat value )
while [ "$variable" -eq 0 ];do
	variable=$(cat value)
	if [ "$variable" -eq 1 ]; then
		echo $variable equals one
		echo test succesfu
	fi	
done


                cd /sys/class/gpio/ #returns to gpio/ directory so that you can unexport

                echo 398 > unexport #unexport pin 396

