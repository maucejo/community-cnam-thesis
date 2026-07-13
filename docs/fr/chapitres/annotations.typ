#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *

= Commentaires de relecture <ch:review>

Cette section présente les différentes fonctionnalités de relecture et d'annotation disponibles dans le template `cnam-thesis`. Ces fonctionnalités permettent aux auteurs et aux relecteurs de collaborer efficacement en ajoutant des commentaires, des notes de marge et des annotations directement dans le document.

#minitoc

#pagebreak()
== Commentaires collaboratifs

Pour activer les commentaires, il suffit d'insérer dans le fichier concerné la commande :
#code-box[
```typ
#show: activate-comment
```
]

Pour désactiver les commentaires, il suffit d'insérer dans le fichier concerné la commande :
#code-box[
```typ
#show: deactivate-comment
```
]

L'activation des commentaires créée une zone de marge sur le côté droit du document, où les commentaires peuvent être affichés.

#info-box[#noindent La commande `activate-comment` est un raccourci pour `marginalia.setup.with(...)`, tandis que la commande `deactivate-comment` est un raccourci pour `page.with(margin: auto)`.

#noindent Si la commande d'activation est définie dans un fichier inclus, il n'est pas nécessaire de désactiver les commentaires dans les fichiers inclus suivants.
]

== Types de commentaires <ch:review->

Le gabarit `cnam-thesis` propose différents types de commentaires, chacun ayant une icône spécifique pour les différencier visuellement :

- *`note`* #box(image("../../../src/resources/logo/note.svg", width: 1em) + v(-1pt)) : Utilisé pour ajouter des notes d'information ou des explications supplémentaires.

- *`comment`* #box(image("../../../src/resources/logo/comment.svg", width: 1em) + v(-2pt)) : Utilisé pour ajouter des commentaires généraux ou des suggestions.

- *`question`* #box(image("../../../src/resources/logo/question.svg", width: 1em) + v(-2pt)) : Utilisé pour poser des questions ou demander des clarifications.

- *`todo`* #box(image("../../../src/resources/logo/todo.svg", width: 1em) + v(-2pt)) : Utilisé pour indiquer des tâches à accomplir ou des éléments à vérifier.

#show: activate-comment

== Syntaxe des annotations

#info-box[L'environnement de commentaire a été activé pour cette section.]

Les annotations peuvent être ajoutées en utilisant la commande #cmd("comment"), dont les arguments sont les suivants :

#argument("by", default: ["Reviewer"], type: [#mtype("string")|#mtype("content")])[Auteur du commentaire]

#argument("type", default: ["note"], type: [#mtype("string")])[Type de commentaire]

#argument("inline", default: [false], type: mtype("bool"))[Si `true`, le commentaire est inséré en ligne. Si `false`, il est inséré dans la marge.]

#argument("color", default: [blue], type: [#mtype("string")|#mtype("color")])[Couleur de la boîte d'annotation]

#argument("..args", type: mtype("dictionary"))[Arguments supplémentaires pour la personnalisation des annotations.

#set text(size: 0.8em)
#info-box[La commande #cmd("comment") est construite à partir de la commande #cmd("note") fournie par le package `marginalia`, tandis qu'elle utilise la commande native #cmd("block") pour les notes en ligne. Par conséquent, #cmd("comment") hérite des paramètres de ces deux commandes. Pour plus d'informations sur les paramètres disponibles, veuillez consulter la #link("https://github.com/nleanba/typst-marginalia/blob/main/Marginalia.pdf", [documentation du package `marginalia`.])]

#warning-box[En raison de l'implémentation actuelle de la commande #cmd("comment"), certains paramètres de la commande #cmd("inline-note") ne sont pas encore pris en charge. C'est notamment le cas du paramètre `par-break`.]
]

Ainsi, pour ajouter un commentaire de type `note` en marge dont la couleur de la boîte est bleue, il suffit d'utiliser la commande suivante :

#pagebreak()
#code-box[```typ
#comment(by: "Abbé Grégoire", color: blue)[Ceci est un commentaire bleu.]
```]

Comme vous pouvez le constater la commande précédente crée bien un commentaire de type `note` en marge dont la couleur de la boîte est bleue.#comment(by: "Abbé Grégoire", color: blue, dy: -3.25em)[Ceci est un commentaire bleu.]. Le lecteur attentif aura remarqué que l'annotation insérée est signalée dans le texte par son icône, sa couleur et son numéro.

On peut aller plus loin en créant des boîtes d'annotation associées à un relecteur spécifique. Cela permet de différencier les commentaires de chaque relecteur par une couleur spécifique. Par exemple, créons deux relecteurs, l'Abbé Grégoire et Henri Tresca (qui sont les directeurs de cette thèse fictive).

#code-box[
```typ
#let ab-comment = comment.with(by: "Abbé Grégoire", color: blue)
#let ht-comment = comment.with(by: "Henri Tresca", color: cnam-color.primary)
```
]

#let ab-comment = comment.with(by: "Abbé Grégoire", color: blue)
#let ht-comment = comment.with(by: "Henri Tresca", color: cnam-colors.primary)

En procédant ainsi, il est possible d'ajouter des commentaires de chaque relecteur en utilisant les commandes `ab-comment` et `ht-comment`#ht-comment(type: "comment", dy: -3.5em)[Je trouve cela génial !]#ab-comment(type: "question")[Je ne suis pas sûr de comprendre cette remarque Henri ?]. Ces notes ont été créées avec les commandes suivantes :
#code-box[
```typ
En procédant ainsi, il est possible d'ajouter des commentaires de chaque relecteur en utilisant les commandes `ab-comment` et `ht-comment`#ht-comment(type: "comment", dy: -3.5em)[Je trouve cela génial !]#ab-comment(type: "question")[Je ne suis pas sûr de comprendre cette remarque Henri ?].
```
]

Les commentaires insérés dans les marges doivent généralement être relativement courts pour ne pas surcharger la mise en page. Cependant, il est possible d'ajouter des commentaires plus longs en utilisant l'argument `inline: true`. Cela permet d'insérer le commentaire directement dans le texte, ce qui est particulièrement utile pour les explications détaillées ou les discussions plus longues.#ab-comment(inline: true)[Comme je n'ai pas d'idées pour faire un texte amusant et long, je place un classique #cmd("lorem"). #lorem(20)]

Il est également possible de surligner un passage du texte et d'y associer un commentaire. Pour ce faire, il suffit d'utiliser la commande #cmd("highlight-comment") qui permet de surligner le texte et d'ajouter un commentaire associé. La commande est la suivante :

#pagebreak()
#code-box[
```typ
#highlight-comment(by: "Relecteur A", type: "comment", color: green, highlight-body: [Texte surligné])[Commentaire associé]
```
]

#let ma-highlight-comment = highlight-comment.with(by: "Mathieu Aucejo", color: green.darken(25%))

Dans la section suivante, #ma-highlight-comment(type: "question", dy: - 3.5em)[nous présenterons la création de la liste des annotations.][Je me demande si cela est vraiment nécessaire ?]

#info-box[La commande #cmd("highlight-comment") est construite à partir de la commande #cmd("comment"). Elle hérite des paramètres de cette dernière à l'exception du paramètre `inline`.]

== Table des annotations

Pour faciliter la lecture et la navigation dans les commentaires, le template `cnam-thesis` propose également une table des annotations. Cette table répertorie tous les commentaires ajoutés dans le document, avec leur numéro, leur auteur et leur type. Pour l'insérer dans le document, il suffit d'utiliser la commande #cmd-("listofnotes") à l'endroit souhaité.

#code-box[
```typ
#listofnotes
```
]

