# Generated using the Gemini LLM.
# Makefile for LaTeX compilation with src and out directories

# Variables
LATEXMK = latexmk
MAIN_TEX = main.tex
SRC_DIR = src
OUT_DIR = $(CURDIR)/out
MAIN_SRC_FILE = $(SRC_DIR)/$(MAIN_TEX)
MAIN_PDF = $(OUT_DIR)/$(MAIN_TEX:.tex=.pdf)

# Phony targets (targets that are not actual files)
.PHONY: all clean

# Default target: compile the main LaTeX file
all: $(MAIN_PDF)

# Rule to compile the LaTeX document
$(MAIN_PDF): $(MAIN_SRC_FILE) | $(OUT_DIR)
	$(LATEXMK) -pdf -cd -output-directory=$(OUT_DIR) -aux-directory=$(OUT_DIR) $(MAIN_SRC_FILE)

# Rule to create the output directory if it doesn't exist
$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# Clean up generated files
clean:
	$(LATEXMK) -C -output-directory=$(OUT_DIR) -aux-directory=$(OUT_DIR) $(MAIN_SRC_FILE)
	# The following line might be needed if latexmk -C doesn't remove everything from OUT_DIR
	# or if other files are generated that latexmk doesn't know about.
	# Be cautious with rm -rf
	# rm -rf $(OUT_DIR)/*
