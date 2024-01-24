include srcs/.env

all:	$(WP_VOLUME_PATH) $(MARIADB_VOLUME_PATH)
		docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down -v

re: fclean
	$(MAKE) all

clean:
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean:
	rm -rf $(WP_VOLUME_PATH) $(MARIADB_VOLUME_PATH)

$(WP_VOLUME_PATH):
	mkdir -p $(WP_VOLUME_PATH)

$(MARIADB_VOLUME_PATH):
	mkdir -p $(MARIADB_VOLUME_PATH)

.PHONY: all re down clean fclean