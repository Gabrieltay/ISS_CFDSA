# create the network
docker network create nw-net 

# create the volumne
docker volume create nw-vol

# pull db image
docker pull stackupiss/northwind-db:v1

# run db image
#docker run -d -p 3306:3306 -v nw-vol:/var/lib/mysql stackupiss/northwind-db:v1
docker run -d --name nwdb --network nw-net -v nw-vol:/var/lib/mysql stackupiss/northwind-db:v1

# run the web app
docker run -d -p 8080:3000 --name nwapp --network nw-net -e DB_HOST=nwdb -e DB_USER=root -e DB_PASSWORD=changeit stackupiss/northwind-app:v1


# docker run -ti --rm --network nw-net nicolaka/netshoot:v0.5 bash

