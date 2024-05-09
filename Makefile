hw1/build_good:
	cd services/frontend && docker build -t kladnitsky/hw1:good -f ../../homework_1/Dockerfile.good .

hw1/build_bad:
	cd services/frontend && docker build -t kladnitsky/hw1:bad -f ../../homework_1/Dockerfile.bad .

hw1/run_good:
	docker run -p 8080:8080 -d --name hw1_good -t kladnitsky/hw1:good

hw1/run_bad:
	docker run -p 8080:8080 -d --name hw1_bad -t kladnitsky/hw1:bad