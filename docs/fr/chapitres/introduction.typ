#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/swank-tex:0.1.0": LaTeX

#show: chapter-nonum

= Introduction

== Contexte et objectifs

Les doctorants du Conservatoire national des arts et métiers (Cnam) doivent rédiger leur thèse en respectant certaines normes et exigences. Le format de la thèse, la mise en page, les polices de caractères, les couleurs et d'autres éléments doivent être conformes aux directives du Cnam. Cependant, tous ne souhaitent pas utiliser #LaTeX, qui est souvent considéré comme complexe à utiliser et difficile à apprendre. Depuis 2023, Typst est est apparu comme une alternative moderne et efficace à #LaTeX. Typst est un langage de balise qui permet de créer des documents de haute qualité avec une syntaxe simple et intuitive. Il est particulièrement adapté à la rédaction de thèses, car il permet de gérer facilement les références, les figures, les tableaux et les équations.

Les objectifs de ce guide sont de présenter le gabarit Typst pour les thèses du Cnam, ainsi que de fournir des instructions détaillées sur son utilisation. Ce guide n'a pas pour vocation de fournir une introduction complète à Typst, mais plutôt de se concentrer sur les aspects spécifiques à la rédaction à ce gabarit.

Pour plus d'information sur Typst, vous pouvez consulter le #link("https://typst.app/docs/", "site officiel de Typst"). La documentation officielle de Typst est très complète et fournit des exemples et des explications détaillées sur les différentes fonctionnalités du langage. Vous pouvez aussi consulter le livre #link("https://github.com/CRStefano/Typst-Handbook-A-Comprehensive-Guide/blob/main/TYPST%20HANDBOOK_FROM%20ZERO%20TO%20HERO_STEFANO%20COELATI%20RAMA_EN.pdf", "Typst Handbook: From Zero to Hero") de Stefano Coelati Rama, qui est un guide complet pour apprendre Typst.

== Structure du guide

Ce guide est organisé en sept chapitres thématiques :

+ *Usage général* -- Instruction générales pour l'utilisation du gabarit `cnam-thesis`.

+ *Mise en forme* -- Hiérarchie des titres, numérotation, références croisées, listes, etc.

+ *Figures et tableaux* -- Insertion d'images, figures, tableaux, légendes, mise en forme, figures multi-colonnes, etc.

+ *Équations et algorithmes* -- Syntaxe des équations équations et insertion d'algorithmes.

+ *Boîtes informationnelles* -- Types de boîtes, mise en forme, couleurs, icônes, etc.

+ *Références et glossaire* -- Bibliographie, formats de fichier, création d'un glossaire, etc.

+ *Commentaires de relecture* -- Notes de marge, commentaires, etc.

== Présentation de Typst

Typst est un nouveau langage de balise open source é crit en Rust et développé à partir de 2019 par deux étudiants allemands, Laurenz Mädje et Martin Haug. La version 0.1.0 a été publiée sur GitHub le 04 avril 2023#footnote[Adresse du dépôt GitHub : #link("https://github.com/typst/typst")].

Typst se présente comme un successeur de #LaTeX plus moderne, rapide et simple d'utilisation. Parmi ses avantages, on peut citer :

- la compilation incrémentale ;

- des messages d'erreur clair et compréhensible ;

- un langage de programmation Turing-complet ;

- une système de style cohérent permettant de configurer aisément tous les aspects de son document (police, pagination, marges, #sym.dots) ;

- une communauté active et sympathique (serveur Discord pour le support, annonce de nouveaux paquets) ;

- un système de paquets simple d'utilisation (pour rechercher ou voir la liste des paquets, n'hésitez pas à visiter #link("https://typst.app/universe", "Typst Universe") ;

- des extensions pour VS Code existent, comme `Tinymist`. Celles-ci offrent des fonctionnalités similaires à `LaTeX Workshop`.

== Installation et utilisation de Typst-CLI

L'installation de Typst-CLI#footnote[Utilitaire en ligne de commande] est simple et rapide et est disponible pour Windows, macOS et Linux.

- Compilation à partir des sources : Si vous souhaitez compiler Typst à partir des sources, vous pouvez suivre les instructions disponibles sur le dépôt GitHub du projet. Vous aurez besoin d'installer #link("https://rust-lang.org/tools/install/", "Rust") et #link("https://doc.rust-lang.org/cargo/", "Cargo"). Une fois fait, vous pouvez utiliser la commande suivante dans votre terminal :
#code-box[
  ```bash
  cargo install --locked typst-cli
  ```
]

