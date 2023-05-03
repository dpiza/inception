all:
	docker-compose -f srcs/docker-compose.yml build

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

clear:
	docker system prune -f
	docker run --rm -v /home/dpiza/data/db:/var/lib/mysql ubuntu /bin/bash -c "rm -rf /var/lib/mysql/*"
	docker run --rm -v /home/dpiza/data/wp:/var/www/wordpress ubuntu /bin/bash -c "rm -rf /var/www/wordpress/*"
	docker run --rm -v /home/dpiza/data/wp:/var/www/wordpress ubuntu /bin/bash -c "rm -rf /var/www/wordpress/.*"
