#import "@preview/cnam-thesis:0.1.0": *
#import "@preview/mantys:1.0.2": *
#import "@preview/dtree:0.1.1": dtree
#import "../../guide-utils.typ": *

= General Usage <ch:usage-general>

This chapter presents the general instructions for using the `cnam-thesis` template. It is recommended to follow these instructions before starting to write your manuscript.

#minitoc

#pagebreak()

== General information

The `cnam-thesis` template is based on `bookly`, a Typst package developed by the author of this document. It provides a consistent document structure, predefined layout styles, and features specific to academic documents.

This template customizes the `bookly` template to meet the specific requirements of theses from the Conservatoire national des arts et métiers (Cnam). It also includes additional features that are described in the following chapters.

=== Fonts

To use the `cnam-thesis` template, you must install the following fonts on your system:

- Text: `TeXGyrePagellaX` (#link("https://www.ctan.org/tex-archive/fonts/newpx/", "download link")), `Libertinus Serif` (#link("https://ctan.org/pkg/libertinus-fonts?lang=en", "download link")) and `New Computer Modern` (included with Typst).

- Mathematics: `TeX Gyre Pagella Math` (#link("https://ctan.org/tex-archive/fonts/tex-gyre-math", "download link")), `Libertinus Math` (#link("https://ctan.org/pkg/libertinus-fonts?lang=en", "download link")) and `New Computer Modern Math` (included with Typst).

- Code: `Cascadia Code` (#link("https://fonts.google.com/specimen/Cascadia+Code", "download link")), `Hack` (#link("https://github.com/source-foundry/Hack/tree/master/build/ttf", "download link")) and `DejaVu Sans Mono` (included with Typst).

=== Theme colors

The `cnam-thesis` template defines two main colors to ensure visual consistency throughout the document:

- Primary color: #box(width: 1em, height: 1em, fill: cnam-colors.primary)
- Secondary color: #box(width: 1em, height: 1em, fill: cnam-colors.secondary)

#info-box[Colors are defined in the #mtype("dictionary") `cnam-colors`. You can access them using the standard Typst syntax: `cnam-colors.primary` and `cnam-colors.secondary`.]

== Template initialization

To use the template, you must import it into your main `typ` file. Assuming the template and the main file are in the same folder, simply insert the following command on the first line of the main file.

#code-box[```typ
#import "@preview/cnam-thesis:0.1.0": *
```]

#info-box[If you split your document into multiple files, you must insert the previous command in the preamble of each file.]

After importing the template, it must be initialized by applying a display rule (`show` rule) with the #cmd("cnam-thesis") command and passing the required options with the `with` instruction in your main `typ` file:

#code-box[```typ
#show: cnam-thesis.with(
    title: "thesis title",
    author: "Author name",
    lang: "fr",
    open-right: true,
    thesis-info: thesis-info-default,
)
```
]

This initialization function contains a number of arguments detailed below. You can modify these arguments according to your needs.

#argument("title", default: ["Thesis title"], type: [#mtype("string")|#mtype("content")])[Thesis title]
#argument("author", default: ["Author name"], type: [#mtype("string")|#mtype("content")])[Thesis author]

#argument("lang", default: ["fr"], type: mtype("string"))[
  Document language.

  #text(size: 0.85em, info-box[All languages supported by `bookly` are also supported by the `cnam-thesis` template.])
]
#argument("open-right", default: [true], type: mtype("bool"))[
  If `true`, chapters start on a right-hand page. If `false`, chapters start on the next page.
]

#argument("thesis-info", default: [thesis-info-default], type: mtype("dictionary"))[
  Dictionary containing thesis-related information.

  - `doctoral-school` #mtype("string")|#mtype("content") : Affiliated doctoral school

  - `supervisor` #mtype("array") : Definition of the thesis supervisor(s). Each entry is defined by a #mtype("dictionary") containing the following keys:
    - `name` #mtype("string")|#mtype("content") : Supervisor name
    - `title` #mtype("string")|#mtype("content") : Supervisor title/status (MCF HDR, PU, PRCM, #sym.dots)
    - `institution` #mtype("string")|#mtype("content") : Affiliated institution/company of the supervisor,

  - `co-supervisor` #mtype("array") : Definition of the thesis co-supervisor(s). Each entry is defined by a #mtype("dictionary") containing the following keys:
    - `name` #mtype("string")|#mtype("content") : Co-supervisor name
    - `title` #mtype("string")|#mtype("content") : Co-supervisor title/status (MCF, MCF HDR, PU, PRCM, #sym.dots)

    - `institution` #mtype("string")|#mtype("content") : Affiliated institution/company of the co-supervisor,

  - `laboratory` #mtype("string")|#mtype("content") : Name of the affiliated laboratory

  - `defense-date` #mtype("string")|#mtype("content") : Thesis defense date

  - `discipline` #mtype("string")|#mtype("content") : Thesis discipline

  - `speciality` #mtype("string")|#mtype("content") : Thesis specialty

  - `committee` #mtype("array") : Members of the defense committee. Each entry is defined by a #mtype("dictionary") containing the following keys:
    - `name` #mtype("string")|#mtype("content") : Committee member name
    - `position` #mtype("string")|#mtype("content") : Committee member position
    - `role` #mtype("string")|#mtype("content") : Committee member role (President, Reviewer, Examiner, etc.)

  - `dedication` #mtype("string")|#mtype("content") : Thesis dedication

  - `logo` #mtype("array") : Path to the institution logo


#set smartquote(enabled: false)
#noindent *Default values*
- `doctoral-school`: #text(fill: colors.default-param)["Sciences des Métiers de l'Ingénieur"],
- supervisor: #text(fill: colors.default-param)[`(:)`],
- co-supervisor: #text(fill: colors.default-param)[`(:)`],
- laboratory: #text(fill: colors.default-param)[`none`],
- defense-date: #text(fill: colors.default-param)[`none`],
- discipline: #text(fill: colors.default-param)["Sciences de l'ingénieur"],
- speciality: #text(fill: colors.default-param)["Mécanique"],
- committee: #text(fill: colors.default-param)[`(:)`],
- dedication: #text(fill: colors.default-param)[`none`],
- logo: #text(fill: colors.default-param)[`none`]
]

To define the `supervisor`, `co-supervisor`, and `committee` dictionaries, several approaches are possible:

+ Direct definition in Typst.
#code-box[
```typ
// main.typ
#let supervisor = (
  (name: "Henri Grégoire", title: "Abbé constitutionnelle", institution: "Cnam, Paris"),
  (name: "Henri Tresca", title: "Professeur titulaire de la Chaire de Mécanique", institution: "Cnam, Paris"),
)

#show: cnam-thesis.with(
    thesis-info: (
        supervisor: supervisor,
    ),
)
```
]

2. Definition in a `json` file.
#code-box[
```json
// thesis-info.json
{
  "supervisor": [
    {
      "name": "Henri Grégoire",
      "title": "Abbé constitutionnelle",
      "institution": "Cnam, Paris"
    },
    {
      "name": "Henri Tresca",
      "title": "Professeur titulaire de la Chaire de Mécanique",
      "institution": "Cnam, Paris"
    }
  ]
}
```

#v(1em)
```typ
// main.typ
#show: cnam-thesis.with(
    thesis-info: json("/path/to/thesis-info.json"),
)
```
]

3. Definition in a separate `yaml` file.
#code-box[
```yaml
# thesis-info.yaml
supervisor:
  - name: "Henri Grégoire"
    title: "Abbé constitutionnelle"
    institution: "Cnam, Paris"
  - name: "Henri Tresca"
    title: "Professeur titulaire de la Chaire de Mécanique"
    institution: "Cnam, Paris"
