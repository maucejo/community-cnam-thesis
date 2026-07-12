#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/swank-tex:0.1.0": LaTeX

#show: chapter-nonum

= Introduction

== Context and goals

Doctoral candidates at Cnam must write their thesis according to specific requirements: page layout, fonts, colors, and document structure must follow institutional rules. However, not everyone wants to use #LaTeX, which is often perceived as complex. Since 2023, Typst has emerged as a modern and efficient alternative. Typst is a markup language for producing high-quality documents with concise syntax, and it is especially suited to thesis writing thanks to native support for references, figures, tables, and equations.

The purpose of this guide is to present the Typst template for Cnam theses and provide practical usage instructions. It is not a full introduction to Typst itself, but a focused guide for thesis writing with this template.

For more information about Typst, see the #link("https://typst.app/docs/", "official Typst website") and the book #link("https://github.com/CRStefano/Typst-Handbook-A-Comprehensive-Guide/blob/main/TYPST%20HANDBOOK_FROM%20ZERO%20TO%20HERO_STEFANO%20COELATI%20RAMA_EN.pdf", "Typst Handbook: From Zero to Hero") by Stefano Coelati Rama.

== Guide structure

This guide is organized into seven thematic chapters:

+ *General usage* -- General instructions for using the `cnam-thesis` template.

+ *Document formatting* -- Heading hierarchy, numbering, cross-references, lists, etc.

+ *Figures and tables* -- Image insertion, captions, table formatting, subfigures, and more.

+ *Equations and algorithms* -- Equation syntax and algorithm insertion.

+ *Information boxes* -- Box types, styles, colors, icons, etc.

+ *References and glossary* -- Bibliography, file formats, glossary tools, etc.

+ *Review annotations* -- Margin notes, comments, collaborative review.

== About Typst

Typst is an open-source markup language written in Rust and developed from 2019 by Laurenz Mädje and Martin Haug. Version 0.1.0 was released on GitHub on April 4, 2023#footnote[GitHub repository: #link("https://github.com/typst/typst")].

Typst positions itself as a modern, fast, and easier successor to #LaTeX. Key advantages include:

- incremental compilation;
- clear error messages;
- a Turing-complete language;
- a coherent styling system for fonts, layout, margins, #sym.dots;
- an active community;
- a straightforward package ecosystem via #link("https://typst.app/universe", "Typst Universe");
- editor extensions such as `Tinymist` for VS Code.

== Installing and using Typst CLI

Typst CLI#footnote[Command-line utility] is available on Windows, macOS, and Linux.

- Build from source:
#code-box[
  ```bash
  cargo install --locked typst-cli
  ```
]

- Windows:
#code-box[
    ```bash
    choco install typst
    scoop install main/typst
    winget install --id Typst.Typst
    ```
]

- Linux:
#code-box[
```bash
sudo snap install typst
sudo dnf copr enable claaj/typst & sudo dnf install typst
sudo pacman -S typst
```
]

- macOS:
#code-box[
```bash
brew install typst
sudo port install typst
```
]

Once installed, compile Typst files with:
#code-box[
```bash
typst compile /path/to/file.typ
typst compile /path/to/file.typ /path/to/output.pdf
```
]

You can also enable live recompilation:
#code-box[
```bash
typst watch file.typ
```
]

== Tooling

Typst can be used with any text editor, but IDE tooling improves productivity with syntax highlighting, completion, real-time compilation, and PDF preview.

=== Editors and IDEs

- *Text editors*: any editor can work, depending on your preferences.

- *Visual Studio Code and derivatives*: install `Tinymist` for Typst language support, live preview, and diagnostics.

#info-box[`Tinymist` includes a Typst compiler, so Typst CLI is optional.]

- *JetBrains IDEs*: install `Typst Support` (based on `Tinymist`) from the plugin marketplace.

- *Cloud IDE*: Typst has an official #link("https://typst.app/", "cloud IDE"), with alternatives such as #link("https://www.typetex.app/", "TypeTeX").

=== Package management

Unlike #LaTeX distributions (TeXLive, MiKTeX), Typst packages are centralized in #link("https://github.com/typst/packages", "the Typst packages repository"), discoverable through #link("https://typst.app/universe/","Typst Universe").

Import packages with:
#code-box[
```typst
#import "@preview/package-name:version": *
#import "@preview/package-name:version": package-name
#import "@preview/package-name:version": func1, func2
```
]

For `cnam-thesis`:
#code-box[
```typst
#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/cnam-thesis:0.1.0": ct
#import "@preview/cnam-thesis:0.1.0": info-box, warning-box
```
]

The first import downloads and caches the package automatically.

Community tools that help manage dependencies include:
- #link("https://github.com/typst-community/utpm", "UTPM"),
- #link("https://github.com/npikall/gotpm", "GoTPM"),
- #link("https://github.com/mkpoli/tyler", "Tyler"),
- #link("https://github.com/sjfhsjfh/typship", "Typship").
