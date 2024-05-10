build_good:
	cd services/frontend && docker build -t kladnitsky/hw1:good -f ../../homework_1/Dockerfile.good .

build_bad:
	cd services/frontend && docker build -t kladnitsky/hw1:bad -f ../../homework_1/Dockerfile.bad .

run_good:
	docker run -p 8080:8080 -d --name hw1_good -t kladnitsky/hw1:good -v services/files_storage:/usr/share/nginx/html/storage:r

run_bad:
	docker run -p 8080:8080 -d --name hw1_bad -t kladnitsky/hw1:bad -v services/files_storage:/usr/share/nginx/html/storage:r