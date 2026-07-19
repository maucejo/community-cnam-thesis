#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/swank-tex:0.1.0": LaTeX
#import "../../guide-utils.typ": *

= Equations and algorithms <ch:equations>

This chapter presents the different ways to write equations and insert algorithms in a thesis document.

#minitoc

#pagebreak()

#warning-box[
#set par(first-line-indent: 0pt)
La syntaxe des équations Typst diffère de celle de #LaTeX. Pour plus d'informations sur la syntaxe des équations Typst, veuillez consulter la #link("https://typst.app/docs/reference/math/", "documentation officielle de Typst").
Typst equation syntax differs from #LaTeX syntax. For more information about Typst equation syntax, please refer to the #link("https://typst.app/docs/reference/math/", "official Typst documentation").

To access the full list of mathematical symbols available in Typst, click #link("https://typst.app/docs/reference/symbols/sym/", "here"). \
For the full list of emojis (and yes, it is possible #emoji.cat.face.heart), click #link("https://typst.app/docs/reference/symbols/emoji/", "there"). However, their use should be avoided in an academic document (but I thought it was amusing to mention).

]

== Inline equations

Inline equations are written between the `$...$` symbols and are integrated into the text.

#v(1em)
#example(numbering: false,
```typ
#let st = sym.space.thin

The Fourier transform of a function $f(t)$ is defined by the integral $hat(f)(xi) = integral_(-oo)^(+oo) f(t) st e^(-2 pi i xi t) dif t$
```
)

== Numbered and unnumbered equations

Numbered equations are written between the `$ ... $` symbols and are centered on the page. As with figures and tables, you can add a #mtype("label") to refer to them in the text.

#warning-box[
#set par(first-line-indent: 0pt)
The difference between numbered equations and inline equations is subtle. Indeed, an inline equation is written as:
```typ
$y = f(x)$,
```
whereas a numbered equation is written as (note the space before and after the `$` symbol):
```typ
$ y = f(x) $.
```
]

#v(1em)
#example(numbering: false,
```typ
$
i planck (partial Psi)/ (partial t) = hat(H) space.thin Psi.
$ <eq:schrodinger>

The Schrödinger equation @eq:schrodinger describes the temporal evolution #sym.dots
```
)

To avoid numbering an equation, simply add the #mtype("label") #text(fill: cnam-colors.primary)[`<nonum-eq>`] after the closing `$` symbol of the equation. For example, the following equation will not be numbered:

#v(1.25em)
#example(numbering: false,
```typ
$
i planck (partial Psi)/ (partial t) = hat(H) space.thin Psi.
$ <nonum-eq>
```
)

== Advanced environments

Equations can also be written in more complex environments, such as systems of equations. For example, to write equations over multiple lines, you can use:

#v(1em)
#example(numbering: false, vspace: -1em,
```typ
#let bm(x) = $upright(bold(#x))$
$
  nabla dot.c bm(E) &= rho/epsilon_0, \
  nabla dot.c bm(B) &= 0, \
  nabla times bm(E) &= - (partial bm(B))/(partial t), \
  nabla times bm(B) &= mu_0 space.thin bm(J) + mu_0 epsilon_0 (partial bm(E))/(partial t).
$
```
)

You can also write the previous equations as a single numbered equation:
#v(1em)
#example(numbering: false, vspace: -1em,
```typ
#let bm(x) = $upright(bold(#x))$
$
  nabla dot.c bm(E) &= rho/epsilon_0, \
  nabla dot.c bm(B) &= 0, \
  nabla times bm(E) &= - (partial bm(B))/(partial t), \
  nabla times bm(B) &= mu_0 space.thin bm(J) + mu_0 epsilon_0 (partial bm(E))/(partial t).
$ <equate:revoke>
```
)

#info-box[Sub-equation numbering is handled by the `equate` package. The #mtype("label") #text(fill: cnam-colors.primary)[`<equate:revoke>`] makes it possible to use Typst's native numbering system.]

You can also write equations as a system of equations, as follows:

#v(0.5em)
#example(numbering: false,
```typ
$
  cases(
    dot(x)(t) &= A x(t) + B u(t),
    y(t) &= C x(t) + D u(t),
  )
$
```
)

#pagebreak()
The `bookly` template allows the creation of boxed equations using the #cmd("boxeq") command.

#v(1em)
#example-box(numbering: false, vspace: -1em)[
```typ
$
  #boxeq($y = f(x)$)
$
```
][
$
  #boxeq($y = f(x)$)
$
]

Finally, it is possible to add color to equations:

#v(1em)
#example-box(numbering: false)[
```typ
#let colred(x) = text(fill: cnam-colors.primary, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

$
  colred(y) = colblue(f)(x)
$
```
][
#let colred(x) = text(fill: cnam-colors.primary, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

$
  colred(y) = colblue(f)(x)
$
]

== Algorithms

Algorithms can be inserted into the thesis document using the #cmd("algorithm") command, which is based on the package #link("https://github.com/andreasKroepelin/lovelace", [`lovelace`]). This command accepts the following parameters:

#argument("caption", default: "none", type: [#mtype("string")|#mtype("content")])[
  Algorithm caption. If #mtype("none"), no caption is displayed.
]

#argument("line-numbering", default: ["1"], type: mtype("string"))[
  Line numbering for the algorithm.

  If #mtype("none"), no line numbering is displayed.
]

#pagebreak()
#example-box(numbering: false)[
```typ
#algorithm(caption: [My algorithm])[
  + do something
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
] <alg:example>

#noindent Algorithm @alg:example is an example of a simple, completely useless algorithm.
]
```
][#algorithm(caption: "My algorithm")[
  + do something
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
] <alg:example>

#noindent Algorithm @alg:example is an example of a simple, completely useless algorithm.
]