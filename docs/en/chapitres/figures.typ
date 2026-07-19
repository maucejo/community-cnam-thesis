#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *
#import "@preview/lilaq:0.6.0" as lq

= Figures and tables <ch:figures>

This chapter presents the various commands and environments available for inserting figures and tables into the document.

#minitoc

#pagebreak()
== Figures

The basic syntax for inserting an image is as follows#footnote[For more information about the #cmd("image") command, see the #link("https://typst.app/docs/reference/visualize/image/", "Typst documentation")]:
#code-box[
```typst
#image("chemin/vers/image.png", width: 10cm)
```
]

#example-box(numbering: false)[
  ```typst
  #image("cnam.png")
  ```
][#image("../../images/cnam.png")]

#info-box[Typst supports a number of image formats. The currently supported formats are: PNG, JPEG, GIF, SVG, PDF, WEBP, and Raw Pixel Data.]

However, when writing a scientific text, it is often necessary to add a caption to the image and reference it in the text. For this, it is recommended to use Typst's #cmd("figure") environment. The syntax is as follows#footnote[For more information about the #cmd("figure") environment, see the #link("https://typst.app/docs/reference/model/figure/", "Typst documentation")]:

#code-box[
```typst
#figure(
  image("chemin/vers/image.png", width: 10cm),
  caption: "Image caption"
) <fig:mon-label>
```
]

This command inserts an image with a caption and a label for cross-referencing. The label is defined at the end of the #cmd("figure") environment with the syntax #text(fill: cnam-colors.primary,`<mon-label>`). To cite this figure in the text, simply use the command #text(fill: cnam-colors.primary,`@mon-label`).

#example(numbering: false,
```typst
#figure(
  image("./images/cnam.png"),
  caption: "Official Cnam logo"
) <fig:logo-cnam>

Figure @fig:logo-cnam shows the official Cnam logo.
```
)

You can also insert multiple images into a single figure by using the #cmd("subfigure") environment from the `bookly` template on which this template is based. The syntax is as follows:
#code-box[
```typ
#subfigure(
  figure(image("../images/image1.png"), caption: []),
  figure(image("../images/image2.png"), caption: []), <fig:b>,
  columns: (1fr, 1fr),
  caption: [(a) Left image and (b) Right image],
  label: <fig:subfig>,
)
```
]

#v(1em)
#example-box(ncol: 1, numbering: false, row-gutter: 1em)[
```typst
#subfigure(
  figure(image("./images/cnam.png"), caption: []),
  figure(image("./images/victoire.svg", width: 50%), caption: []), <fig:b>,
  columns: (1fr, 1fr),
  caption: [(a) Cnam logo and (b) Victory stamp],
  label: <fig:subfig>,
)

Figure @fig:subfig shows the official Cnam logo and the allegory of Winged Victory, associated with the Latin motto "_Docet Omnes Ubique_" (see Figure @fig:b).
```
][
#subfigure(
  figure(image("../../images/cnam.png"), caption: []),
  figure(image("../../images/victoire.svg", width: 50%), caption: []), <fig:b>,
  columns: (1fr, 1fr),
  caption: [(a) Cnam logo and (b) Victory stamp],
  label: <fig:subfig>,
)

Figure @fig:subfig shows the official Cnam logo and the allegory of Winged Victory, associated with the Latin motto "_Docet Omnes Ubique_" (see Figure @fig:b).
]

== Tables

Tables can be inserted into the document using Typst's #cmd("table") environment. The syntax is as follows#footnote[For more information about the #cmd("table") environment, see the #link("https://typst.app/docs/reference/model/table/", "Typst documentation")]:
#code-box[
```typst
#table(
  columns: 3,
  align: horizon,
  [*Column 1*], [*Column 2*], [*Column 3*],
  [Row 1, Cell 1], [Row 1, Cell 2], [Row 1, Cell 3],
  [Row 2, Cell 1], [Row 2, Cell 2], [Row 2, Cell 3],
)
```
]

#v(1em)
#example(numbering: false,
```typst
#table(
    columns: (1fr,)*2,
    align: center + horizon,
    inset: 5pt,
    [*Shape*], [*Perimeter*],
    [Square with side $a$],[$4a$],
    [Circle with radius $r$],[$2pi r$],
  )
```
)


As with figures, it is possible to add a caption and a label to a table by using the #cmd("table") environment from the `bookly` template. The syntax is as follows:
#code-box[
```typst
#figure(
  table(
    columns: 3,
    align: horizon,
    [*Column 1*], [*Column 2*], [*Column 3*],
    [Row 1, Cell 1], [Row 1, Cell 2], [Row 1, Cell 3],
    [Row 2, Cell 1], [Row 2, Cell 2], [Row 2, Cell 3],
  ),
  caption: "Table caption",
)
```
]

#v(1em)
#example(numbering: false,
```typ
#let mon-tableau = table(
    columns: (1fr,)*2,
    align: center + horizon,
    inset: 5pt,
    [*Shape*], [*Perimeter*],
    [Square with side $a$],[$4a$],
    [Circle with radius $r$],[$2pi r$],
  )

#figure(
  mon-tableau,
  caption: "Table of the perimeters of a few geometric shapes",
) <tab:perimetres>

Table @tab:perimetres presents the formulas used to calculate the perimeters of a few geometric shapes.
```
)

