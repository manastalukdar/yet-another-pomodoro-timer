backend:
	cd app/backend && $(MAKE) clean && $(MAKE) all

cli:
	@echo WIP

frontend:
	@echo WIP

all: backend cli frontend
