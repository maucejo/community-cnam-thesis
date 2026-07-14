#import "@preview/cnam-thesis:0.1.0": *

#let default-type-color = rgb("#eff0f3")
#let function-name-color = rgb("#4b69c6")
#let rainbow-map = ((rgb("#7cd5ff"), 0%), (rgb("#a6fbca"), 33%),(rgb("#fff37c"), 66%), (rgb("#ffa49d"), 100%))
#let gradient-for-color-types = gradient.linear(angle: 7deg, ..rainbow-map)
#let gradient-for-tiling = gradient.linear(angle: -45deg, rgb("#ffd2ec"), rgb("#c6feff")).sharp(2).repeat(5)

#let colors = (
  "default": default-type-color,
  "default-param": rgb("b50256"),
  "content": rgb("#a6ebe6"),
  "string": rgb("#d1ffe2"),
  "str": rgb("#d1ffe2"),
  "label": rgb("#a7eaff"),
  "none": rgb("#ffcbc4"),
  "auto": rgb("#ffcbc4"),
  "bool": rgb("#ffedc1"),
  "boolean": rgb("#ffedc1"),
  "integer": rgb("#e7d9ff"),
  "int": rgb("#e7d9ff"),
  "float": rgb("#e7d9ff"),
  "ratio": rgb("#e7d9ff"),
  "length": rgb("#e7d9ff"),
  "angle": rgb("#e7d9ff"),
  "relative length": rgb("#e7d9ff"),
  "relative": rgb("#e7d9ff"),
  "fraction": rgb("#e7d9ff"),
  "symbol": default-type-color,
  "array": default-type-color,
  "dictionary": default-type-color,
  "dict": default-type-color,
  "arguments": rgb("#4428c1"),
  "selector": default-type-color,
  "module": default-type-color,
  "stroke": default-type-color,
  "function": rgb("#f9dfff"),
  "color": gradient-for-color-types,
  "gradient": gradient-for-color-types,
  "tiling": gradient-for-tiling,
  "signature-func-name": rgb("#4b69c6"),
)

#let mtype(type) = box(fill: colors.at(type), radius: 0.25em, inset: 0.25em, text(size: 0.8em, font: cnam-fonts.raw, type))

#let render-box = showybox.with(
  title: align(center)[
    #let title = context if cnam-states.lang.get() == "fr" {
      "Rendu"
    } else {
      "Rendering"
    }
    #text(fill: black)[*#title*]],
  title-style:(
    sep-thickness: 0pt,
  ),
  frame: (
    title-color: teal.lighten(75%),
    border-color: teal,
    body-color: teal.lighten(95%),
    thickness: (left: 2pt, rest: 0.5pt),
    radius: 2.55pt
  ),
  align: center,
  breakable: true
)

#let cmd(body) = [#text(size: 0.9em, fill: function-name-color, font: cnam-fonts.raw)[\#*#body*()]]

#let cmd-(body) = [#text(size: 0.9em, fill: function-name-color, font: cnam-fonts.raw)[\#*#body*]]

#let example-box(left, right, lang: true, numbering: true, lang-color: teal, vspace: 0em) = grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  align: horizon,
  [#zebraw(
    lang: lang,
    lang-color: lang-color,
    numbering: numbering, left)

  ],
  [#v(vspace) #render-box[#right]],
)

#let argument(name, default: none, type: none, body) = context {
  block(
    width: 100%,
    stroke: 0.5pt + colors.default.darken(25%),
    radius: 2pt,
    inset: (top: 6pt, rest: 7pt),
    above: 1.5em,
    [
      #let arg-name = if cnam-states.lang.get() == "fr" {"Paramètre"} else {"Argument"}
      #let def = if default != none {[: ]} else {none}
      #place(top+left, dy: -15.5pt, dx: 5.75pt, box(inset: 5pt, fill:white, text(size: 0.85em, arg-name)))
      #v(5pt)
      #grid(
      columns: (1fr, 1fr),
      column-gutter: 1em,
      align: (left, right),
      [
        #set text(size: 0.85em, font: cnam-fonts.raw)
        #set smartquote(enabled: false)
        #text(fill: colors.arguments)[#sym.chevron.l#name#sym.chevron.r]#def#text(fill: colors.default-param, default)
      ],
      [#type]
    )
    #noindent#body
    ]
  )
}

#let code-box-zebraw(body) = code-box[
  #show: box.with(inset: (top: -0.5em, bottom: 0.25em, left: -1.25em))
  #zebraw(
    lang: false,
    background-color: false,
    inset: (top: 0.5em, bottom: 0em, left: 0.5em),
    body
  )
]