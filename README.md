# LaTeX Compilation with Makefile

This repository contains the LaTeX source file `main.tex` and a Makefile to facilitate the compilation process using the `acmart` class.

## Prerequisites

Ensure you have the following installed on your system:

- LaTeX distribution (TeX Live, MiKTeX, etc.)
- `pdflatex`
- `bibtex`

## Files in this Repository

- `main.tex`: The main LaTeX source file.
- `Makefile`: The Makefile to automate the compilation process.

## Compilation Instructions

To compile the `main.tex` file and generate a PDF, follow these steps:

1. Clone the Repository:

   ```bash
   git clone <repository-url>
   cd <repository-directory>

2. Compile the LaTeX Document:

Simply run the make command in the terminal:

```bash
make
```

3. Clean Up Auxiliary Files:
To remove auxiliary files generated during the compilation, use:

```bash
make clean
```

4. Full Clean-Up:

```bash
make distclean
```