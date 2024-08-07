OUT_DIR=docs
STYLES_DIR=styles
STYLE=chmduquesne

ORG=resume.md
BASE=$(basename $(ORG))

all: html

init:
	mkdir -p $(OUT_DIR)

pdf: init html
	wkhtmltopdf $(OUT_DIR)/index.html --disable-javascript $(OUT_DIR)/$(BASE)_full.pdf
	pdftk $(OUT_DIR)/$(BASE)_full.pdf cat 1 output $(OUT_DIR)/$(BASE).pdf

html: init
	pandoc --standalone --include-in-header $(STYLES_DIR)/$(STYLE).css \
           --lua-filter=pdc-links-target-blank.lua \
           --from markdown --to html \
           --template template.html \
           --output $(OUT_DIR)/index.html $(ORG) metadata.yaml


clean:
	rm -f $(OUT_DIR)/*
