#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/dtree:0.1.1": dtree
#import "@preview/mantys:1.0.2": *
#import "../guide-utils.typ": *

= Mise en forme du document <ch:structure>

Ce chapitre présente les éléments de base permettant de mettre en forme un document Typst. On évoquera en particulier de la hiérarchisation des titres, du référencement des éléments et des différents éléments de mise en forme du contenu.

#minitoc

#pagebreak()

== Arborescence des fichiers

Lorsque l'on rédige un document long, comme peut l'être un manuscrit de thèse, il est préférable d'adopter une organisation multi-fichiers, afin d'éviter d'avoir un looooooong fichier principal. Cela est notamment important lors de la phase de relecture/correction, ainsi que dans le cadre d'une écriture collaborative. Pour ma part, j'adopte généralement la structure suivante:

#dtree(
  stroke: 0.75pt + cnam-colors.primary,
  icons: ("typ": typst),
  icon-rules: (
    ("main.typ", (icon: "typ", fill: cnam-colors.primary)),
    ("*.typ", (icon: "typ")),
   ),
```
main.typ
 chapitres/
  introduction.typ
  chapitre1.typ
 annexes/
  annexe1.typ
 preambule/
  resume.typ
 images/
  logo.png
 bibliographie/
  biblio.bib
```)

== Hiérarchisation des titres <s:structure-titles>

Le template `cnam-thesis` supporte différents niveaux de titres.

#code-box[
```typst
= Titre de chapitre (niveau 1)

== Titre de section (niveau 2)

=== Titre de sous-section (niveau 3)

==== Titre de sous-sous-section (niveau 4)
```
]

#warning-box[Un plan à quatre niveau numérotés est généralement le maximum acceptable dans une thèse. Si vous avez besoin d'un plan plus profond, il est recommandé de revoir la structure de votre manuscrit.]

=== Chapitres numérotés et non numérotés

Par défaut, les chapitres sont numérotés. Si vous souhaitez créer des chapitres non numérotés (résumé, remerciements, introduction, etc.), vous pouvez utiliser la commande suivante en préambule du fichier correspondant. Par exemple, pour le chapitre d'introduction:

#pagebreak()
#code-box[```typst
#import "@preview/cnam-thesis:0.1.0": *

#show: chapter-nonum

= Titre du chapitre
```]

== Sections numérotées et non numérotées

Par défaut, tous les titres de niveau 1 à 4 sont numérotés. Pour insérer des sections ou sous-sections non-numérotés, il faut ajouter attaché le #mtype("label") `<nonum-sec>` à la fin du titre de la section ou de la sous-section concernée. Par exemple:
#code-box[
```typst
== Titre de section non numérotée <nonum-sec>
=== Titre de sous-section non numérotée <nonum-sec>
```
]

== Références croisées

Pour créer des références croisées vers des sections, figures, tableaux, équations, etc., il faut d'abord définir un label pour l'élément que l'on souhaite référencer. Cela se fait en ajoutant le #mtype("label") #text(fill: cnam-colors.primary,`<mon-label>`) à la fin de l'élément concerné :

#code-box[
```typst
= Titre du chapitre <ch:chapitre>

== Titre de section <s:section>
```
]

Pour citer des éléments référencés, on utilise la commande #text(fill: cnam-colors.primary,`@mon-label`).

#v(1em)
#example-box(numbering: false)[
```typst
Pour plus de détails, voir le chapitre @ch:structure et la section @s:structure-titles.
```
][
Pour plus de détails, voir le chapitre @ch:structure et la section @s:structure-titles.
]

== Mise en forme du texte

Cette section présente différents éléments de mise en forme du texte.

=== Emphase et code

#example-box(lang: [typst], numbering: false)[
```
*gras*, _italique_, _*gras et italique*_, `code inline`, #strike[barré], #super[exposant], #sub[indice]
```
][*gras*, _italique_, _*gras et italique*_, `code inline`, #strike[barré], #super[exposant], #sub[indice]]

=== Liens hypertextes

Pour créer des liens hypertextes, il faut utiliser la commande #cmd("link") de Typst (voir #link("https://typst.app/docs/commands/link", "Documentation Typst") pour plus de détails).


#v(1em)
#example-box(numbering: false)[
  ```typst
    #link("https://www.cnam.fr", "Le site du Cnam")

    https://www.cnam.fr

    #link("mailto:contact@cnam.fr")
    ```
][
#noindent#link("https://www.cnam.fr", "Le site du Cnam")

#noindent https://www.cnam.fr

#noindent#link("mailto:contact@cnam.fr")
]