- Windows : Plusieurs méthodes sont disponibles pour installer Typst sur Windows. Vous pouvez télécharger le binaire sur le dépôt GitHub de projet, ou utiliser un gestionnaire de paquets comme #link("https://chocolatey.org/", "Chocolatey"), #link("https://scoop.sh/", "Scoop") ou #link("https://winget.run/", "Winget"). Pour installer Typst avec ses gestionnaires de paquets, vous pouvez utiliser les commandes suivantes dans votre terminal :
#import "@preview/conch:0.1.0": system, terminal

#code-box[
    ```bash
    choco install typst              # pour Chocolatey
    scoop install main/typst         # pour Scoop
    winget install --id Typst.Typst  # pour Winget
    ```
]

- Linux : Typst est disponible sur la plupart des gestionnaires de paquets associé aux grandes distributions. Vous pouvez l'installer avec les commandes suivantes dans votre terminal :
#code-box[
```bash
sudo snap install typst                                    # Snapcraft (Ubuntu)
sudo dnf copr enable claaj/typst & sudo dnf install typst  # Fedora
sudo pacman -S typst                                       # Arch-based
```
]

- MacOS : Typst peut être installé sur macOS en utilisant les gestionnaire de paquets #link("https://brew.sh/", "Homebrew") ou #link("https://www.macports.org/", "MacPorts"). Vous pouvez l'installer avec la commande suivante dans votre terminal :

#code-box[
```bash
brew install typst
sudo port install typst
```
]

Une fois l'utilitaire Typst-CLI installé, vous pouvez compiler vos fichiers Typst en utilisant la commande suivante dans votre terminal :
#code-box[
```bash
typst compile /chemin/vers/fichier.typ.                     # Sortie fichier.pdf
typst compile /chemin/vers/fichier.typ /chemin/vers/fichier_compile.pdf. # Sortie fichier_compile.pdf
```
]

Typst-CLI offre également d'autres fonctionnalités, telles que la visualisation en temps réel de vos documents. Celle-ci surveille les modifications apportées à vos fichiers et recompile automatiquement le document. Pour l'utiliser, il faut ouvrir le PDF généré avec un lecteur PDF compatible avec la mise à jour automatique après avoir exécuté la commande suivante dans votre terminal :
#code-box[
```bash
typst watch fichier.typ
```
]

== Installation et utilisation des utilitaires

Plusieurs types d'utilitaires sont disponibles pour faciliter l'utilisation de Typst. Ces utilitaires concernent principalement les éditeurs de texte et les environnements de développement intégrés (IDE). Ces outils permettent d'améliorer l'expérience de l'utilisateur en offrant des fonctionnalités telles que la coloration syntaxique, l'autocomplétion, la compilation en temps réel et la visualisation du PDF généré.

=== Éditeurs de texte et IDE

La section précédente a présenté l'installation et l'utilisation de Typst-CLI qui permet de travailler en local avec Typst. Cette solution est idéale pour les utilisateurs avancés qui aiment travailler avec des éditeurs de texte et des terminaux. Cependant, pour les utilisateurs qui préfèrent utiliser un environnement de développement intégré (IDE) ou un éditeur de texte avec une interface graphique, il existe plusieurs options disponibles.

#pagebreak()

- *Éditeurs de texte*

  Typst peut être utilisé avec n'importe quel éditeur de texte, mais certains éditeurs offrent des fonctionnalités supplémentaires comme la coloration syntaxique. Libre à vous d'utiliser votre éditeur de texte préféré.

- *Visual Studio Code et ses dérivés*

  #link("https://code.visualstudio.com/", "Visual Studio Code") (VS Code) est un éditeur de code source développé par Microsoft. Il est gratuit, open source et disponible pour Windows, macOS et Linux. VS Code est largement utilisé par les développeurs principalement en raison de sa flexibilité, de sa personnalisation et de son large éventail d'extensions disponibles.

  Pour utiliser Typst avec VS Code, vous pouvez installer l'extension `Tinymist`. Cette extension offre des fonctionnalités similaires à celles de `LaTeX Workshop`, telles que la compilation en temps réel, la visualisation du PDF généré. Pour installer l'extension, vous pouvez suivre les étapes suivantes :
  - Ouvrir VS Code

  - Accéder au panneau des extensions

  - Rechercher `Tinymist`

  - Cliquer sur `Installer`

  #info-box[`Tinymist` embarque un compilateur Typst, ce qui signifie que vous n'avez pas besoin d'installer Typst-CLI séparément. Cependant, si vous souhaitez utiliser Typst-CLI pour compiler vos fichiers Typst, vous pouvez le faire en suivant les instructions de la section précédente.

  #noindent `Tinymist` est disponible sur tous les IDE dérivant de VS Code, tels que VS Codium, Cursor, WindSurf ou encore Positron.
]

