img:=nav-app
tag:=v1.8.0
user:=poridhi
name:=nav-container

build:
	docker build --platform linux/amd64 -t ${user}/${img}:${tag} .

run:
	docker run --platform linux/amd64 --name ${name} -d -p 8080:80 ${user}/${img}:${tag}

push:
	docker push ${user}/${img}:${tag}

clean:
	docker stop ${name}
	docker rm ${name}