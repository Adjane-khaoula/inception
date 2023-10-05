COMPOSE_FILE = srcs/docker-compose.yml

up:
	@docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	@docker-compose -f $(COMPOSE_FILE) down

clean-volumes:
	@docker-compose -f $(COMPOSE_FILE) down -v

clean-images:
	@docker rmi -f `docker images -aq`

clean-hostv:
	@sudo rm -r /home/kadjane/data/mariadb/*
	@sudo rm -r /home/kadjane/data/wordpress/*

clean: clean-volumes clean-images 

fclean: clean clean-hostv
	@docker system prune -f

re: fclean up