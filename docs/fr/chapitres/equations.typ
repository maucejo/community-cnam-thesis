#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/swank-tex:0.1.0": LaTeX
#import "../../guide-utils.typ": *

= Équations et algorithmes <ch:equations>

Ce chapitre présente les différentes manières d'écrire des équations et d'insérer des algorithmes dans un document de thèse.

#minitoc

#pagebreak()

== Équations
#warning-box[
#set par(first-line-indent: 0pt)
La syntaxe des équations Typst diffère de celle de #LaTeX. Pour plus d'informations sur la syntaxe des équations Typst, veuillez consulter la #link("https://typst.app/docs/reference/math/", "documentation officielle de Typst").

Pour accéder à la liste complète des symboles mathématiques disponibles dans Typst, c'est par #link("https://typst.app/docs/reference/symbols/sym/", "ici"). \
Pour la liste complète des emojis (et oui, c'est possible #emoji.cat.face.heart), c'est par #link("https://typst.app/docs/reference/symbols/emoji/", "là"). En revanche, leur utilisation est à proscrire dans un document académique (mais je trouve ça amusant à signaler).

]

=== Équations en ligne

Les équations en ligne s'écrivent entre les symboles `$...$` et sont intégrées dans le texte.

#v(1em)
#example-box(numbering: false)[
```typ
#let st = sym.space.thin

La transformée de Fourier d'une fonction $f(t)$ est définie par l'intégrale $hat(f)(xi) = integral_(-oo)^(+oo) f(t) st e^(-2 pi i xi t) dif t$
```
][
#let st = sym.space.thin
La transformée de Fourier d'une fonction $f(t)$ est définie par l'intégrale $hat(f)(xi) = integral_(-oo)^(+oo) f(t) st e^(-2 pi i xi t) dif t$
]

=== Équations numérotées et non numérotées

Les équations numérotées s'écrivent entre les symboles `$ ... $` et sont centrées sur la page. Comme pour les figures et les tableaux, on peut ajouter un #mtype("label") pour pouvoir y faire référence dans le texte.

#warning-box[
#set par(first-line-indent: 0pt)
La différence entre les équations numérotées et les équations en ligne est subtile. En effet, une équation en ligne s'écrira :
```typ
$y = f(x)$,
```
tandis qu'une équation numérotée s'écrira (notez l'espace avant et après le symbole `$`):
```typ
$ y = f(x) $.
```
]

#v(1em)
#example-box(numbering: false)[
```typ
$
i planck (partial Psi)/ (partial t) = hat(H) space.thin Psi.
$ <eq:schrodinger>

#noindent L'équation de Schrödinger @eq:schrodinger décrit l'évolution temporelle #sym.dots
]
```
][
$
  i planck (partial Psi)/ (partial t) = hat(H) space.thin Psi.
$ <eq:schrodinger>

#noindent L'équation de Schrödinger @eq:schrodinger décrit l'évolution temporelle #sym.dots
]

Pour ne pas numéroter une équation, il suffit d'ajouter le #mtype("label") #text(fill: cnam-colors.primary)[`<nonum-eq>`] après le symbole `$` de fermeture de l'équation. Par exemple, l'équation suivante ne sera pas numérotée :

#v(1.25em)
#example-box(numbering: false)[
```typ
$
i planck (partial Psi)/ (partial t) = hat(H) space.thin Psi.
$ <nonum-eq>
]
```
][
$
  i planck (partial Psi)/ (partial t) = hat(H) space.thin Psi.
$ <nonum-eq>
]


=== Environnements avancés

Les équations peuvent également être écrites dans des environnements plus complexes, tels que les systèmes d'équation. Par exemple, pour écrrire des équations sur plusieurs lignes, on peut écrire:

