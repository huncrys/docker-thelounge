NAME := huncrys/thelounge

webirc:
	@docker build --no-cache -t "${NAME}:webirc" --build-arg BRANCH=webirc .

znc:
	@docker build --no-cache -t "${NAME}:znc-fixes" --build-arg BRANCH=znc-fixes .
 
push:
	@docker push -a "${NAME}"
