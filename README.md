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