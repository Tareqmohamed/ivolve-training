#!/bin/bash

# Loop through all clients in the range 192.168.1.1 to 192.168.1.254
for ((i=1; i<=254; i++))
do
    # Construct the IP address
    ip="192.168.1.$i"

    # Ping the client
    ping -c 1 $ip > /dev/null

    # Check the exit status of the ping command
    if [ $? -eq 0 ]; then
        echo "Ping to $ip successful"
    else
        echo "Ping to $ip failed"
    fi
done