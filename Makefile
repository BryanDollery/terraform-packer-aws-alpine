VER=15

build:
	docker build --tag bryandollery/terraform-packer-aws-alpine:$(VER) .
	docker tag  bryandollery/terraform-packer-aws-alpine:$(VER) bryandollery/terraform-packer-aws-alpine:latest

run:
	docker run -it \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v tf-plugin-cache:/plugin-cache \
		-v $$(pwd):/work \
		-v $$HOME:/host \
		-v aws:/root/.aws \
		-v /mnt/c/Users/bryan:/bryan \
		--name pawst \
		bryandollery/terraform-packer-aws-alpine:$(VER)

bash:
	docker exec -it pawst

kill:
	docker rm -f pawst

stop: kill

push:
	docker push bryandollery/terraform-packer-aws-alpine:$(VER)
	docker push bryandollery/terraform-packer-aws-alpine:latest
