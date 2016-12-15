  
  IP information of running Container
===================

- - - - 

This simple container will display the following information when you see it on web browser -- 
* IPv4 adress
* IPv6 address as well
* Hostname


How to Build --
  ```javascript
sudo docker build -t ipshop .
```  


How to run --
  ```javascript
sudo docker run -d -p 8080:80 --name myAwasomeContainer ipshop
```  


How to check --
  Open up web browser and enter Docker Host DNS or IP and then Port 8080
