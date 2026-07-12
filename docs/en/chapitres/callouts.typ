#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *

= Callout boxes <ch:boxes>

Callout boxes are formatting elements used to highlight specific information in a document. They are often used to draw the reader's attention to important points, tips, warnings, or additional notes.

#minitoc

#pagebreak()

== Available boxes

The `cnam-thesis` template provides several types of informational boxes, each with a specific style and purpose. Here are the main available boxes:

- #cmd-("info-box"): Used to provide general information or useful advice.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#info-box[This is an information box.]
```
][
#info-box[
This is an information box.
]
]

- #cmd-("tip-box"): Used to provide tips or recommendations.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#tip-box[This is a tip box.]
```
][
#tip-box[
This is a tip box.
]
]

#v(1em)
- #cmd-("warning-box"): Used to warn the reader about a potential danger or important information.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#warning-box[This is a warning box.]
```
][
#warning-box[
This is a warning box.
]
]

#v(1em)
- #cmd-("important-box"): Used to emphasize crucial information or key points.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#import "bookly-themes.typ": *
#important-box[This is an important box.]
```
][
#important-box[
This is an important box.
]
]

#v(1em)
- #cmd-("proof-box"): Used to present proofs or mathematical demonstrations.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#proof-box[This is a proof box.]
```
][
#proof-box[
This is a proof box.
]
]

#v(1em)
- #cmd-("question-box"): Used to ask questions or propose problems to solve.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#question-box[This is a question box.]
```][
#question-box[
This is a question box.
]
]

- #cmd-("code-box"): Used to present source code or code snippets.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
#code-box[This is a code box.]
```
][
#code-box[
This is a code box.
]
]

#warning-box[Informational boxes should be used carefully and sparingly to avoid overloading the document.]

== Special cases for code boxes

To fill a code box, you can use Typst's native syntax:

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

You can add line numbering by using dedicated packages, such as `zebraw`:

#v(1em)
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

#pagebreak()
#info-box[The `zebraw` package is an explicit dependency of the `cnam-thesis` template. It can therefore be used directly without importing it explicitly.]

To go further, you can consult the documentation for #link("https://github.com/hongjr03/typst-zebraw", [`zebraw`]). Note that other packages exist for code formatting, such as #link("https://github.com/Dherse/codly", [`codly`]) or #link("https://github.com/jneug/typst-codelst", [`codelst`]). However, these packages are not dependencies of the `cnam-thesis` template and must therefore be explicitly imported if you want to use them.