#v(0.5em)
#example-box(numbering: false, vspace: -1em)[
```typ
#let bm(x) = $upright(bold(#x))$
$
  nabla dot.c bm(E) &= rho/epsilon_0, \
  nabla dot.c bm(B) &= 0, \
  nabla times bm(E) &= - (partial bm(B))/(partial t), \
  nabla times bm(B) &= mu_0 space.thin bm(J) + mu_0 epsilon_0 (partial bm(E))/(partial t).
$
```
][
#let bm(x) = $upright(bold(#x))$
$
  nabla dot.c bm(E) &= rho/epsilon_0, \
  nabla dot.c bm(B) &= 0, \
  nabla times bm(E) &= - (partial bm(B))/(partial t), \
  nabla times bm(B) &= mu_0 space.thin bm(J) + mu_0 epsilon_0 (partial bm(E))/(partial t).
$
]

On peut également écrire les équations précédentes sous la forme d'une seul équation numérotée:
#example-box(numbering: false, vspace: -1em)[
```typ
#let bm(x) = $upright(bold(#x))$
$
  nabla dot.c bm(E) &= rho/epsilon_0, \
  nabla dot.c bm(B) &= 0, \
  nabla times bm(E) &= - (partial bm(B))/(partial t), \
  nabla times bm(B) &= mu_0 space.thin bm(J) + mu_0 epsilon_0 (partial bm(E))/(partial t).
$ <equate:revoke>
```
][
#let bm(x) = $upright(bold(#x))$
$
  nabla dot.c bm(E) &= rho/epsilon_0, \
  nabla dot.c bm(B) &= 0, \
  nabla times bm(E) &= - (partial bm(B))/(partial t), \
  nabla times bm(B) &= mu_0 space.thin bm(J) + mu_0 epsilon_0 (partial bm(E))/(partial t).
$ <equate:revoke>
]

#info-box[La numérotation des sous-équations est gérée par le paquet `equate`. Le #mtype("label") #text(fill: cnam-colors.primary)[`<equate:revoke>`] permet d'utiliser le système de numérotation natif de Typst.]

On peut également écrire les équations sous la forme d'un système d'équations, en procédant comme suit :

#pagebreak()
#v(0.5em)
#example-box(numbering: false)[
```typ
$
  cases(
    dot(x)(t) &= A x(t) + B u(t),
    y(t) &= C x(t) + D u(t),
  )
$
```
][
$
  cases(
    dot(x)(t) &= A x(t) + B u(t),
    y(t) &= C x(t) + D u(t),
  )
$
]

Le template `bookly` permet la création d'équations encadrées en utilisant la commande #cmd("boxeq").

#v(0.5em)
#example-box(numbering: false, vspace: -1em)[
```typ
$
  #boxeq($y = f(x)$)
$
```
][
$
  #boxeq($y = f(x)$)
$
]

Enfin, il est possible d'ajouter de la couleur dans les équations :

#v(1em)
#example-box(numbering: false)[
```typ
#let colred(x) = text(fill: cnam-colors.primary, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

$
  colred(y) = colblue(f)(x)
$
```
][
#let colred(x) = text(fill: cnam-colors.primary, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

$
  colred(y) = colblue(f)(x)
$
]

== Algorithmes

Les algorithmes peuvent être insérés dans le document de thèse en utilisant la #cmd("algorithm") qui est basée sur le package #link("https://github.com/andreasKroepelin/lovelace", [`lovelace`]). Cette commande accepte les paramètres suivants :

#argument("caption", default: "none", type: [#mtype("string")|#mtype("content")])[
  Légende de l'algorithme. Si #mtype("none"), aucune légende ne sera affichée.
]

#argument("line-numbering", default: ["1"], type: mtype("string"))[
  Numérotation des lignes de l'algorithme.

  Si #mtype("none"), aucune numérotation ne sera affichée.
]

#pagebreak()
#example-box(numbering: false)[
```typ
#algorithm(caption: [Mon algorithme])[
  + do something
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
] <alg:example>

#noindent L'algorithme @alg:example est un exemple d'algorithme simple complètement inutile.
]
```
][#algorithm(caption: "Mon algorithme")[
  + do something
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
] <alg:example>

#noindent L'algorithme @alg:example est un exemple d'algorithme simple complètement inutile.
]

#algorithm[
  + do something
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
]

#algorithm(caption: lorem(20))[
  + do something
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
]