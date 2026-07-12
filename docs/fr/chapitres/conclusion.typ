#import "@preview/cnam-thesis:0.1.0": *

#show: chapter-nonum

= Conclusion

Ce guide d'utilisation du template `cnam-thesis` pour Typst a été conçu pour aider les étudiants et les chercheurs à rédiger leur mémoire conformément aux normes du Conservatoire national des arts et métiers (Cnam). Il fournit des instructions détaillées sur la configuration du document, l'organisation des sections, la gestion des références bibliographiques, et l'utilisation des fonctionnalités avancées telles que les annotations.

== Récapitulatif des fonctionnalités

#set table(stroke: none)
#table(
  columns: (auto, 1fr, auto),
  align: left + horizon,
  table.hline(),
  [Fonctionnalité], [Syntaxe], [Chapitre],
  table.hline(),
  [Importation du gabarit], [`#import "@preview/cnam-thesis:0.1.0": *`], table.cell(rowspan: 2)[Chapitre @ch:usage-general],
  [Initialisation du gabarit], [`#show: cnam-thesis.with(...)`],
  table.hline(),
  [Hiérarchisation des titres], [`= Chapitre`, `== Section`, `=== Sous-section`], table.cell(rowspan: 7)[Chapitre @ch:structure],
  [Chapitres non numérotés], [`#show: chapter-nonum`],
  [Sections non numérotées], [`== Section <nomnum-sec>`],
  [Références croisées], [`<mon-label>` + `@mon-label`],
  [Environnements de mise en page], [`front-matter`, `main-matter`, `appendix`],
  [Insertion de parties], [`#part[Titre de la partie]`],
  [Quatrième de couverture], [`backcover(...)`],
  table.hline(),
  [Insertion d'une image], [`image("chemin/vers/image.png")`], table.cell(rowspan: 4)[Chapitre @ch:figures],
  [Insertion d'un tableau], [`table(...)`],
  [Figures/tableaux numérotés], [`figure(...)`],
  [Sous-figures], [`subfigure(...)`],
  table.hline(),
  [Équations en ligne], [`$E=mc^2$`], table.cell(rowspan: 3)[Chapitre @ch:equations],
  [Équations numérotées], [`$ E=mc^2 $`],
  [Équations non numérotées], [`$ E=mc^2 $ <nonum-eq>`],
  table.hline(),
  [Boîte d'information], [`#info-box[...]`], table.cell(rowspan: 7)[Chapitre @ch:boxes],
  [Boîte de conseil], [`#tip-box[...]`],
  [Boîte d'avertissement], [`#warning-box[...]`],
  [Boîte d'information importante], [`#important-box[...]`],
  [Boîte de démonstration], [`#proof-box[...]`],
  [Boîte de question], [`#question-box[...]`],
  [Boîte de code], [`#code-box[...]`],
  table.hline(),
)

#pagebreak()
#table(
  columns: (auto, 1fr, auto),
  align: left + horizon,
  table.hline(),
  [Fonctionnalité], [Syntaxe], [Chapitre],
  table.hline(),
  [Insertion d'une bibliographie], [`#bibliography("chemin/vers/biblio.bib")`], table.cell(rowspan: 3)[Chapitre @ch:ref],
  [Citation dans le texte], [`@cle`],
  [Références multiples], [`@cle1 @cle2`],
  table.hline(),
  [Activation des commentaires], [`#show: activate-comment`], table.cell(rowspan: 3)[Chapitre @ch:review],
  [Commentaire], [`#comment(...)[Texte du commentaire]`],
  [Commentaire mis en évidence], [`#highlight-comment(...)[text][comment]`],
  table.hline(),
)
