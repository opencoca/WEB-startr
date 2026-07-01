# 1. help (default target)
help:
	@echo "================================================"
	@echo "       $(OWNER)/$(PROJECT_NAME) by Startr.Cloud"
	@echo "================================================"
	@echo "This is the default make command."
	@echo "This command lists available make commands."
	@echo ""
	@echo "Usage example:"
	@echo "    make it_run"
	@echo ""
	@echo "Available make commands:"
	@echo ""
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | \
		awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ { \
		if ($$1 !~ "^[#.]") {print $$1}}' | \
		sort | \
		grep -E -v -e '^[^[:alnum:]]' -e '^$$@$$'
	@echo ""

# 2. Dynamic variables (git-derived)
PROJECTPATH := $(shell git rev-parse --show-toplevel)
PROJECT     := $(shell echo $$(basename $(PROJECTPATH)) | tr '[:upper:]' '[:lower:]')
FULL_BRANCH := $(shell git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || echo "develop")
BRANCH      := $(shell echo $(FULL_BRANCH) | sed 's/.*\///' | tr '[:upper:]' '[:lower:]')
TAG         := $(shell git describe --always --tag 2>/dev/null || echo "v0.0.0")

REMOTE_URL   := $(shell git config --get remote.origin.url 2>/dev/null || echo "unknown/unknown")
OWNER        := $(shell echo $(REMOTE_URL) | sed -E 's|.*[:/]([^/]+)/[^/]+(.git)?$$|\1|')
PROJECT_NAME := $(shell echo $(REMOTE_URL) | sed -E 's|.*[:/][^/]+/([^/]+)(.git)?$$|\1|' | sed 's/\.git$$//')

CONTAINER := $(PROJECT)-$(BRANCH)

# 3. Load environment overrides from .env if present
-include .env

# 4. Startr.sh web targets
it_run:
	@bash -c 'bash <(curl -sL startr.sh) run'

it_build:
	@bash -c 'bash <(curl -sL startr.sh) build'

it_build_n_run:
	@bash -c 'bash <(curl -sL startr.sh) build && bash <(curl -sL startr.sh) run'

# 5. Docker lifecycle
it_docker_build:
	docker build -t $(CONTAINER):$(BRANCH) .

it_docker_run: it_docker_build
	docker run -d --name $(CONTAINER) -p 8080:80 $(CONTAINER):$(BRANCH)
	@echo "Site running at http://localhost:8080"

it_docker_build_n_run: it_stop it_docker_run

it_stop:
	-docker stop $(CONTAINER)
	-docker rm $(CONTAINER)

it_clean:
	docker image prune -f
	docker builder prune -f

it_gone: it_stop
	-docker rmi $(CONTAINER):$(BRANCH)

# 6. GHCR push (multi-arch)
ghcr_login:
	@gh auth token | docker login ghcr.io -u $(OWNER) --password-stdin

it_build_multi_arch_push_GHCR: ghcr_login
	docker buildx build --platform linux/amd64,linux/arm64 \
		-t ghcr.io/$(shell echo $(OWNER) | tr '[:upper:]' '[:lower:]')/$(PROJECT):$(BRANCH) \
		-t ghcr.io/$(shell echo $(OWNER) | tr '[:upper:]' '[:lower:]')/$(PROJECT):$(TAG) \
		--push .

# 7. CapRover deploy
HAS_SUBMODULE := $(shell [ -f .gitmodules ] && echo 1)
HAS_CAPROVER  := $(shell which caprover 2>/dev/null && echo 1)

deploy:
	@if [ "$(HAS_CAPROVER)" = "" ]; then \
		echo "CapRover CLI not installed. Run: npm install -g caprover"; exit 1; \
	fi
	@if [ "$(HAS_SUBMODULE)" = "1" ]; then \
		echo "Submodules detected — deploying via tar"; \
		git ls-files --recurse-submodules | tar -czf deploy.tar -T -; \
		npx caprover deploy -t ./deploy.tar; \
		rm ./deploy.tar; \
	else \
		npx caprover deploy; \
	fi

# 8. show_vars + verify
show_vars:
	@echo "=== Dynamic Variables ==="
	@echo "PROJECTPATH=$(PROJECTPATH)"
	@echo "PROJECT=$(PROJECT)"
	@echo "OWNER=$(OWNER)"
	@echo "PROJECT_NAME=$(PROJECT_NAME)"
	@echo "FULL_BRANCH=$(FULL_BRANCH)"
	@echo "BRANCH=$(BRANCH)"
	@echo "TAG=$(TAG)"
	@echo "CONTAINER=$(CONTAINER)"
	@echo "REMOTE_URL=$(REMOTE_URL)"
	@echo ""

verify: show_vars require_gitflow_next
	@echo "=== Targets defined in this Makefile ==="
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | \
		awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ { \
		if ($$1 !~ "^[#.]") {print "  " $$1}}' | \
		sort -u | \
		grep -E -v -e '^  [^[:alnum:]]'
	@echo ""
	@echo "OK: Makefile scaffold verified."

# 9. Git-flow-next release/hotfix flow
require_gitflow_next:
	@if ! git flow version 2>/dev/null | grep -q 'git-flow-next'; then \
		echo "Error: git-flow-next required (Go rewrite). Install: brew install git-flow-next"; \
		exit 1; \
	fi

minor_release: require_gitflow_next
	git flow release start $$(git tag --sort=-v:refname | sed 's/^v//' | head -n 1 | awk -F'.' '{print $$1"."$$2+1".0"}') && echo "or use 'make release_finish' to finish the release"

patch_release: require_gitflow_next
	git flow release start $$(git tag --sort=-v:refname | sed 's/^v//' | head -n 1 | awk -F'.' '{print $$1"."$$2"."$$3+1}') && echo "or use 'make release_finish' to finish the release"

major_release: require_gitflow_next
	git flow release start $$(git tag --sort=-v:refname | sed 's/^v//' | head -n 1 | awk -F'.' '{print $$1+1".0.0"}') && echo "or use 'make release_finish' to finish the release"

hotfix: require_gitflow_next
	git flow hotfix start $$(git tag --sort=-v:refname | sed 's/^v//' | head -n 1 | awk -F'.' '{print $$1"."$$2"."$$3"."$$4+1}') && echo "or use 'make hotfix_finish' to finish the hotfix"

release_finish: require_gitflow_next
	git flow release finish && git push origin develop && git push origin master && git push --tags && git checkout develop

hotfix_finish: require_gitflow_next
	git flow hotfix finish && git push origin develop && git push origin master && git push --tags && git checkout master

# 10. things_clean
things_clean:
	git clean --exclude='!.env*' -Xdf

# 11. .PHONY
.PHONY: help show_vars verify require_gitflow_next \
	minor_release patch_release major_release hotfix \
	release_finish hotfix_finish things_clean \
	it_run it_build it_build_n_run \
	it_docker_build it_docker_run it_docker_build_n_run \
	it_stop it_clean it_gone ghcr_login it_build_multi_arch_push_GHCR \
	deploy
