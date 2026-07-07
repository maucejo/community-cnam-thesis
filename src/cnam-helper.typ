#import "cnam-deps.typ": *

#let cnam-logo = state("cnam-logo", none)

#let cnam-fonts = (
    body: ("TeXGyrePagellaX", "Libertinus Serif", "New Computer Modern"),
    math: ("TeX Gyre Pagella Math", "Libertinus Math", "New Computer Modern Math"),
    raw: ("Cascadia Code", "Hack", "DejaVu Sans Mono"),
)

#let cnam-colors = (
    primary: rgb("#c1002A"),
    secondary: rgb("#dddddd").darken(15%)
)

#let thesis-info-default = (
    doctoral-school: "Sciences des Métiers de l'Ingénieur",
    supervisor: (:),
    co-supervisor: (:),
    laboratory: none,
    defense-date: none,
    discipline: "Sciences de l'ingénieur",
    speciality: "Mécanique",
    committee: (:),
    dedication: none,
    logo: none
)

#let backcover(resume: none, abstract: none) = context {
  let logo = if cnam-logo.get() != none {
    let custom-logo = cnam-logo.get()
    if type(custom-logo) == array { custom-logo } else { (custom-logo,) }
  } else {
    (image("resources/logo/victoire.svg", width: 42.5%), image("resources/logo/cnam.png", width: 5.5cm))
  }

  back-cover(
    abstracts: (
      (
        title: [#set text(lang: "fr"); Résumé :],
        text: resume
      ),
      (
        title: [#set text(lang: "en", region: "gb"); Abstract:],
        text: abstract
      ),
    ),
    logo: logo
  )
}