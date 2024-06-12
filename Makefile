build_good:
	cd services/frontend && docker build -t kladnitsky/hw1:good -f ../../homework_1/Dockerfile.good .

build_bad:
	cd services/frontend && docker build -t kladnitsky/hw1:bad -f ../../homework_1/Dockerfile.bad .

run_good:
	docker run -p 8080:8080 -d --name hw1_good -v ./services/files_storage:/usr/share/nginx/html/storage -t kladnitsky/hw1:good

run_bad:
	docker run -p 8080:8080 -d --name hw1_bad -v ./services/files_storage:/usr/share/nginx/html/storage -t kladnitsky/hw1:bad

build:
	cd services/frontend && docker build . -t danyakladnitsky/itmo-devopse-course.frontend:$(VER) --no-cache
	cd services/frontend && docker build . -t danyakladnitsky/itmo-devopse-course.backend:$(VER) --no-cache

push:
	docker push danyakladnitsky/itmo-devopse-course.frontend:$(VER)
	docker push danyakladnitsky/itmo-devopse-course.backend:$(VER)

update_deployments:
	cd homework_4 && kubectl apply -f backend/deployment.yml
	cd homework_4 && kubectl apply -f frontend/deployment.yml

update: build push

update_apply: update update_deployments