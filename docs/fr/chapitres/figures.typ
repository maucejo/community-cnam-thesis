#import "@preview/cnam-thesis:0.1.0": *
#import "../guide-utils.typ": *
#import "@preview/lilaq:0.6.0" as lq

= Figures et tableaux

Ce chapitre présente les différentes commandes et environnements disponibles pour insérer des figures et des tableaux dans le document.

#minitoc

== Figures


La syntaxe de base pour insérer une image est la suivante#footnote[Pour plus d'informations sur la commande #cmd("image"), voir #link("https://typst.app/docs/reference/visualize/image/", "Documentation Typst")]: :
#code-box[
```typst
#image("chemin/vers/image.png", width: 10cm)
```
]

#example-box(numbering: false)[
  ```typst
  #image("cnam.png")
  ```
][#image("../../images/cnam.png")]

#pagebreak()
#info-box[Typst accepte un certain nombre de formats d'image. Les formats actuellement supportés sont les suivants : PNG, JPEG, GIF, SVG, PDF, WEBP et Raw Pixel Data.]

Cependant, lors de la rédaction d'un texte scientifique, il est souvent nécessaire d'ajouter une légende à l'image et de la référencer dans le texte. Pour cela, il est recommandé d'utiliser l'environnement #cmd("figure") de Typst. La syntaxe est la suivante#footnote[Pour plus d'informations sur l'environnement #cmd("figure"), voir #link("https://typst.app/docs/reference/model/figure/", "Documentation Typst")]:

#code-box[
```typst
#figure(
  image("chemin/vers/image.png", width: 10cm),
  caption: "Légende de l'image"
) <fig:mon-label>
```
]

Cette commande permet d'insérer une image avec une légende et un label pour la référence croisée. Le label est défini à la fin de l'environnement #cmd("figure") avec la syntaxe #text(fill: cnam-colors.primary,`<mon-label>`). Pour citer cette figure dans le texte, il suffit d'utiliser la commande #text(fill: cnam-colors.primary,`@mon-label`).

#example-box(numbering: false)[
```typst
#figure(
  image("cnam.png"),
  caption: "Logo officiel du Cnam"
) <fig:logo-cnam>

La Figure @fig:logo-cnam présente le logo officiel du Cnam.
```
][
  #figure(
  image("../../images/cnam.png"),
  caption: "Logo officiel du Cnam"
) <fig:logo-cnam>

#noindent La Figure @fig:logo-cnam présente le logo officiel du Cnam.
]

On peut également insérer plusieurs images dans une seule figure en utilisant l'environnement #cmd("subfigure") du template `bookly` sur lequel est basé le présent gabarit. La syntaxe est la suivante :
#code-box[
```typ
#subfigure(
  figure(image("../images/image1.png"), caption: []),
  figure(image("../images/image2.png"), caption: []), <fig:b>,
  columns: (1fr, 1fr),
  caption: [(a) Left image and (b) Right image],
  label: <fig:subfig>,
)
```
]

#pagebreak()
#zebraw(numbering: false, lang-color: teal,
```typst
#subfigure(
  figure(image("cnam.png"), caption: []),
  figure(image("victoire.svg", width: 50%), caption: []), <fig:b>,
  columns: (1fr, 1fr),
  caption: [(a) Logo du Cnam and (b) Estampille de la Victoire],
  label: <fig:subfig>,
)

La Figure @fig:subfig présente le logo officiel du Cnam et l'allégorie de la Victoire ailée, associée à la devise latine "_Docet Omnes Ubique_" (voir Figure @fig:b).
```
)
#render-box[
  #subfigure(
  figure(image("../../images/cnam.png"), caption: []),
  figure(image("../../images/victoire.svg", width: 50%), caption: []), <fig:b>,
  columns: (1fr, 1fr),
  caption: [(a) Logo du Cnam and (b) Estampille de la Victoire],
  label: <fig:subfig>,
)

#noindent La Figure @fig:subfig présente le logo officiel du Cnam et l'allégorie de la Victoire ailée, associée à la devise latine "_Docet Omnes Ubique_" (voir Figure @fig:b).
]

== Tableaux

