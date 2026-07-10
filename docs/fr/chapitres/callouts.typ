#import "@preview/cnam-thesis:0.1.0": *
#import "../guide-utils.typ": *

= Boîtes informationnelles

Les boîtes informationnelles sont des éléments de mise en forme qui permettent de mettre en avant certaines informations dans un document. Elles sont souvent utilisées pour attirer l'attention du lecteur sur des points importants, des conseils, des avertissements ou des notes supplémentaires.

#minitoc

#pagebreak()

== Boîtes disponibles

Le template `cnam-thesis` propose plusieurs types de boîtes informationnelles, chacune ayant un style et une fonction spécifique. Voici les principales boîtes disponibles :

- #cmd-("info-box") : Utilisée pour fournir des informations générales ou des conseils utiles.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#info-box[Ceci est une boîte d'information.]
```
][
#info-box[
Ceci est une boîte d'information.
]
]

- #cmd-("tip-box") : Utilisée pour donner des astuces ou des recommandations.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#tip-box[Ceci est une boîte de conseil.]
```
][
#tip-box[
Ceci est une boîte de conseil.
]
]

#v(1em)
- #cmd-("warning-box") : Utilisée pour avertir le lecteur d'un danger potentiel ou d'une information importante.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#warning-box[Ceci est une boîte d'avertissement.]
```
][
#warning-box[
Ceci est une boîte d'avertissement.
]
]

#v(1em)
- #cmd-("important-box") : Utilisée pour souligner des informations cruciales ou des points essentiels.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#import "bookly-themes.typ": *
#important-box[Ceci est une boîte importante.]
```
][
#important-box[
Ceci est une boîte importante.
]
]

#v(1em)
- #cmd-("proof-box") : Utilisée pour présenter des preuves ou des démonstrations mathématiques.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#proof-box[Ceci est une boîte de preuve.]
```
][
#proof-box[
Ceci est une boîte de preuve.
]
]

#v(1em)
- #cmd-("question-box") : Utilisée pour poser des questions ou des problèmes à résoudre.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#question-box[Ceci est une boîte de question.]
```][
#question-box[
Ceci est une boîte de question.
]
]

- #cmd-("code-box") : Utilisée pour présenter du code source ou des extraits de code.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#code-box[Ceci est une boîte de code.]
```
][
#code-box[
Ceci est une boîte de code.
]
]

#warning-box[Les boîtes informationnelles doivent être utilisées de manière judicieuse et avec parcimonie pour ne pas surcharger le document.]

== Cas particuliers des boîtes de code

Pour remplir une boîte de de code, il est possible d'utiliser la syntaxe native de Typst :

#example-box(numbering: false)[

````typ
#code-box[```julia
import LinearAlgebra

A = rand(3, 3)
b = rand(3)

x = A \ b
```]
````
][
#code-box[```julia
import LinearAlgebra

A = rand(3, 3)
b = rand(3)

x = A \ b
```]
]

On peut rajouter la numérotation des lignes de code en utilisant des paquets dédiés, comme par exemple `zebraw`:

#example-box(numbering: false, vspace: -0.5em)[
````typ
#code-box[#zebraw(
  lang: false,
  ```julia
  import LinearAlgebra

  A = rand(3, 3)
  b = rand(3)

  x = A \ b
  ```
)]
````
][
#code-box-zebraw[
```julia
  import LinearAlgebra

  A = rand(3, 3)
  b = rand(3)

  x = A \ b
  ```
]]

#info-box[Le paquet `zebraw` est une dépendance explicite du template `cnam-thesis`. Il peut donc être utilisé directement sans l'importer de manière explicite.]

Pour aller plus loin, vous pouvez consulter la documentation de #link("https://github.com/hongjr03/typst-zebraw", [`zebraw`]). On peut noter que d'autre paquets existent pour la mise en forme de code, comme #link("https://github.com/Dherse/codly", [`codly`]) ou #link("https://github.com/jneug/typst-codelst", [`codelst`]). En revanche, ces paquets ne sont pas des dépendances du template `cnam-thesis` et doivent donc être importés explicitement si vous souhaitez les utiliser.