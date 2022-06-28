#!/bin/bash
echo "Welcome to the Particle Express Device Removal Tool!\n"
read -p 'Please tell me the filename of your Devices list (e.g. devices.txt): ' devicelist
echo "....."
read -p 'What is the Product ID (e.g. 1234): ' productID
echo "....."
read -p 'Now, what is the Product Token (e.g. 123445566777): ' token
echo "....."
echo "Thank you, please standby while I get to work!"

cat $devicelist | while read deviceID || [[ -n $deviceID ]];
do
RUNME=$(
    curl -X DELETE https://api.particle.io/v1/products/$productID/devices/$deviceID/owner \
       -d access_token=$token)
echo $RUNME

echo -e "\nParticle Express Device Removal is now going to unclaim these devices..."
done
