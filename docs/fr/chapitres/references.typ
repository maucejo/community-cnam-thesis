#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *

= Références <ch:ref>

Ce chapitre présente le système de citations bibliographiques utilisé dans le template de thèse du Cnam. Il est basé sur le style de citation IEEEtran, adapté pour le français. Le fichier de style utilisé est `IEEEtran-francais.csl`, qui est inclus dans le gabarit `cnam-thesis`. Le système de glossaire et d'acronyme est également présenté.

#minitoc

#pagebreak()

== Références bibliographiques

Cette section explique comment insérer des citations dans votre document.

=== Format de fichiers

Typst accepte nativement les fichiers de bibliographie au format BibTeX. Toutefois, Typst introduit un nouveau format de fichier de bibliographie appelé Hayagriva, qui est un fichier `yaml` contenant les références bibliographiques. Pour plus d'informations sur le format Hayagriva, veuillez consulter sa #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md", "documentation").

Pour insérer une bibliographie, il faut utiliser la commande #cmd("bibliography") en précisant le chemin du fichier de bibliographie.

#code-box[
```typ
// Pour un fichier BibTeX
#bibliography("bibliographie/biblio.bib")

// Pour un fichier Hayagriva
#bibliography("bibliographie/biblio.yaml")
```
]

Pour plus d'informations sur la commande #cmd("bibliography"), veuillez consulter la #link("https://typst.app/docs/reference/model/bibliography/", "documentation officielle de Typst").

#tip-box[
  #link("https://www.zotero.org/", "Zotero") (avec le connecteur #link("https://retorque.re/zotero-better-bibtex/installation/", "Better BibTeX")) ou #link("https://www.jabref.org/", "JabRef") exportent directement votre bibliographie au format BibTeX. On peut noter que JabRef permet également d'exporter votre bibliographie au format Hayagriva.
]

=== Syntaxe de base

Les citations sont insérées dans le texte en utilisant soit la commande #cmd("cite"), soit en utilisant la même syntaxe que celle utilisée pour les références croisées #text(fill: cnam-colors.primary)[`@cle`].

#v(1em)
#example(numbering: false, vspace: -1em,
```typ
La composition typographique scientifique a été révolutionnée par Donald Knuth dans les années 1970 @Knu84.
```
)

=== Références multiples

Pour insérer plusieurs références dans le texte, il suffit de les chaîner.

#v(1em)
#example(numbering: false, vspace: -1em,
```typ
Typst est un nouveau langage de balise développé par deux étudiants allemands, Laurenz Mädje et Martin Haug, dans le cadre de leur mémoire de M2 en informatique @Mad22 @Hau22.
```
)

== Glossaire, acronymes et nomenclatures

Plusieurs paquets Typst pour créer des glossaires et des acronymes existent. Le gabarit `cnam-thesis` n'intègre pas de paquets spécifiques pour créer des glossaires et des acronymes. Toutefois, il est possible d'utiliser les paquets suivants :

- *Glossaires*

  - #link("https://github.com/swaits-typst-packages/glossy/", "Glossy")

  - #link("https://github.com/typst-community/glossarium", "Glossarium")

  - #link("https://github.com/RolfBremer/gloss-awe", "Gloss-awe")

#v(1em)
- *Acronymes*

  - #link("https://typst.app/universe/package/acrostiche", "Acrostiche")

  - #link("https://typst.app/universe/package/acrotastic", "Acrotastic")

  - #link("https://typst.app/universe/package/abbr", "Abbr")

  - #link("https://github.com/etwasmitbaum/i-am-acro", "I-am-acro")

#v(1em)
- *Nomenclatures*

  - #link("https://github.com/eiglss/nomos", "Nomos")