```

#v(1em)
```typ
// main.typ
#show: cnam-thesis.with(
    thesis-info: yaml("/path/to/thesis-info.yaml"),
)
```
]

== File tree

When writing a long document, such as a thesis manuscript, it is preferable to adopt a multi-file organization to avoid having one veeeeeery long main file. This is especially important during proofreading/correction, as well as in a collaborative writing context. I generally use the following structure:

#dtree(
  stroke: 0.75pt + cnam-colors.primary,
  icons: ("typ": typst),
  icon-rules: (
    ("main.typ", (icon: "typ", fill: cnam-colors.primary)),
    ("*.typ", (icon: "typ")),
   ),
```
main.typ
 appendices/
  app1.typ
 bibliography/
  biblio.bib
 chapters/
  chapter1.typ
 images/
  logo.png
 preamble/
  summary.typ
```)

== Structure of the main file

Based on the structure defined in the previous section, the main `main.typ` file could look like this#footnote[The code below is the main file used to write this document.]:
#code-box[
```typ
// main.typ
#import "@preview/cnam-thesis:0.1.0": *

#let supervisor = ...
#let co-supervisor = ...
#let committee = ...

#show: cnam-thesis.with(
    title: [User guide for the Typst thesis template for Cnam theses],
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
        dedication: [Software and cathedrals are almost the same thing: first we build them, then we pray. \ Sam Redwine],
    ),
    lang: "en",
    open-right: true
)

#show: front-matter

#include "preamble/summary.typ"

#show: main-matter

#tableofcontents
#listoffigures
#listoftables

#part[User guide]

#include "chapters/chapter-main.typ"

#bibliography("bibliography/biblio.bib")

#show: appendix

#part[Appendices]
#include "appendices/appendix-main.typ"

#backcover(resume: ..., abstract: ...)
```
]

The main file presents the general structure of the document. You can note that the document contains:
- Front matter #cmd-("front-matter"), main matter #cmd-("main-matter"), and appendix #cmd-("appendix") environments.

- A table of contents #cmd-("tableofcontents"), a list of figures #cmd-("listoffigures"), and a list of tables #cmd-("listoftables").

- Parts #cmd-("part").

- Chapters and appendices imported from other files using the #cmd-("include") command.

- A bibliography inserted with the #cmd("bibliography") command.

- A back cover #cmd-("backcover") containing the summary and abstract of the document.

#v(1em)
#noindent All these elements are detailed in the following chapters.
