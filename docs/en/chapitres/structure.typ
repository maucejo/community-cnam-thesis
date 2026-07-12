#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *

= Document Formatting <ch:structure>

This chapter presents the basic elements for formatting a Typst document. We will particularly discuss title hierarchy, referencing elements, and various content formatting elements.

#minitoc

#pagebreak()

== Title Hierarchy <s:structure-titles>

The `cnam-thesis` template supports different levels of titles.

#code-box[
```typst
= Chapter title (level 1)

== Section title (level 2)

=== Subsection title (level 3)

==== Subsubsection title (level 4)
```
]

#warning-box[A four-level numbered outline is generally the maximum acceptable in a thesis. If you need a deeper outline, it is recommended to review the structure of your manuscript.]

=== Numbered and Unnumbered Chapters

By default, chapters are numbered. If you want to create unnumbered chapters (abstract, acknowledgments, introduction, etc.), you can use the following command at the beginning of the corresponding file. For example, for the introduction chapter:

#code-box[```typst
#import "@preview/cnam-thesis:0.1.0": *

#show: chapter-nonum

= Chapter title
```]

=== Numbered and Unnumbered Sections

By default, all titles at levels 1 to 4 are numbered. To insert unnumbered sections or subsections, you must attach the #mtype("label") #text(fill: cnam-colors.primary,`<nonum-sec>`) at the end of the section or subsection title in question. For example:
#code-box[
```typst
== Unnumbered section title <nonum-sec>
=== Unnumbered subsection title <nonum-sec>
```
]

== Cross-References

To create cross-references to sections, figures, tables, equations, etc., you must first define a label for the element you want to reference. This is done by adding the #mtype("label") #text(fill: cnam-colors.primary,`<my-label>`) at the end of the element in question:

#pagebreak()
#code-box[
```typst
= Chapter title <ch:chapter>

== Section title <s:section>
```
]

To cite referenced elements, use the command #text(fill: cnam-colors.primary,`@my-label`).

#v(1em)
#example-box(numbering: false, vspace: -0.5em)[
```typst
For more details, see chapter @ch:structure and section @s:structure-titles.
```
][
For more details, see chapter @ch:structure and section @s:structure-titles.
]

== Text Formatting

This section presents various text formatting elements.

=== Emphasis and Code

#example-box(lang: [typst], numbering: false, vspace: -0.5em)[
```
*bold*, _italic_, _*bold and italic*_, `inline code`, #strike[strikethrough], #super[superscript], #sub[subscript]
```
][*bold*, _italic_, _*bold and italic*_, `inline code`, #strike[strikethrough], #super[superscript], #sub[subscript]]

=== Hyperlinks

To create hyperlinks, you must use the #cmd("link") command in Typst (see #link("https://typst.app/docs/commands/link", "Typst Documentation") for more details).

#v(1em)
#example-box(numbering: false)[
  ```typst
    #link("https://www.cnam.fr", "The Cnam website")

    https://www.cnam.fr

    #link("mailto:contact@cnam.fr")
    ```
][
#noindent#link("https://www.cnam.fr", "The Cnam website")

#noindent https://www.cnam.fr

#noindent#link("mailto:contact@cnam.fr")
]

=== Lists

There are several types of lists in Typst: bulleted lists, numbered lists, and task lists.

#v(1em)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [
  #set align(horizon)
  #zebraw(lang-color:teal, numbering: false,
```typst
- First item
- Second item
  - Subitem 1 (1 tab)

+ First item
+ Second item
  + First item

#sym.dots.v
5. Fifth item
+ Sixth item

- [x] Task 1
- [ ] Task 2
```)],
[#render-box[
  - First item
  - Second item
    - Subitem 1 (1 tab)

  + First item
  + Second item
    + First item

  #sym.dots.v
  5. Fifth item
  + Sixth item

  - [x] Task 1
  - [ ] Task 2
]]
)

#warning-box[Task lists are suitable for "guide" or "manual" type documents, but are not suitable for a thesis manuscript. It is recommended to use bulleted or numbered lists for thesis writing. This is more neutral and conforms to academic standards.]

=== Quotes

Quotes are used to reference works or ideas developed by other authors.

#v(1em)
#example-box(numbering: false, vspace: -1.25em)[
```typst
#quote(attribution: "Plato", block: true)[Within each of us there are calculations that we call hope.]
```
][
  #quote(attribution: "Plato", block: true)[Within each of us there are calculations that we call hope.]
]


=== Footnotes

#v(1em)
#example-box(numbering: false, vspace: -1.25em)[
```typst
#quote(attribution: "Plato", block: true)[Within each of us there are calculations that we call hope.]
```
][
  The Cnam was founded on October 10, 1794#footnote[October 19 of the year III of the Revolution.].
]

=== Page Breaks

To insert a page break, you must use the #cmd("pagebreak") command in Typst (see #link("https://typst.app/docs/reference/layout/pagebreak/", "Typst Documentation") for more details).

#code-box[```typst
End of content for this section.

#pagebreak()

Beginning of content for the next section.
```]

#warning-box[It is recommended to use page breaks sparingly, so as not to disturb the reading of the document. It is better to let the layout engine manage page breaks automatically. Prefer to adjust them at the very end of writing, once the content is fixed.]

== Parts and Page Layout Environments

Parts are sections at a level higher than chapters. They allow you to group multiple chapters under the same theme. To create a part, you must use the #cmd("part") command.

#code-box[
```typst
// Creating a part
#part[Part title]
```
]

Regarding page layout environments, `cnam-thesis` relies on the `bookly` template to structure the document. It is possible to use the #cmd-("front-matter"), #cmd-("main-matter"), and #cmd-("appendix") environments to structure the document in three parts: the front matter, the main content, and the appendices.

To activate these environments, use the following commands at the desired location in the document:
#code-box[```typst
#show: front-matter

// Front matter content

#show: main-matter

// Main content

#show: appendix

// Appendices content
```]

== Back Cover

The back cover is a page that presents the abstract and the English summary of the document. It is generally used to give readers an overview of the document's content.

#code-box[
```typst
#backcover(resume: ..., abstract: ...)
```
]

The #cmd("backcover") function accepts the following arguments:

#argument("resume", default: [none], type: [#mtype("string")|#mtype("content")])[French summary of the document]

#argument("abstract", default: [none], type: [#mtype("string")|#mtype("content")])[English abstract of the document]