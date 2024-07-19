.PHONY: help start-env compose-build compose

-include .env
export

# target: help - Display callable targets.
help:
	@egrep "^#" Makefile


# target: start-env - Start the environment for the first time.
start-env: 
	@$(MAKE) --no-print-directory compose-build

# target: compose build - docker-compose command.
compose-build:
	@read -p "Are you sure you want to build the environment? THIS WILL PERMANENT DELETE AND REINSTALL PRESTASHOP [y/N] " -n 1 -r; \
	echo ; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		docker-compose up -d --build; \
	fi

# target: compose - docker-compose command.
compose:
	docker-compose up -d