Les tableaux peuvent être insérés dans le document en utilisant l'environnement #cmd("table") de Typst. La syntaxe est la suivante#footnote[Pour plus d'informations sur l'environnement #cmd("table"), voir #link("https://typst.app/docs/reference/model/table/", "Documentation Typst")]:
#code-box[
```typst
#table(
  columns: 3,
  align: horizon,
  [*Colonne 1*], [*Colonne 2*], [*Colonne 3*],
  [Ligne 1, Cellule 1], [Ligne 1, Cellule 2], [Ligne 1, Cellule 3],
  [Ligne 2, Cellule 1], [Ligne 2, Cellule 2], [Ligne 2, Cellule 3],
)
```
]

#v(1em)
#example-box[
```typst
#table(
    columns: 2,
    align: center + horizon,
    inset: 5pt,
    [*Forme*], [*Périmètre*],
    [Carré de côté $a$],[$4a$],
    [Cercle de rayon $r$],[$2pi r$],
  )
```
][
  #set align(center)
  #set math.equation(numbering: none)
  #table(
    columns: 2,
    align: center + horizon,
    inset: 5pt,
    [*Forme*], [*Périmètre*],
    [Carré de côté $a$],[$4a$],
    [Cercle de rayon $r$],[$2pi r$],
  )
]

Comme pour les figures, il est possible d'ajouter une légende et un label à un tableau en utilisant l'environnement #cmd("table") du template `bookly`. La syntaxe est la suivante :
#code-box[
```typst
#figure(
  table(
    columns: 3,
    align: horizon,
    [*Colonne 1*], [*Colonne 2*], [*Colonne 3*],
    [Ligne 1, Cellule 1], [Ligne 1, Cellule 2], [Ligne 1, Cellule 3],
    [Ligne 2, Cellule 1], [Ligne 2, Cellule 2], [Ligne 2, Cellule 3],
  ),
  caption: "Légende du tableau",
)
```
]

#example-box(numbering: false)[
```typ
#let mon-tableau = table(
    columns: 2,
    align: center + horizon,
    inset: 5pt,
    [*Forme*], [*Périmètre*],
    [Carré de côté $a$],[$4a$],
    [Cercle de rayon $r$],[$2pi r$],
  )

#figure(
  mon-tableau,
  caption: "Tableau des périmètres de quelques formes géométriques",
) <tab:perimetres>

Le Tableau @tab:perimetres présente les formules de calcul des périmètres de quelques formes géométriques.
```
][
#let mon-tableau = table(
    columns: 2,
    align: center + horizon,
    inset: 5pt,
    [*Forme*], [*Périmètre*],
    [Carré de côté $a$],[$4a$],
    [Cercle de rayon $r$],[$2pi r$],
  )

#figure(
  mon-tableau,
  caption: "Tableau des périmètres",
) <tab:perimetres>

Le Tableau @tab:perimetres présente les formules de calcul des périmètres d'un carré et d'un cercle.
]

#info-box[Le lecteur attentif aura noté que pour éviter d'alléger le code, nous avons défini le tableau dans une variable #text(fill: cnam-colors.primary,`mon-tableau`) avant de l'insérer dans l'environnement #cmd("figure"). Cela permet de réutiliser le même tableau à différents endroits du document si nécessaire et de rendre le code plus lisible.]

== Titres longs et courts pour les figures et tableau

Le template `cnam-thesis` permet de définir un titre long et un titre court pour les figures et les tableaux via la fonction #cmd("ls-caption"). Le titre long est utilisé dans la légende de la figure ou du tableau, tandis que le titre court est utilisé dans la liste des figures ou des tableaux.

#pagebreak()
#v(1em)
#example-box(numbering: false,vspace: -1.5em)[
```typst
#figure(
    rect(),
    caption: ls-caption[Ceci est une figure représentant un rectangle (voir la table des figures pour voir le titre court)][Représentation d'un rectangle],
  )
```
][
  #figure(
    rect(),
    caption: ls-caption[Ceci est une figure représentant un rectangle (voir la table des figures pour voir le titre court)][Représentation d'un rectangle],
  )
]

== Création de courbes directement en Typst

Typst étant un langage Turing complet, il est possible de créer des courbes directement dans le document en utilisant par exemple le package `lilaq`. Ceci permet de créer des graphiques et des visualisations directement dans le document sans avoir besoin d'importer des images externes et d'avoir une mise en page cohérente avec le reste du document.

