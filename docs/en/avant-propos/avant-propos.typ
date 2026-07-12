#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/swank-tex:0.1.0": LaTeX

#show: chapter-nonum

= Foreword

This document is the user guide for the Typst template dedicated to theses at the Conservatoire national des arts et métiers (Cnam). It was designed to help doctoral and master's students write their thesis with Typst, a modern and efficient alternative to #LaTeX.

This guide uses the full set of features provided by the template and includes practical examples. It aims to help doctoral and master's students write their thesis efficiently and professionally while following Cnam standards and requirements.

I also thank my colleague Éric Bavu, who motivated me to create this template after publishing a Quarto + #LaTeX template for Cnam theses. The Typst template is inspired by his work. Thank you, Éric!

Finally, I thank the doctoral and master's students who already use, or will use, this template for their feedback and suggestions, which will help continuously improve this tool.

#v(1em)
#align(right)[Mathieu Aucejo \ June 2026]

= Résumé

Ce travail présente et documente le template Typst `cnam-thesis`, conçu pour permettre aux doctorants du Conservatoire national des arts et métiers (Cnam) de rédiger leur thèse dans un environnement moderne, lisible et reproductible. Le template vise la production d’un PDF conforme à la maquette institutionnelle 2024-2025, avec une attention particulière à la qualité typographique, à la structuration du manuscrit et à la compatibilité avec les exigences d’archivage (notamment PDF/A). Le guide se compose de six chapitres, chacun dédié à une grande famille de fonctionnalités : structure, figures et tableaux, équations, boîtes informationnelles, ainsi que références et annotations. La plupart des contenus suivent le principe « code + rendu » : un extrait Typst présente la syntaxe, puis son résultat est affiché immédiatement dans le document. Cette logique permet de considérer non seulement comme un guide pratique d’utilisation, mais également comme une démonstration des possibilités offertes par le template.

#v(1em)
#noindent *Mots-clés : * Typst, template, thèse, Cnam, PDF/A, publication scientifique reproductible, guide d’utilisation, documentation.

= Abstract

#set text(lang: "en")
This work presents and documents the Typst template `cnam-thesis`, designed to enable doctoral candidates at the Conservatoire national des arts et métiers (Cnam) to write their thesis in a modern, readable, and reproducible environment. The template aims to produce a PDF compliant with the 2024-2025 institutional format, with particular attention to typographic quality, manuscript structure, and compatibility with archiving requirements (notably PDF/A). The guide consists of six chapters, each devoted to a major feature category: structure, figures and tables, equations, informational boxes, as well as references and annotations. Most of the content follows the "code + output" principle: a Typst excerpt presents the syntax, and its result is displayed immediately in the document. This approach allows it to be considered not only as a practical user guide, but also as a demonstration of the possibilities offered by the template.

#v(1em)
#noindent *Keywords:* Typst, template, thesis, Cnam, PDF/A, reproducible scientific publishing, user guide, documentation.
