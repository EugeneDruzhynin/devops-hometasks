#!/bin/bash
docker run -d --name site2 -p 8081:80 hometask-image
docker exec -d site2 rm /var/www/html/index.php
docker cp index.html site2:/var/www/html