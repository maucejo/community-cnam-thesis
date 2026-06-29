#import "../../src/cnam-thesis.typ": *
#import "@preview/mantys:1.0.2": *
#import "@preview/swank-tex:0.1.0": LaTeX

#show: chapter-nonum

= Avant-propos

Ce document présente le guide d'utilisation du template Typst pour les thèses du Conservatoire national des arts et métiers (Cnam). Il a été conçu pour aider les doctorants et les étudiants de Master à rédiger leur thèse en utilisant le logiciel  #typst (Typst), qui offre une alternative moderne et efficace à #LaTeX.

Ce guide exploite l'ensemble des fonctionnalités offertes par le template, et fournit des exemples concrets pour illustrer son utilisation. Il est destiné à aider les doctorants et les étudiants de Master à rédiger leur thèse de manière efficace et professionnelle, en respectant les normes et les exigences du Cnam.

Je tiens à remercier les créateurs de #typst pour leur travail remarquable sur ce logiciel. Un remerciement particulier est également adressé à la communauté Typst, sans laquelle ce template n'aurait pu voir le jour.

Je remercie également mon collègue Éric Bavu pour m'avoir motivé à créer ce template en publiant un template Quarto + #LaTeX pour les thèses du Cnam. Le template Typst s'inspire de son travail. Merci Éric !

Enfin, je remercie les doctorants et les étudiants qui ont utilisé ou utiliseront ce template pour leurs retours et suggestions, qui permettront d'améliorer continuellement cet outil pour le bénéfice de tous.

#v(1em)
#align(right)[Mathieu Aucejo \ Juin 2026]

= Résumé

Ce travail présente et documente le template Typst `cnam-thesis`, conçu pour permettre aux doctorants du Conservatoire national des arts et métiers (Cnam) de rédiger leur thèse dans un environnement moderne, lisible et reproductible. Le template vise la production d’un PDF conforme à la maquette institutionnelle 2024-2025, avec une attention particulière à la qualité typographique, à la structuration du manuscrit et à la compatibilité avec les exigences d’archivage (notamment PDF/A). Le guide se compose de six chapitres, chacun dédié à une grande famille de fonctionnalités : structure, figures et tableaux, équations, boîtes informationnelles, ainsi que références et annotations. La plupart des contenus suivent le principe « code + rendu » : un extrait Typst présente la syntaxe, puis son résultat est affiché immédiatement dans le document. Cette logique permet de considérer non seulement comme un guide pratique d’utilisation, mais également comme une démonstration des possibilités offertes par le template.

#v(1em)
#noindent *Mots-clés : * Typst, template, thèse, Cnam, PDF/A, publication scientifique reproductible, guide d’utilisation, documentation.

= Abstract

#set text(lang: "en")
This work presents and documents the Typst template `cnam-thesis`, designed to enable doctoral candidates at the Conservatoire national des arts et métiers (Cnam) to write their thesis in a modern, readable, and reproducible environment. The template aims to produce a PDF compliant with the 2024-2025 institutional format, with particular attention to typographic quality, manuscript structure, and compatibility with archiving requirements (notably PDF/A). The guide consists of six chapters, each devoted to a major feature category: structure, figures and tables, equations, informational boxes, as well as references and annotations. Most of the content follows the "code + output" principle: a Typst excerpt presents the syntax, and its result is displayed immediately in the document. This approach allows it to be considered not only as a practical user guide, but also as a demonstration of the possibilities offered by the template.

#v(1em)
#noindent *Keywords:* Typst, template, thesis, Cnam, PDF/A, reproducible scientific publishing, user guide, documentation.