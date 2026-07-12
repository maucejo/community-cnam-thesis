#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/mantys:1.0.2": *
#import "@preview/dtree:0.1.1": dtree
#import "../../guide-utils.typ": *

= Usage général <ch:usage-general>

Ce chapitre présente les instructions générales pour l'utilisation du gabarit `cnam-thesis`. Il est recommandé de suivre ces instructions avant de commencer la rédaction de votre manuscrit.

#minitoc

#pagebreak()

== Informations générales

Le gabarit `cnam-thesis` est basé sur `bookly`, qui est paquet Typst développé par l'auteur de ce document. Il fournit une structure de document cohérente, des styles de mise en page prédéfinis et des fonctionnalités spécifiques aux documents académiques.

Le présent gabarit personnalise le gabarit `bookly` pour répondre aux besoins spécifiques des thèses du Conservatoire national des arts et métiers (Cnam). Il inclut d'autres fonctionnalités qui seront détaillées dans les chapitres suivants.

=== Polices de caractères

Pour utiliser le gabarit `cnam-thesis`, il est nécessaire d'installer les polices de caractères suivantes sur votre système :

- Texte : `TeXGyrePagellaX` (#link("https://www.ctan.org/tex-archive/fonts/newpx/", "lien de téléchargement")), `Libertinus Serif` (#link("https://ctan.org/pkg/libertinus-fonts?lang=en", "lien de téléchargement")) et `New Computer Modern` (inclus avec Typst).

- Mathématiques : `TeX Gyre Pagella Math` (#link("https://ctan.org/tex-archive/fonts/tex-gyre-math", "lien de téléchargement")), `Libertinus Math` (#link("https://ctan.org/pkg/libertinus-fonts?lang=en", "lien de téléchargement")) et `New Computer Modern Math` (inclus avec Typst).

- Code : `Cascadia Code` (#link("https://fonts.google.com/specimen/Cascadia+Code", "lien de téléchargement")), `Hack` (#link("https://github.com/source-foundry/Hack/tree/master/build/ttf", "lien de téléchargement")) et `DejaVu Sans Mono` (inclus avec Typst).

=== Couleurs du thème

Le gabarit `cnam-thesis` définit deux couleurs principales pour assurer une cohérence visuelle dans l'ensemble du document :

- Couleur primaire #box(width: 1em, height: 1em, fill: cnam-colors.primary)
- Couleur secondaire : #box(width: 1em, height: 1em, fill: cnam-colors.secondary)

#info-box[Les couleurs sont définies dans le #mtype("dictionary") `cnam-colors`. Vous pouvez y accéder en utilisant la syntaxe classique de Typst : `cnam-colors.primary` et `cnam-colors.secondary`.]

== Initialisation du gabarit

Pour utiliser le modèle, il faut l'importer dans votre fichier principal `typ`. En supposant que le template et le fichier principal sont dans le même dossier, il suffit d'insérer la commande suivante à la première ligne du fichier principal.

#code-box[```typ
#import "@preview/cnam-thesis:0.1.0": *
```]

#info-box[Si vous décomposez votre document en différents fichiers, il faut insérer la commande précédente en préambule de chaque fichier.]

Après avoir importé le modèle, celui doit être initialisé en appliquant une règle d'affichage (`show` rule) avec la commande #cmd("report-template") en passant les options nécessaires avec l'instruction `with` dans votre fichier principal `typ` :

#code-box[```typ
#show: cnam-thesis.with(
    title: "titre de la thèse",
    author: "Nom de l'auteur",
    lang: "fr",
    open-right: true,
    thesis-info: thesis-info-default,
)
```
]

Cette fonction d'initialisation contient un certain nombre d'arguments qui sont détaillés ci-dessous. Il est possible de modifier ces arguments en fonction de vos besoins.

#argument("title", default: ["Nom de la thèse"], type: [#mtype("string")|#mtype("content")])[Titre de la thèse]

#argument("author", default: ["Nom de l'auteur"], type: [#mtype("string")|#mtype("content")])[Auteur de la thèse]

#argument("lang", default: ["fr"], type: mtype("string"))[
  Langue du document.

  #text(size: 0.85em, info-box[Toutes les langues supportées par `bookly` sont supportées par le gabarit `cnam-thesis`.])
]
#argument("open-right", default: [true], type: mtype("bool"))[
  Si `true`, les chapitres s'ouvrent sur une page de droite. Si `false`, les chapitres s'ouvrent sur la page suivante.
]

#argument("thesis-info", default: [thesis-info-default], type: mtype("dictionary"))[
  Dictionnaire contenant les informations relatives à la thèse.

  - `doctoral-school` #mtype("string")|#mtype("content") : École doctorale de rattachement

  - `supervisor` #mtype("array") : Définition du ou des directeurs de thèse. Chaque membre est défini par un #mtype("dictionary") contenant les clés suivantes:
    - `name` #mtype("string")|#mtype("content") : Nom du directeur
    - `title` #mtype("string")|#mtype("content") : Statut du directeur (MCF HDR, PU, PRCM, #sym.dots)
    - `institution` #mtype("string")|#mtype("content") : Établissement/Entreprise de rattachement du directeur,

  - `supervisor` #mtype("array") : Définition du ou des co-encadrants de thèse. Chaque membre est défini par un #mtype("dictionary") contenant les clés suivantes:
    - `name` #mtype("string")|#mtype("content") : Nom du co-encadrant
    - `title` #mtype("string")|#mtype("content") : Statut du co-encadrant (MCF, MCF HDR, PU, PRCM, #sym.dots)

    - `institution` #mtype("string")|#mtype("content") : Établissement/Entreprise de rattachement du co-encadrant,

  - `laboratory` #mtype("string")|#mtype("content") : Nom du laboratoire de rattachement

  - `defense-date` #mtype("string")|#mtype("content") : Date de soutenance de la thèse

  - `discipline` #mtype("string")|#mtype("content") : Discipline de la thèse

  - `speciality` #mtype("string")|#mtype("content") : Spécialité de la thèse

  - `committee` #mtype("array") : Membres du jury de soutenance. Chaque membre est défini par un #mtype("dictionary") contenant les clés suivantes:
    - `name` #mtype("string")|#mtype("content") : Nom du membre du jury
    - `position` #mtype("string")|#mtype("content") : Poste du membre du jury
    - `role` #mtype("string")|#mtype("content") : Rôle du membre du jury (Président, Rapporteur, Examinateur, etc.)

  - `dedication` #mtype("string")|#mtype("content") : Dédicace de la thèse

  - `logo` #mtype("array") : Chemin vers le logo de l'institution


#set smartquote(enabled: false)
#noindent *Valeurs par défaut*
- `doctoral-school`: #text(fill: colors.default-param)["Sciences des Métiers de l'Ingénieur"],
- supervisor: #text(fill: colors.default-param)[`(:)`],
- co-supervisor: #text(fill: colors.default-param)[`(:)`],
- laboratory: #text(fill: colors.default-param)[`none`],
- defense-date: #text(fill: colors.default-param)[`none`],
- discipline: #text(fill: colors.default-param)["Sciences de l'ingénieur"],
- speciality: #text(fill: colors.default-param)["Mécanique"],
- committee: #text(fill: colors.default-param)[`(:)`],
- dedication: #text(fill: colors.default-param)[`none`],
- logo: #text(fill: colors.default-param)[`none`]
]

Pour définir les dictionnaires `supervisor`, `co-supervisor` et `committee`, plusieurs approches sont possibles :

#pagebreak()
+ Définition directe en Typst.
#code-box[
```typ
// main.typ
#let supervisor = (
  (name: "Henri Grégoire", title: "Abbé constitutionnelle", institution: "Cnam, Paris"),
  (name: "Henri Tresca", title: "Professeur titulaire de la Chaire de Mécanique", institution: "Cnam, Paris"),
)

#show: cnam-thesis.with(
    thesis-info: (
        supervisor: supervisor,
    ),
)
```
]

2. Définition dans un fichier `json`.
#code-box[
```json
// thesis-info.json
{
  "supervisor": [
    {
      "name": "Henri Grégoire",
      "title": "Abbé constitutionnelle",
      "institution": "Cnam, Paris"
    },
    {
      "name": "Henri Tresca",
      "title": "Professeur titulaire de la Chaire de Mécanique",
      "institution": "Cnam, Paris"
    }
  ]
}
```

#v(1em)
```typ
// main.typ
#show: cnam-thesis.with(
    thesis-info: json("/chemin/vers/thesis-info.json"),
)
```
]

3. Définition dans un fichier `yaml` séparé.
#code-box[
```yaml
# thesis-info.yaml
supervisor:
  - name: "Henri Grégoire"
    title: "Abbé constitutionnelle"
    institution: "Cnam, Paris"
  - name: "Henri Tresca"
    title: "Professeur titulaire de la Chaire de Mécanique"
    institution: "Cnam, Paris"
