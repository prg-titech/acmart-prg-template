<h1 align="center">Check the <code>publish</code> Branch for PDF Artifacts</h1>

# LaTeX Compilation with Makefile

This repository contains the LaTeX source file `main.tex` and a Makefile to facilitate the compilation process using the `acmart` class.

Faculty members can write review comments using commands like `\HM{...}` to include comments with their initials.

## Prerequisites

Ensure you have the following installed on your system:

- LaTeX distribution (TeX Live, etc.)
- `pdflatex`
- `bibtex`

## Instructions

### Fork the Repository
Before you start, fork this repository to your own GitHub account.
Click on the "Fork" button at the top right corner of this repository's GitHub page to create your own copy.

### Clone the Repository
```bash
git clone <your-forked-repository-url>
cd <repository-directory>
```

## How to make your paper
### Compile the LaTeX Document

Simply run the make command in the terminal:

```bash
make
```

### Clean Up Auxiliary Files
To remove auxiliary files generated during the compilation, use:

```bash
make clean
```

### Full Clean-Up

```bash
make distclean
```

## GitHub CI for Automatic Publish

This repository supports automatic PDF publishing with GitHub Actions. The workflow defined in [`.github/workflows/build-and-publish.yml`](https://github.com/prg-titech/acmart-prg-template/blob/main/.github/workflows/build-and-publish.yml) builds `main.tex` with [Tectonic](https://tectonic-typesetting.github.io/en-US/) on pushes to `main`, weekly scheduled runs, or manual dispatch, then publishes generated PDFs to the `publish` branch for GitHub Pages hosting.
