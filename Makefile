SHELL := /bin/bash
SRC_DIR := src
OUT_DIR := out
SOURCES := $(wildcard $(SRC_DIR)/*.md)
OUTPUTS := $(patsubst $(SRC_DIR)/%.md,$(OUT_DIR)/%.html,$(SOURCES))

.PHONY: all deps check lint test package clean ci help

all: test ## build and test everything (default)

node_modules: package-lock.json
	npm ci
	@touch node_modules

deps: node_modules ## install exactly what the lock file says

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.html: $(SRC_DIR)/%.md package-lock.json | $(OUT_DIR) node_modules
	@echo " BUILD $< -> $@"
	node tools/build.js $< $@

check: node_modules ## fail early if there is nothing to build
	@test -d $(SRC_DIR) || { echo "ERROR: source directory $(SRC_DIR) not found"; exit 1; }
	@test -n "$(SOURCES)" || { echo "ERROR: no .md files found in $(SRC_DIR)"; exit 1; }
	@echo "check: $(words $(SOURCES)) source file(s) in $(SRC_DIR)"

build: $(OUTPUTS) ## build every out-of-date page

lint: node_modules ## static analysis: seconds, so it runs first
	@node ./node_modules/eslint/bin/eslint.js .

test: build ## run the test suite against what was built
	@node --test

package: test ## produce the versioned artifact
	@tar -czf package.tgz $(OUT_DIR) package.json

clean: ## remove all generated files
	rm -rf $(OUT_DIR) coverage *.tgz node_modules
	
ci: clean deps check lint test package ## everything, in pipeline order