- *IDE JetBrains*

  Typst peut également être utilisé avec les IDE de #link("https://www.jetbrains.com/fr-fr/", "JetBrains"), tels que IntelliJ IDEA, PyCharm, WebStorm, etc. Pour utiliser Typst avec ces IDE, vous pouvez installer l'extension `Typst Support` qui est basée sur `Tinymist`. Pour installer cette extension, vous pouvez suivre les étapes suivantes :

  - Ouvrir votre IDE JetBrains

  - Aller dans `Settings` > `Plugins`

  - Rechercher `Typst Support`

  - Cliquer sur `Install`

- *IDE cloud*

Malgré sa jeunesse, Typst dispose d'un #link("https://typst.app/", "IDE cloud officiel"). Cet IDE dispose d'une offre gratuite généreuse pour une utilisation personnelle. Des alternatives à l'IDE cloud officiel existent, comme #link("https://www.typetex.app/", "TypeTeX").

=== Gestionnaire de paquets

Contrairement à #LaTeX, Typst ne fournit de distribution de paquets à l'instar de TeXLive ou MikTeX. Les paquets Typst sont centralisés sur #link("https://github.com/typst/packages", "un dépôt GitHub") et peuvent être trouvés via le moteur de recherche #link("https://typst.app/universe/","Typst Universe")#footnote[Si vous souhaitez rechercher en fonction du nombre d'étoiles sur GitHub, vous pouvez utiliser #link("https://orangex4.github.io/typst-universe-with-stars/", "Typst Universe with Stars (Unofficial)")].

Pour installer un paquet Typst, il vous suffit simplement de l'importer dans votre fichier Typst en utilisant l'une des syntaxes suivantes :
#code-box[
```typst
#import "@preview/nom-du-paquet:version": *
#import "@preview/nom-du-paquet:version": nom-du-paquet
#import "@preview/nom-du-paquet:version": func1, func2
```
]

Prenons l'exemple du paquet `cnam-thesis` qui est utilisé dans ce guide. Pour l'importer, vous pouvez utiliser la syntaxe suivante :
#code-box[
```typst
// Importe toutes les fonctions et variables du paquet
#import "@preview/cnam-thesis:0.1.0": *

// Importe le nom du paquet pour l'utiliser dans votre code
// Par exemple, #ct.info-box[...] crée une boîte d'information
#import "@preview/cnam-thesis:0.1.0": ct

// Importe uniquement les fonctions `info-box` et `warning-box` du paquet
// Les autres fonctions et variables du paquet seront inaccessibles
#import "@preview/cnam-thesis:0.1.0": info-box, warning-box
```
]

La première fois que vous importez un paquet Typst dans votre fichier `*.typ`, le compilateur Typst télécharge automatiquement le paquet depuis le dépôt GitHub et le met en cache, ce qui permet de l'utiliser ultérieurement sans avoir à le télécharger à nouveau.

Vous l'aurez compris, il n'existe pas de gestionnaire de paquets au sens classique pour gérer les dépendances. Vous pouvez bien sûr gérer vos dépendances manuellement en modifiant les versions des paquets dans vos fichiers Typst, mais cela peut devenir fastidieux et source d'erreurs. C'est pourquoi, il est recommandé d'utiliser un gestionnaire de paquets pour gérer vos dépendances. Les fonctionnalités minimales attendues d'un gestionnaire de paquets pour Typst sont les suivantes :

- Initialiser un projet pour créer la bonne structure de fichiers et de dossiers pour un projet Typst ;

- Copier les fichiers dans un espace de nommage donné (typiquement `@local` ou `@preview`) ;

- Synchroniser les dépendances avec le dépôt GitHub des paquets Typst pour mettre à jour les versions des paquets.

Parmi les gestionnaires existants répondant (même partiellement) à ces critères, on peut citer :

- #link("https://github.com/typst-community/utpm", "UTPM") -- Unofficial Typst Package Manager (mon préféré #emoji.face.wink)

- #link("https://github.com/npikall/gotpm", "GoTPM") -- Go Typst Package Manager

- #link("https://github.com/mkpoli/tyler", "Tyler") et #link("https://github.com/sjfhsjfh/typship", "Typship")

#info-box[Si vous avez simplement besoin de copier vos fichiers Typst dans un espace de nommage donné, vous pouvez utiliser les scripts `just` que vous trouverez dans le dépôt GitHub #link("https://github.com/typst-community/typst-package-template", "Typst Package Template").]