#info-box[Careful readers will have noticed that, to avoid cluttering the code, we defined the table in a variable named #text(fill: cnam-colors.primary,`mon-tableau`) before inserting it into the #cmd("figure") environment. This makes it possible to reuse the same table in different parts of the document if necessary and makes the code more readable.]

== Long and short captions for figures and tables

The `cnam-thesis` template lets you define a long caption and a short caption for figures and tables via the #cmd("ls-caption") function. The long caption is used in the figure or table caption, while the short caption is used in the list of figures or tables.

#v(1.5em)
#example-box(numbering: false,vspace: -1.5em)[
```typst
#figure(
    rect(),
    caption: ls-caption[This is a figure representing a rectangle (see the list of figures to view the short caption)][Representation of a rectangle],
  )
```
][
  #figure(
    rect(),
    caption: ls-caption[This is a figure representing a rectangle (see the list of figures to view the short caption)][Representation of a rectangle],
  )
]

== Creating plots directly in Typst

Since Typst is a Turing-complete language, it is possible to create plots directly in the document by using, for example, the `lilaq` package. This makes it possible to create charts and visualizations directly in the document without importing external images, while keeping a layout consistent with the rest of the document.

The example below shows how to create a figure with two plots representing the free response of a one-degree-of-freedom mechanical system in the undamped and underdamped cases. For more information about the `lilaq` package, see the #link("https://lilaq.org/", "lilaq documentation").

#example-box(ncol: 1, numbering: false, row-gutter: 11em)[
```typ
#import "@preview/lilaq:0.6.0" as lq

// Function computing the free response of a one-degree-of-freedom mechanical system
#let free_response(om0, xi, x0, v0, t) = {
  if xi < 1. {
    // Underdamped
    let Om0 = om0 * calc.sqrt(1 - xi * xi)
    let a = x0
    let b = (v0 + xi * om0 * x0) / Om0
    calc.exp(-xi * om0 * t) * (a * calc.cos(Om0 * t) + b * calc.sin(Om0 * t))
  } else if xi <= 1. {
    // Critically damped
    (x0 + (v0 + om0 * x0) * t) * calc.exp(-om0 * t)
  } else {
    // Overdamped
    let s = om0*calc.sqrt(xi * xi - 1)
    let a = x0
    let b = (v0 + xi * om0 * x0)/s
    calc.exp(-xi * om0 * t) * (a * calc.cosh(s * t) + b * calc.sinh(s * t))
  }
}

#let om0 = 2 * calc.pi * 2            // Natural angular frequency of the system (rad/s)
#let x0 = 0.02                        // Initial displacement (m)
#let v0 = -0.5                        // Initial velocity (m/s)
#let t = lq.linspace(0, 5, num: 500)  // Time vector (s)

// Create the undamped free-response plot
#let undamped = lq.diagram(
  width: 100%,
  title: [*Undamped free response*],
  xlabel: [Time (s)],
  ylabel: [Displacement (m)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

// Create the underdamped free-response plot
#let underdamped = lq.diagram(
  width: 100%,
  title: [Underdamped free response],
  xlabel: [Time (s)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0.1, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

// Create the grid to display the two plots side by side
#let fig-grid = grid(
  columns: (1fr,)*2,
  column-gutter: 1em,
  [#undamped], [#underdamped],
)

// Create the figure
#figure(
  fig-grid,
  caption: [Free response of a one-degree-of-freedom mechanical system],
) <fig:free-response>

Figure @fig:free-response shows the free response of a one-degree-of-freedom mechanical system in the undamped and underdamped cases.
```
][
#let free_response(om0, xi, x0, v0, t) = {
  if xi < 1. {
    // Underdamped
    let Om0 = om0 * calc.sqrt(1 - xi * xi)
    let a = x0
    let b = (v0 + xi * om0 * x0) / Om0
    calc.exp(-xi * om0 * t) * (a * calc.cos(Om0 * t) + b * calc.sin(Om0 * t))
  } else if xi <= 1. {
    // Critically damped
    (x0 + (v0 + om0 * x0) * t) * calc.exp(-om0 * t)
  } else {
    // Overdamped
    let s = om0*calc.sqrt(xi * xi - 1)
    let a = x0
    let b = (v0 + xi * om0 * x0)/s

    calc.exp(-xi * om0 * t) * (a * calc.cosh(s * t) + b * calc.sinh(s * t))
  }
}

#let om0 = 2 * calc.pi * 2
#let x0 = 0.02
#let v0 = -0.5
#let t = lq.linspace(0, 5, num: 500)

#let undamped = lq.diagram(
    width: 100%,
  title: [*Undamped free response*],
  xlabel: [Time (s)],
  ylabel: [Displacement (m)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

#let underdamped = lq.diagram(
  width: 100%,
  title: [*Underdamped free response*],
  xlabel: [Time (s)],
  margin: 0%,
  lq.plot(t, t => free_response(om0, 0.1, x0, v0, t),
  color: cnam-colors.primary,
  mark: none,
  ),
)

#let fig-grid = grid(
  columns: (1fr,)*2,
  column-gutter: 1em,
  [#undamped], [#underdamped],
)

#figure(
  fig-grid,
  caption: [Free response of a one-degree-of-freedom mechanical system],
) <fig:free-response>

#noindent Figure @fig:free-response shows the free response of a one-degree-of-freedom mechanical system in the undamped and underdamped cases.
]