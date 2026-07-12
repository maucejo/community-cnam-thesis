#import "@preview/cnam-thesis:0.1.0": *

= Validation PDF/A-1b

Cette annexe présente les instructions pour valider la conformité du document PDF généré avec le standard PDF/A-1b.

#minitoc

#pagebreak()

== Dépôt sur theses.fr

La plateforme #link("https://www.theses.fr/", "theses.fr") permet de déposer les thèses et mémoires de recherche. Pour que le document soit accepté, il doit être conforme au standard PDF/A-1b (ISO 19005-1).

== Validation CINES

Le service en ligne #link("https://facile.cines.fr/", "facile.cines.fr") est proposé par le CINES (Centre Informatique National de l'Enseignement Supérieur) pour valider la conformité des documents PDF avec le standard PDF/A-1b. Il est recommandé d'utiliser ce service pour vérifier que votre document respecte les exigences de formatage avant de le soumettre à theses.fr.

== Compilation Typst en PDF/A-1b

Typst prend en charge un certain nombre de standards de sortie PDF, y compris le format PDF/A-1b. Pour générer un document conforme à ce standard, plusieurs options sont possibles:

+ Ligne de commande

#code-box[
```bash
typst compile main.typ thesis.pdf --pdf-standard a-1b
```
]

2. Si vous utilisez l'application web de Typst, vous pouvez sélectionner le format PDF/A-1b dans les options d'exportation avant de télécharger le document (voir Figure @fig:pdfa-webapp).

#figure(
  image("../../images/pdfa-webapp.png", width: 50%),
  caption: [Sélection du format PDF/A-1b dans l'application web de Typst]
) <fig:pdfa-webapp>

3. Si vous utilisez l'extension Tinymist Visual Studio Code, vous pouvez configurer le format PDF/A-1b dans les paramètres de l'extension Typst. Pour ce faire, sélectionnez l'extension $->$ Export Tool. Choisissez ensuite le format PDF/A-1b dans la liste déroulante "PDF Validator" (voir Figure @fig:pdfa-vscode).

#figure(
  image("../../images/pdfa-vscode.png", width: 50%),
  caption: [Sélection du format PDF/A-1b dans l'extension Tinymist de Visual Studio Code]
) <fig:pdfa-vscode>

#warning-box[Le format PDF/A-1b est un standard strict qui impose certaines contraintes sur le contenu et la structure du document. Par exemple, ce standard n'accepte pas les images avec de la transparence. Assurez-vous de vérifier votre document après la compilation pour vous assurer qu'il est conforme à ce standard.]