#import "../src/cnam-thesis.typ": *

#let supervisor = (
  (name: "Henri Grégoire", title: "Abbé constitutionnelle", institution: "Cnam, Paris"),
  (name: "Henri Tresca", title: "Professeur titulaire de la Chaire de Mécanique", institution: "Cnam, Paris"),
)

#let co-supervisor = (
  (name:"Pierre-Simon Laplace", title: "Professeur de tout", institution: "Institut de France, Paris"),
  (name:"Joseph Fourier", title: "Membre de l'Académie des Sciences", institution: "Académie des sciences, Paris"),
)

#let committee = (
  (name: "Jean-Antoine Chaptal", position: "Professeur des Unversités, Chaire de Chimie Appliquée, Conservatoire national des arts et métiers, Paris, France", role: "Président du jury"),
  (name: "Donald Ervin Knuth", position: "Professeur émérite, Département d'Informatique, Université de Stanford, Palo, Alto, Californie, États-Unis", role: "Rapporteur"),
  (name: "Ada Lovelace", position: "Maître de conférences HDR, Département de Mathématiques, Université de Londres, Royaume-Uni", role: "Rapportrice"),
  (name: "Jacques de Vaucanson", position: "Inspecteur général des manufactures, Académie royale des sciences, Paris, France", role: "Examinateur"),
  (name: "Henri Grégoire", position: "Abbé constitutionnelle, Conservatoire national des arts et métiers, Paris, France", role: "Directeur de thèse"),
  (name: "Henri Tresca", position: "Professeur titulaire de la Chaire de Mécanique, Conservatoire national des arts et métiers, Paris, France", role: "Co-directeur de thèse"),
)

#show: cnam-thesis.with(
    title: [Guide d'utilisation du template \ Typst pour les thèses du Cnam],
    author: "Mathieu Aucejo",
    thesis-info: (
        doctoral-school: "Sciences des Métiers de l'Ingénieur",
        supervisor: supervisor,
        laboratory: "Laboratoire de Mécanique des Structures et des Systèmes Couplés",
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

#show: appendix

#part[Annexes]
#include "annexes/annexes-main.typ"