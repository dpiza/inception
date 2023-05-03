DATA	=	/home/${USER}/data

all: up

up:
	mkdir -p ${DATA}/wp ${DATA}/db
	docker-compose -f srcs/docker-compose.yml up --build -d
	grep -qxF '127.0.0.1 dpiza.42.fr' /etc/hosts || \
	echo '127.0.0.1 dpiza.42.fr' >> /etc/hosts

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

clean:	down
	docker system prune -f
	docker run --rm -v ${DATA}/db:/tmp/db debian:buster /bin/bash -c "rm -rf /tmp/db/*"
	docker run --rm -v ${DATA}/wp:/tmp/wp debian:buster /bin/bash -c "rm -rf /tmp/wp/*"

fclean: clean
	sudo rm -rf ${DATA}
	sudo sed -i".bak" "/dpiza.42.fr/d" /etc/hosts

re: fclean all

.PHONY: all up down ps clean fclean re 