.PHONY: all main clean distclean diff

# === User Configurable ===

MAIN ?= main
ROOT_DIR ?= ..

TEX_ENGINE ?= pdflatex
TEX_ENGINE_OPTIONS ?= -interaction=nonstopmode -file-line-error -synctex=1
BIB_ENGINE ?= bibtex

# Diff target baseline tag or commit
DIFFTO ?= <your-default-tag-here>

# =========================

LATEX := $(TEX_ENGINE) $(TEX_ENGINE_OPTIONS)
TEX_PATHS := .:$(ROOT_DIR):
BST_PATHS := .:$(ROOT_DIR):
BIB_PATHS := .:$(ROOT_DIR):

MAIN_DEPS := \
	$(MAIN).tex \
	$(ROOT_DIR)/main.bib \
	$(wildcard $(ROOT_DIR)/*.cls $(ROOT_DIR)/*.sty $(ROOT_DIR)/*.bst $(ROOT_DIR)/*.bbx $(ROOT_DIR)/*.cbx $(ROOT_DIR)/*.dbx)

MAIN_AUX := \
	$(MAIN).aux \
	$(MAIN).bbl \
	$(MAIN).blg \
	$(MAIN).fdb_latexmk \
	$(MAIN).fls \
	$(MAIN).log \
	$(MAIN).loe \
	$(MAIN).out \
	$(MAIN).synctex.gz \
	$(MAIN).toc

all: $(MAIN).pdf

main: $(MAIN).pdf

$(MAIN).pdf: $(MAIN_DEPS)
	@echo "[INFO] Compiling $(MAIN).tex with $(TEX_ENGINE)"
ifeq ($(TEX_ENGINE),tectonic)
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) -Z continue-on-errors $(MAIN).tex
else
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) $(MAIN).tex
	-TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(BIB_ENGINE) $(MAIN)
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) $(MAIN).tex
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) $(MAIN).tex
endif
	@echo "[INFO] PDF generated: $@"

diff:
	@echo "[INFO] Generating latexdiff with DIFFTO = $(DIFFTO)"
	@if [ "$(DIFFTO)" = "<your-default-tag-here>" ]; then \
		echo "Error: DIFFTO not set. Usage: make diff DIFFTO=<tag-or-commit>"; \
		exit 1; \
	fi
	@if content=$$(git show $(DIFFTO):supplementary/$(MAIN).tex 2>/dev/null); then \
		printf '%s\n' "$$content" > $(MAIN)_old.tex; \
		echo "[INFO] Successfully extracted supplementary/$(MAIN).tex from $(DIFFTO)"; \
	else \
		echo "[ERROR] Failed to extract supplementary/$(MAIN).tex from $(DIFFTO)."; \
		exit 1; \
	fi
	latexdiff --flatten \
		--append-safecmd="label" \
		--exclude-textcmd="section,subsection" \
		--exclude-safecmd="cite" --exclude-safecmd="ref" --exclude-safecmd="eqref" \
		--exclude-safecmd="url" --exclude-safecmd="href" --exclude-safecmd="footnote" \
		--exclude-safecmd="caption" --exclude-safecmd="includegraphics" \
		--exclude-safecmd="input" --exclude-safecmd="addcontentsline" \
		--exclude-safecmd="addtocontents" --exclude-safecmd="addtocounter" \
		--exclude-safecmd="addtolength" --exclude-safecmd="addvspace" \
		--exclude-safecmd="author" --exclude-safecmd="title" --exclude-safecmd="date" \
		--exclude-safecmd="maketitle" --exclude-safecmd="thanks" \
		--exclude-safecmd="footnotemark" --exclude-safecmd="footnotetext" \
		--config='PICTUREENV=(?:picture|DIFnomarkup|lstlisting)[\w\d*@]*' \
		$(MAIN)_old.tex $(MAIN).tex > $(MAIN)_diff.tex
ifeq ($(TEX_ENGINE),tectonic)
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) -Z continue-on-errors $(MAIN)_diff.tex
else
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) $(MAIN)_diff.tex
	-TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(BIB_ENGINE) $(MAIN)_diff
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) $(MAIN)_diff.tex
	TEXINPUTS=$(TEX_PATHS) BSTINPUTS=$(BST_PATHS) BIBINPUTS=$(BIB_PATHS) \
		$(LATEX) $(MAIN)_diff.tex
endif
	@echo "[INFO] Diff PDF generated: $(MAIN)_diff.pdf"

clean:
	$(RM) $(MAIN_AUX)
	$(RM) $(MAIN)_old.tex $(MAIN)_diff.tex $(MAIN)_diff.pdf
	$(RM) $(MAIN)_diff.aux $(MAIN)_diff.bbl $(MAIN)_diff.blg $(MAIN)_diff.fls
	$(RM) $(MAIN)_diff.log $(MAIN)_diff.loe $(MAIN)_diff.out $(MAIN)_diff.synctex.gz
	$(RM) $(MAIN).pdf

distclean: clean
