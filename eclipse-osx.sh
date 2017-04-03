# get the local IP address, add it to the xhost allowed IPs
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
#ip=$(ipconfig ifaddr en0)
#echo local ip address: $ip
xhost + $ip


# run eclipse via docker,...
docker run -it --rm \
	-e DISPLAY=$ip:0 \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ${HOME}:/home/developer \
	eclipse:neon eclipse -nosplash
