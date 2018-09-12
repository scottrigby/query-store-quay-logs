VERSION ?= latest

.PHONY: build
build:
	go build -o build/query-store-quay-logs main.go

.PHONY: docker-build
docker-build:
	GOOS=linux GOARCH=amd64 go build -o build/query-store-quay-logs *.go
	docker build -t mattfarina/query-store-quay-logs:$(VERSION) .

.PHONY: docker-push
docker-push:
	docker push mattfarina/query-store-quay-logs