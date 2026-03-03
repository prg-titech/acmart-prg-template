<h1 align="center">Check the <code>publish</code> Branch for PDF Artifacts</h1>

# LaTeX Compilation with Makefile

This repository contains the paper source `main.tex`, the supplementary source `supplementary/main.tex`, and Makefiles for building both documents.

Faculty members can write review comments using commands like `\HM{...}` to include comments with their initials.

## Prerequisites

Ensure you have the following installed:

- LaTeX distribution (TeX Live, etc.)
- `pdflatex`
- `bibtex`
- `make`

Optional tools:

- `tectonic` for `TEX_ENGINE=tectonic`
- `latexdiff` for `make diff`

## Instructions

### Fork the Repository
Before you start, fork this repository to your own GitHub account.
Click on the "Fork" button at the top right corner of this repository's GitHub page to create your own copy.

### Clone the Repository
```bash
git clone <your-forked-repository-url>
cd <repository-directory>
```

## Build

### Main paper

Build the main paper from the repository root:

```bash
make
```

This generates `main.pdf`.

### Supplementary document

Build the supplementary document from the repository root:

```bash
make supplementary
```

This generates `supplementary/main.pdf`.

You can also build it from inside the `supplementary` directory:

```bash
cd supplementary
make
```

### Use Tectonic instead of pdflatex

Both Makefiles support overriding the TeX engine:

```bash
make TEX_ENGINE=tectonic
make supplementary TEX_ENGINE=tectonic
```

## Clean

### Remove generated files

At the repository root, `make clean` removes auxiliary files and generated PDFs for both the main paper and the supplementary document:

```bash
make clean
```

Inside `supplementary`, `make clean` removes the supplementary auxiliary files and `supplementary/main.pdf`.

## Diff PDF

Generate a diff PDF against a tag or commit:

```bash
make diff DIFFTO=<tag-or-commit>
```

For the supplementary document:

```bash
cd supplementary
make diff DIFFTO=<tag-or-commit>
```

## GitHub CI for Automatic Publish

This repository supports automatic PDF publishing with GitHub Actions. The workflow defined in [`.github/workflows/build-and-publish.yml`](https://github.com/prg-titech/acmart-prg-template/blob/main/.github/workflows/build-and-publish.yml) builds `main.tex` with [Tectonic](https://tectonic-typesetting.github.io/en-US/) on pushes to `main`, weekly scheduled runs, or manual dispatch, then publishes generated PDFs to the `publish` branch for GitHub Pages hosting.