```

#v(1em)
```typ
// main.typ
#show: cnam-thesis.with(
    thesis-info: yaml("/chemin/vers/thesis-info.yaml"),
)
```
]

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
 annexes/
  annexe1.typ
 bibliographie/
  biblio.bib
 chapitres/
  chapitre1.typ
 images/
  logo.png
 preambule/
  resume.typ
```)

== Structure du fichier principal

À partir de la structure définie dans la section précédente, le fichier principal `main.typ` pourrait ressembler à ceci#footnote[Le code ci-dessous est le fichier principal utiliser pour rédiger le présent document.] :
#code-box[
```typ
// main.typ
#import "@preview/cnam-thesis:0.1.0": *

#let supervisor = ...
#let co-supervisor = ...
#let committee = ...

#show: cnam-thesis.with(
   title: [Guide d'utilisation du template \ Typst pour les thèses du Cnam],
    author: "Mathieu Aucejo",
    thesis-info: (
        doctoral-school: "Sciences des Métiers de l'Ingénieur",
        supervisor: supervisor,
        laboratory: "LMSSC",
        co-supervisor: co-supervisor,
        defense-date: "15 juin 2024",
        discipline: "Sciences de l'ingénieur",
        speciality: "Mécanique",
        committee: committee,
        dedication: [Les logiciels et les cathédrales, c’est un peu la même chose, d’abord on les construit, ensuite on prie. \ Sam Redwine],
    ),
    lang: "fr",
    open-right: true
)

#show: front-matter

#include "avant-propos/avant-propos.typ"

#show: main-matter

#tableofcontents
#listoffigures
#listoftables

#part[Guide d'utilisation]

#include "chapitres/chapitre-main.typ"

#bibliography("bibliographie/biblio.bib")

#show: appendix

#part[Annexes]
#include "annexes/annexes-main.typ"

#backcover(resume: ..., abstract: ...)
```
]

Le fichier principal présente la structure générale du document. On peut remarquer que le document comporte :
- Des environnements de préambule #cmd-("front-matter"), de corps de texte #cmd-("main-matter") et d'annexes #cmd-("appendix").

- Une table des matières #cmd-("tableofcontents"), une liste de figures #cmd-("listoffigures") et une liste de tableaux #cmd-("listoftables").

- Des parties #cmd-("part").

- Des chapitres et annexes importés depuis d'autres fichiers grâce à la commande #cmd-("include").

- Une bibliographie insérée avec la commande #cmd("bibliography").

- Une quatrième de couverture #cmd-("backcover") contenant le résumé et l'abstract du document.

#v(1em)
#noindent Tous ces éléments sont détaillés dans les chapitres suivants.