L'exemple ci-dessous montre comment créer une figure avec deux courbes représentant la réponse libre d'un système mécanique à un degré de liberté non amorti et sous-amorti. Pour plus d'informations sur le package `lilaq`, voir la #link("https://lilaq.org/", "Documentation de lilaq").

#zebraw(numbering: false, lang-color: teal,
```typ
#import "@preview/lilaq:0.6.0" as lq

// Fonction calculant la réponse libre d'un système mécanique à un degré de liberté
#let free_response(om0, xi, x0, v0, t) = {
  if xi < 1. {
    // Sous-amorti
    let Om0 = om0 * calc.sqrt(1 - xi * xi)
    let a = x0
    let b = (v0 + xi * om0 * x0) / Om0
    calc.exp(-xi * om0 * t) * (a * calc.cos(Om0 * t) + b * calc.sin(Om0 * t))
  } else if xi <= 1. {
    // Amortissement critique
    (x0 + (v0 + om0 * x0) * t) * calc.exp(-om0 * t)
  } else {
    // Sur-amorti
    let s = om0*calc.sqrt(xi * xi - 1)
    let a = x0
    let b = (v0 + xi * om0 * x0)/s
    calc.exp(-xi * om0 * t) * (a * calc.cosh(s * t) + b * calc.sinh(s * t))
  }
}

#let om0 = 2 * calc.pi * 2            // Pulsation propre du système (rad/s)
#let x0 = 0.02                        // Déplacement initial (m)
#let v0 = -0.5                        // Vitesse initiale (m/s)
#let t = lq.linspace(0, 5, num: 500)  // Vecteur temps (s)

// Création de la courbe de réponse libre non amortie
#let undamped = lq.diagram(
  width: 100%,
  title: [*Réponse libre non amortie*],
  xlabel: [Temps (s)],
  ylabel: [Déplacement (m)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

// Création de la courbe de réponse libre sous-amortie
#let underdamped = lq.diagram(
  width: 100%,
  title: [Réponse libre sous-amortie],
  xlabel: [Temps (s)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0.1, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

// Création de la grille pour afficher les deux courbes côte à côte
#let fig-grid = grid(
  columns: (1fr,)*2,
  column-gutter: 1em,
  [#undamped], [#underdamped],
)

// Création de la figure
#figure(
  fig-grid,
  caption: [Réponse libre d'un système mécanique à un degré de liberté],
) <fig:free-response>

La Figure @fig:free-response présente la réponse libre d'un système mécanique à un degré de liberté non amorti et sous-amorti.
```
)

#render-box[
#let free_response(om0, xi, x0, v0, t) = {
  if xi < 1. {
    // Sous-amorti
    let Om0 = om0 * calc.sqrt(1 - xi * xi)
    let a = x0
    let b = (v0 + xi * om0 * x0) / Om0
    calc.exp(-xi * om0 * t) * (a * calc.cos(Om0 * t) + b * calc.sin(Om0 * t))
  } else if xi <= 1. {
    // Amortissement critique
    (x0 + (v0 + om0 * x0) * t) * calc.exp(-om0 * t)
  } else {
    // Sur-amorti
    let s = om0*calc.sqrt(xi * xi - 1)
    let a = x0
    let b = (v0 + xi * om0 * x0)/s

    calc.exp(-xi * om0 * t) * (a * calc.cosh(s * t) + b * calc.sinh(s * t))
  }
}

#let om0 = 2 * calc.pi * 2
#let x0 = 0.02
#let v0 = -0.5
#let t = lq.linspace(0, 5, num: 500)

#let undamped = lq.diagram(
    width: 100%,
  title: [*Réponse libre non amortie*],
  xlabel: [Temps (s)],
  ylabel: [Déplacement (m)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

#let underdamped = lq.diagram(
  width: 100%,
  title: [*Réponse libre sous-amortie*],
  xlabel: [Temps (s)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0.1, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

#let fig-grid = grid(
  columns: (1fr,)*2,
  column-gutter: 1em,
  [#undamped], [#underdamped],
)

#figure(
  fig-grid,
  caption: [Réponse libre d'un système mécanique à un degré de liberté],
) <fig:free-response>

#noindent La Figure @fig:free-response présente la réponse libre d'un système mécanique à un degré de liberté non amorti et sous-amorti.
]