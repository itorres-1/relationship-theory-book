MAIN = main
BUILD_DIR = build

.PHONY: all clean view

all:
	mkdir -p $(BUILD_DIR)
	latexmk -pdf -output-directory=$(BUILD_DIR) $(MAIN).tex

view: all
	open $(BUILD_DIR)/$(MAIN).pdf

clean:
	rm -rf $(BUILD_DIR)
