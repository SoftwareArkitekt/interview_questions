#!/bin/bash
# Alright, I've never touched Docker before, so this one required some online reading.
# It took an hour and a half or so to figure out images vs containers, but it is a pretty slick system.
# Ran on https://labs.play-with-docker.com/

docker pull alpine
docker run -td alpine 								# If we really wanted to, we could grab the sha256 output of this command for the $container_id.
container_id=$(docker ps -lq)						# Instead I chose to do it here just to get familiar with Docker.
custom_image_name="alpine_curl_image"
docker exec $container_id apk add curl
docker commit $container_id $custom_image_name
docker stop $container_id
docker save $custom_image_name > alpine_curl.tar

# To clean out your image list, import, and test:
# docker rmi $custom_image_name
# docker load < alpine_curl.tar
# docker run -td $custom_image_name
# new_container_id=$(docker ps -lq)
# docker exec $new_container_id curl ifconfig.me
