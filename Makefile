.PHONY: deploy

DEPLOY_HOST=192.168.1.62
DEPLOY_PATH=~/raspi-metrics/

deploy:
	scp -rC * $(DEPLOY_HOST):$(DEPLOY_PATH)
