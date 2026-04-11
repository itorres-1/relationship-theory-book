# Relationship Theory

A book written in LaTeX.

---

## Installation

### 1. Install BasicTeX

```bash
brew install --cask basictex
```

Open a **new terminal** after this so the PATH updates.

### 2. Install required packages

```bash
sudo tlmgr update --self
sudo tlmgr install collection-mathscience latexmk
```

`collection-mathscience` covers math fonts and symbols. `latexmk` is the build tool that handles multi-pass compilation automatically.

### 3. Install VS Code extension

Install **LaTeX Workshop** by James Yu from the VS Code extensions panel.

> Note: if you have **vscode-pdf** installed, uninstall it — it conflicts with LaTeX Workshop's built-in PDF viewer.

---

## Building

From the terminal:

```bash
make        # build → outputs to build/main.pdf
make view   # build + open in Preview
make clean  # delete all build artifacts
```

From VS Code, saving `main.tex` triggers a build automatically.

---

## VS Code Shortcuts

| Action | Shortcut |
|---|---|
| Build project | `Cmd+Alt+B` |
| Open PDF tab (do once, then it stays open) | `Cmd+Alt+V` |
| Forward search (jump from .tex to PDF location) | `Cmd+Alt+J` |
| Show compiler log | `Cmd+Shift+P` → "LaTeX Workshop: Show LaTeX Compiler Log" |
| SyncTeX (click PDF → jump to source) | `Cmd+Click` in PDF |

> Tip: open the PDF tab once with `Cmd+Alt+V`, then just save (`Cmd+S`) — it auto-builds and the tab updates in place.

---

## Project Structure

```
relationship-theory/
├── main.tex                  # Root document — packages, structure, metadata
├── chapters/
│   ├── 00-preface.tex
│   └── 01-introduction.tex   # Add chapters here
├── figures/                  # Drop PDF exports from Affinity Designer here
├── bibliography/
│   └── references.bib        # BibTeX references (unused until you cite something)
├── build/                    # Generated — do not edit (gitignored)
├── Makefile
└── .vscode/
    └── settings.json         # LaTeX Workshop config
```

### Adding a chapter

1. Create `chapters/02-your-title.tex`
2. Add `\input{chapters/02-your-title}` to `main.tex` under `\mainmatter`

### Adding a figure

Export as **PDF** from Affinity Designer, drop in `figures/`, then:

```latex
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{your-figure.pdf}
  \caption{Your caption here}
  \label{fig:your-label}
\end{figure}
```

---

## Math Quick Reference

### Inline vs display math

```latex
Inline: $f(x) = x^2$

Display (centered, numbered):
\begin{equation}
  f(x) = x^2
\end{equation}

Display (unnumbered):
\[
  f(x) = x^2
\]
```

### Aligned equations

```latex
\begin{align}
  f(x) &= x^2 + 2x + 1 \\
       &= (x + 1)^2
\end{align}
```

### Theorem environments

These are pre-configured in `main.tex` and number automatically by chapter:

```latex
\begin{theorem}
  Statement of the theorem.
\end{theorem}

\begin{proof}
  Proof here. The QED box appears automatically.
\end{proof}

\begin{definition}
  A \emph{widget} is...
\end{definition}

\begin{lemma}, \begin{proposition}, \begin{corollary}
\begin{example}, \begin{remark}
```

### Common symbols

| Symbol | LaTeX |
|---|---|
| ∈ | `\in` |
| ⊆ | `\subseteq` |
| ∀ | `\forall` |
| ∃ | `\exists` |
| → | `\to` |
| ⇒ | `\Rightarrow` |
| ⟺ | `\iff` |
| ℝ | `\mathbb{R}` |
| ℕ | `\mathbb{N}` |
| ∞ | `\infty` |
| × | `\times` |
| · | `\cdot` |

---

## Adding References (when needed)

When you're ready to cite sources, re-add to `main.tex`:

```latex
% In the preamble:
\usepackage{natbib}
\bibliographystyle{plainnat}

% At the end of the document (before \end{document}):
\backmatter
\bibliography{bibliography/references}
```

Add entries to `bibliography/references.bib`:

```bibtex
@book{author2020,
  author    = {Last, First},
  title     = {Book Title},
  publisher = {Publisher},
  year      = {2020},
}
```

Cite in text with `\cite{author2020}` or `\citep{author2020}` (parenthetical).

---

## Troubleshooting

**Missing package error** — install it with:
```bash
sudo tlmgr install <package-name>
```

**Build not triggering in VS Code** — check that LaTeX Workshop can find `latexmk`. The full path `/Library/TeX/texbin/latexmk` is set in `.vscode/settings.json` to work around VS Code not inheriting the shell PATH on macOS.

**Stale build artifacts** — run `make clean` then rebuild.
