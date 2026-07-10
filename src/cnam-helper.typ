#import "cnam-deps.typ": *

#let cnam-logo = state("cnam-logo", none)
#let cnam-lang = state("cnam-lang", "fr")
#let note-counter = counter("note-counter")
#let note-img = state("note-img", ())
#let note-content = state("note-content", ())

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
    (image("resources/logo/victoire.svg", width: 50%), image("resources/logo/cnam.png", width: 5.5cm))
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

#let activate-comment = marginalia.setup.with(
  inner: (far: 1.25cm, width: 0cm, sep: 0cm),
  outer: (far: 1.25cm, width: 4cm, sep: 0.5cm),
)

#let deactivate-comment = page.with(margin: auto)

#let cnam-colorize(svg, color) = {
  let blk = black.to-hex();
  if svg.contains(blk) {
    svg.replace(blk, color.to-hex())
  } else {
    svg.replace("<svg ", "<svg fill=\""+ color.to-hex() + "\" ")
  }
}

#let cnam-color-svg(
  path,
  color,
  ..args,
) = {
  let data = cnam-colorize(read(path), color)
  return image(bytes(data), ..args)
}

#let comment(by: "Reviewer", type: "note", inline: false, color: none, ..args, body) = context {
  set text(size: 0.8em)
  // Update the note counter
  note-counter.step()

  // Creation of the note content
  let note-cnt = note-counter.display()
  let note-text = [#text(fill: color)[*#note-cnt #by :*] #body]
  let img = if type != none {
    cnam-color-svg("resources/logo/" + type + ".svg", color, width: 1em)
  } else {
    none
  }
  let current-note-content = [
    #set par(first-line-indent: 0pt)
    #grid(
      columns: (auto,)*2,
      align: left + horizon,
      column-gutter: 2.5pt,
      img,
      text(fill: color)[*#note-cnt *]
    )
    #v(-0.75em)
    #text(fill: color)[*#by :*] #body
  ]

  let default-rect = rect.with(
    radius: 0.5em,
    inset: 0.5em,
  )

  let note = if inline {
    inline-note
  } else {
    margin-note
  }

  [
    #note-img.update(imgs => imgs + (img,))
    #note-content.update(content => content + (note-text,))
    #note(rect: default-rect, stroke: 0.5pt + color, fill: color.lighten(85%), ..args)[#current-note-content]
  ]
}

#let listofnotes = context {
  let title = if cnam-lang.get() == "fr" {
    "Commentaires de relecture"
  } else {
    "Review comments"
  }
  heading(title, numbering: none)
  let final-note-img = note-img.final()
  let final-note-content = note-content.final()

  let notes = query(selector(<margin-note>).or(<inline-note>)).enumerate().map(((index, note)) => {
    show: box // do not break entries across pages
    let note-icon = final-note-img.at(index, default: [])
    let note-entry = final-note-content.at(index, default: [])
    link(
      note.location().position(),
      grid(
        // columns: (1em, 1em, 1fr),
        columns: (1em, 1fr),
        column-gutter: 5pt,
        align: top,
        [#v(-1.5pt) #note-icon],
        [#note-entry #box(width: 1fr, repeat(gap: 0.5em)[.]) #note.location().page()],
      ),
    )
  })

  grid(
    row-gutter: 1em,
    ..notes
  )
}