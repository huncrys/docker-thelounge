NAME := huncrys/thelounge

webirc:
	@docker build -t "${NAME}:webirc" --build-arg BRANCH=webirc .

znc:
	@docker build -t "${NAME}:znc-fixes" --build-arg BRANCH=znc-fixes .
 
push:
	@docker push -a "${NAME}"
