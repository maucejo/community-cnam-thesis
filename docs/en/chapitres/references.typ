#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *

= References <ch:ref>

This chapter presents the bibliographic citation system used in the Cnam thesis template. It is based on the IEEEtran citation style, adapted for French. The style file used is `IEEEtran-francais.csl`, which is included in the `cnam-thesis` template. The glossary and acronym system is also presented.

#minitoc

#pagebreak()

== Bibliographic references

This section explains how to insert citations into your document.

=== File formats

Typst natively supports bibliography files in BibTeX format. However, Typst introduces a new bibliography file format called Hayagriva, which is a `yaml` file containing bibliographic references. For more information about the Hayagriva format, please refer to its #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md", "documentation").

To insert a bibliography, use the #cmd("bibliography") command and specify the path to the bibliography file.

#code-box[
```typ
// Pour un fichier BibTeX
#bibliography("bibliographie/biblio.bib")

// Pour un fichier Hayagriva
#bibliography("bibliographie/biblio.yaml")
```
]

For more information about the #cmd("bibliography") command, please refer to the #link("https://typst.app/docs/reference/model/bibliography/", "official Typst documentation").

#tip-box[
  #link("https://www.zotero.org/", "Zotero") (with the #link("https://retorque.re/zotero-better-bibtex/installation/", "Better BibTeX") connector) or #link("https://www.jabref.org/", "JabRef") can export your bibliography directly in BibTeX format. Note that JabRef can also export your bibliography in Hayagriva format.
]

=== Basic syntax

Citations are inserted into the text either by using the #cmd("cite") command, or by using the same syntax as cross-references #text(fill: cnam-colors.primary)[`@key`].

#v(1em)
#example(numbering: false, vspace: -1em,
```typ
Scientific typesetting was revolutionized by Donald Knuth in the 1970s @Knu84.
```
)


=== Multiple references

To insert multiple references in the text, simply chain them.

#v(1em)
#example(numbering: false, vspace: -1em,
```typ
Typst is a new markup language developed by two German students, Laurenz Mädje and Martin Haug, as part of their master's thesis in computer science @Mad22 @Hau22.
```
)

== Glossary, acronyms, and nomenclatures

Several Typst packages exist to create glossaries and acronyms. The `cnam-thesis` template does not include specific packages for creating glossaries and acronyms. However, you can use the following packages:

- *Glossaries*

  - #link("https://github.com/swaits-typst-packages/glossy/", "Glossy")

  - #link("https://github.com/typst-community/glossarium", "Glossarium")

  - #link("https://github.com/RolfBremer/gloss-awe", "Gloss-awe")

#v(1em)
  - *Acronyms*

  - #link("https://typst.app/universe/package/acrostiche", "Acrostiche")

  - #link("https://typst.app/universe/package/acrotastic", "Acrotastic")

  - #link("https://typst.app/universe/package/abbr", "Abbr")

  - #link("https://github.com/etwasmitbaum/i-am-acro", "I-am-acro")

#v(1em)
  - *Nomenclatures*

  - #link("https://github.com/eiglss/nomos", "Nomos")