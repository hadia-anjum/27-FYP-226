SRC_DIR ?= src
OUT_DIR ?= out

SRC_FILES := $(wildcard $(SRC_DIR)/*.md)
OUT_FILES := $(patsubst $(SRC_DIR)/%.md,$(OUT_DIR)/%.html,$(SRC_FILES))

all: $(OUT_FILES)

$(OUT_DIR)/%.html: $(SRC_DIR)/%.md tools/build.js
	mkdir -p $(OUT_DIR)
	node tools/build.js $< $@

ci: clean all test

clean:
	rm -rf $(OUT_DIR)

test:
	npm test

.PHONY: all ci clean test