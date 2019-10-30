export BIN_DIR=./bin
export PROJ_PATH=github.com/asticode/go-astilectron-bundler

####################################################################################################################
##
## help for each task - https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
##
####################################################################################################################
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


build: ## build astilectron-bundler into ./bin
	@mkdir -p $(BIN_DIR)
	go build -o $(BIN_DIR)/astilectron-bundler $(PROJ_PATH)/astilectron-bundler

install: ## make and install astilectron-bundler into ${GO_PATH}/bin.
	go install -a $(PROJ_PATH)/astilectron-bundler

test: ## run tests
	go test $(PROJ_PATH)/...

fmt: ## run fmt
	go fmt $(PROJ_PATH)/...


