# thesis-tikz

Standalone TikZ/PGF figures for my master's thesis. Each figure lives in its own subdirectory under `figures/` and compiles to a PDF that the thesis includes via `\includegraphics`.

## Structure

```
preamble.tex          shared packages, fonts, colors, and TikZ styles
figures/
  <figure-name>/
    <figure-name>.tex  standalone figure source
    <figure-name>.pdf  compiled output (referenced by thesis)
    csvtables/         data files, if any
```

## Makefile

| Command        | Effect                                      |
|----------------|---------------------------------------------|
| `make`         | Compile all figures that are out of date    |
| `make clean`   | Remove aux/log/synctex files                |
| `make distclean` | `clean` + remove all PDFs                |

Figures are rebuilt automatically when their `.tex`, `preamble.tex`, or any `.csv` asset changes. pdflatex runs from each figure's own directory so relative paths (e.g. `csvtables/latencies.csv`) resolve correctly.

## Adding a new figure

1. Create `figures/<name>/` and add `<name>.tex` starting with:
   ```latex
   \documentclass[tikz, border=5pt]{standalone}
   \input{preamble}
   \begin{document}
   % ... tikzpicture or pgfplots axis ...
   \end{document}
   ```
2. Run `make` — the new figure is picked up automatically.
3. In the thesis: `\includegraphics[width=\linewidth]{path/to/figures/<name>/<name>.pdf}`
