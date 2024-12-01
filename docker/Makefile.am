CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal
SHORT_NAME := $(shell docker image ls | grep ^franklin-resume | grep latest | sed -e's/  */ /g' | cut -d" " -f3)
LATEST :=  $(shell docker image ls | grep ghcr.io/devsecfranklin/franklin-resume | grep latest | sed -e's/  */ /g' | cut -d" " -f3)

.check-env-vars:
	@test $${CR_PAT?Push will fail. You need to export the CR_PAT token for GHCR}

.PHONY: amd64
amd64:  .check-env-vars
	docker compose build amd64
	@echo "Tagging image:  $(shell docker images -q | head -1)"
	docker tag $(shell docker images -q | head -1) gcr.io/gcp-gcs-pso/franklin-test-amd64:latest
	docker push gcr.io/gcp-gcs-pso/franklin-test-amd64:latest

build:
	@if [ "${LATEST}" != "${SHORT_NAME}" ] && [ ! -z "${LATEST}" ]; then \
		echo "Found stale image: ${LATEST}" ;\
		docker image rm -f $(LATEST) ;\
	fi
	docker compose build franklin-resume
	@echo "Tagging image:  $(shell docker images -q | head -1)"
	docker tag $(shell docker images -q | head -1) ghcr.io/devsecfranklin/franklin-resume:latest

clean:
	docker image rm -f $(LATEST)
	@docker system prune -f

push: .check-env-vars
	docker push ghcr.io/devsecfranklin/franklin-resume:latest
	docker push ghcr.io/devsecfranklin/franklin-resume-amd64:latest

run:
	docker run -it ghcr.io/devsecfranklin/franklin-resume:latest bash
