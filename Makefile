REPO = charts-test
NAMESPACE = mhrabovcin

.PHONY: lint
lint:
	helm lint source/*

.PHONY: package 
package: lint
	helm package source/*

.PHONY: index 
index:
	helm repo index --url https://$(NAMESPACE).github.io/$(REPO)/ .

.PHONY: all
all: package index

