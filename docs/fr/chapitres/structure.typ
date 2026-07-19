#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *

= Mise en forme du document <ch:structure>

Ce chapitre présente les éléments de base permettant de mettre en forme un document Typst. On évoquera en particulier de la hiérarchisation des titres, du référencement des éléments et des différents éléments de mise en forme du contenu.

#minitoc

#pagebreak()

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

#code-box[```typst
#import "@preview/cnam-thesis:0.1.0": *

#show: chapter-nonum

= Titre du chapitre
```]

=== Sections numérotées et non numérotées

Par défaut, tous les titres de niveau 1 à 4 sont numérotés. Pour insérer des sections ou sous-sections non-numérotés, il faut ajouter attaché le #mtype("label") #text(fill: cnam-colors.primary,`<nonum-sec>`) à la fin du titre de la section ou de la sous-section concernée. Par exemple:
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
#example(numbering: false, vspace: -0.5em,
```typst
Pour plus de détails, voir le chapitre @ch:structure et la section @s:structure-titles.
```
)

== Mise en forme du texte

Cette section présente différents éléments de mise en forme du texte.

=== Emphase et code

#example(lang: [typst], numbering: false, vspace: -0.5em,
```
*gras*, _italique_, _*gras et italique*_, `code inline`, #strike[barré], #super[exposant], #sub[indice]
```
)

=== Liens hypertextes

Pour créer des liens hypertextes, il faut utiliser la commande #cmd("link") de Typst (voir #link("https://typst.app/docs/commands/link", "Documentation Typst") pour plus de détails).

#v(1em)
#example(numbering: false,
  ```typst
    #link("https://www.cnam.fr", "Le site du Cnam")

    https://www.cnam.fr

    #link("mailto:contact@cnam.fr")
    ```
)

=== Listes

Il existe plusieurs types de listes dans Typst: les listes à puces, les listes numérotées et les listes de tâches.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [
  #set align(horizon)
  #zebraw(lang-color:teal, numbering: false,
```typst
- Premier élément
- Deuxième élément
  - Sous-élément 1 (1 tabulation)

+ Premier élément
+ Deuxième élément
  + Premier élément

#sym.dots.v
5. Cinquième élément
+ Sixième élément

- [x] Tâche 1
- [ ] Tâche 2
```)],
[#render-box[
  - Premier élément
  - Deuxième élément
    - Sous-élément 1 (1 tabulation)

  + Premier élément
  + Deuxième élément
    + Premier élément

  #sym.dots.v
  5. Cinquième élément
  + Sixième élément

  - [x] Tâche 1
  - [ ] Tâche 2
]]
)

#warning-box[Les listes de tâches sont adaptées pour les documents de type "guide" ou "manuel", mais ne sont pas adaptées pour un manuscrit de thèse. Il est recommandé d'utiliser des listes à puces ou numérotées pour la rédaction d'une thèse. Cela est plus neutre et conforme aux standards académiques.]

=== Citations

Les citations sont utilisées pour référencer des œuvres ou des idées développées par d'autres auteurs.

#v(0.5em)
#example(numbering: false, vspace: -1.25em,
```typst
#quote(attribution: "Platon", block: true)[Il y a en chacun de nous des calculs que nous nommons espérance.]
```
)

=== Notes de bas de pages

#v(1em)
#example(numbering: false, vspace: -1.25em,
```typst
 Le Cnam a été fondé le 10 octobre 1794#footnote[19 vendémiaire an III de la Révolution.].
```
)

=== Sauts de page

Pour insérer un saut de page, il faut utiliser la commande #cmd("pagebreak") de Typst (voir #link("https://typst.app/docs/reference/layout/pagebreak/", "Documentation Typst") pour plus de détails).

#code-box[```typst
Fin du contenu de cette section.

#pagebreak()

Début du contenu de la section suivante.
```]

#warning-box[Il est recommandé d'utiliser les sauts de page avec parcimonie, afin de ne pas perturber la lecture du document. Il est préférable de laisser le moteur de mise en page gérer les sauts de page automatiquement. Préférez les ajuster en toute fin de rédaction, une fois le contenu figé.]

== Parties et environnements de mise en page

Les parties sont des sections de niveau supérieur aux chapitres. Elles permettent de regrouper plusieurs chapitres sous un même thème. Pour créer une partie, il faut utiliser la commande #cmd("part").

#code-box[
```typst
// Création d'une partie
#part[Titre de la partie]
```
]

Concernant les environnements de mise en page, `cnam-thesis` s'appuie sur le template `bookly` pour structurer le document. Il est possible d'utiliser les environnements #cmd-("front-matter"), #cmd-("main-matter") et #cmd-("appendix") pour structurer le document en trois parties : la partie avant-propos, la partie principale et la partie annexes.

Pour activer ces environnements, il faut utiliser les commandes suivantes à l'endroit souhaité dans le document :
#code-box[```typst
#show: front-matter

// Contenu de la partie avant-propos

#show: main-matter

// Contenu de la partie principale

#show: appendix

// Contenu de la partie annexes
```]

== Quatrième de couverture

La quatrième de couverture est une page qui présente le résumé et l'abstract du document. Elle est généralement utilisée pour donner un aperçu du contenu du document aux lecteurs.

#code-box[
```typst
#backcover(resume: ..., abstract: ...)
```
]

La fonction #cmd("backcover") accepte les arguments suivants :

#argument("resume", default: [none], type: [#mtype("string")|#mtype("content")])[Résumé en français du document]

#argument("abstract", default: [none], type: [#mtype("string")|#mtype("content")])[Abstract en anglais du document]