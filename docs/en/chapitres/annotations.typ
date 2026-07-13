#import "@preview/cnam-thesis:0.1.0": *
#import "../../guide-utils.typ": *

= Review comments <ch:review>

This section presents the different review and annotation features available in the `cnam-thesis` template. These features allow authors and reviewers to collaborate efficiently by adding comments, margin notes, and annotations directly in the document.

#minitoc

#pagebreak()
== Collaborative comments

To enable comments, simply insert the following command in the relevant file:
#code-box[
```typ
#show: activate-comment
```
]

To disable comments, simply insert the following command in the relevant file:
#code-box[
```typ
#show: deactivate-comment
```
]

Enabling comments creates a margin area on the right side of the document, where comments can be displayed.

#info-box[The `activate-comment` is a shortcut for `marginalia.setup.with(...)`, and the `deactivate-comment` command is a shortcut for `page.with(...)`. If the activation command is defined in an included file, it is not necessary to disable comments in subsequent included files.]

== Comment types <ch:review->

The `cnam-thesis` template provides different comment types, each with a specific icon to distinguish them visually:

- *`note`* #box(image("../../../src/resources/logo/note.svg", width: 1em) + v(-1pt)) : Used to add informational notes or additional explanations.

- *`comment`* #box(image("../../../src/resources/logo/comment.svg", width: 1em) + v(-2pt)) : Used to add general comments or suggestions.

- *`question`* #box(image("../../../src/resources/logo/question.svg", width: 1em) + v(-2pt)) : Used to ask questions or request clarification.

- *`todo`* #box(image("../../../src/resources/logo/todo.svg", width: 1em) + v(-2pt)) : Used to indicate tasks to complete or items to check.

#show: activate-comment

== Annotation syntax

#info-box[The comment environment has been enabled for this section.]

Annotations can be added using the #cmd("comment") command, whose arguments are as follows:

#argument("by", default: ["Reviewer"], type: [#mtype("string")|#mtype("content")])[Comment author]

#argument("type", default: ["note"], type: [#mtype("string")])[Comment type]

#argument("inline", default: [false], type: mtype("bool"))[If `true`, the comment is inserted inline. If `false`, it is inserted in the margin.]

#argument("color", default: [blue], type: [#mtype("string")|#mtype("color")])[Annotation box color]

#argument("icon", default: [true], type: mtype("bool"))[Display the comment icon for inline comments. If `true`, the comment icon is displayed in the margin. If `false`, it is not displayed.]

#argument("..args", type: mtype("dictionary"))[Additional arguments for annotation customization.

#set text(size: 0.8em)
#info-box[The #cmd("comment") command is built from the #cmd("note") command provided by the `marginalia` package for margin notes, while it uses the built-in #cmd("block") command for inline notes. Therefore, #cmd("comment") inherits the parameters of these two commands. For more information about available parameters, please refer to the #link("https://github.com/nleanba/typst-marginalia/blob/main/Marginalia.pdf", [`marginalia` package documentation.])]

#warning-box[Due to the current implementation of the #cmd("comment") command, some parameters of the #cmd("inline-note") command are not yet supported. This is notably the case for the `par-break` parameter.]
]

To add a margin comment of type `note` with a blue annotation box, use the following command:

#code-box[```typ
#comment(by: "Abbé Grégoire", color: blue)[This is a blue comment.]
```]

As you can see, the previous command does create a margin comment of type `note` with a blue annotation box.#comment(by: "Abbé Grégoire", color: blue, dy: -2em)[This is a blue comment.]. An attentive reader will notice that the inserted annotation is marked in the text by its icon, color, and number.

You can go further by creating annotation boxes associated with a specific reviewer. This makes it possible to distinguish each reviewer’s comments with a specific color. For example, let’s create two reviewers, Abbé Grégoire and Henri Tresca (who are the advisors of this fictional thesis).

#code-box[
```typ
#let ab-comment = comment.with(by: "Abbé Grégoire", color: blue)
#let ht-comment = comment.with(by: "Henri Tresca", color: cnam-color.primary)
```
]

#let ab-comment = comment.with(by: "Abbé Grégoire", color: blue)
#let ht-comment = comment.with(by: "Henri Tresca", color: cnam-colors.primary)

By doing this, you can add comments from each reviewer using the `ab-comment` and `ht-comment` commands#ht-comment(type: "comment", dy: -3.5em)[I think this is great!]#ab-comment(type: "question")[I am not sure I understand this remark, Henri?]. These notes were created with the following commands:
#code-box[
```typ
By doing this, you can add comments from each reviewer using the `ab-comment` and `ht-comment` commands#ht-comment(type: "comment", dy: -3.5em)[I think this is great!]#ab-comment(type: "question")[I am not sure I understand this remark, Henri?].
```
]

Comments inserted in the margins should generally be relatively short so as not to overload the layout. However, it is possible to add longer comments using the `inline: true` argument. This inserts the comment directly into the text, which is particularly useful for detailed explanations or longer discussions.#ab-comment(inline: true)[Since I don't have any ideas for writing a long and funny text, I will use a classic #cmd("lorem"). #lorem(20)]

It is also possible to highlight a passage of text and associate a comment with it. To do this, simply use the #cmd("highlight-comment") command, which highlights the text and adds an associated comment. The command is as follows:

#pagebreak()
#code-box[
```typ
#highlight-comment(by: "Reviewer A", type: "comment", color: green, highlight-body: [Highlighted text])[Associated comment]
```
]

#let ma-highlight-comment = highlight-comment.with(by: "Mathieu Aucejo", color: green.darken(25%))

In the next section, #ma-highlight-comment(type: "question", dy: - 3.5em)[we will present how to create the annotation list.][I wonder whether this is really necessary?]

#info-box[The #cmd("highlight-comment") command is built from the #cmd("comment") command. It inherits this command’s parameters except for the `inline` parameter.]

== Table of annotations

To make reading and navigating comments easier, the `cnam-thesis` template also provides an annotation table. This table lists all comments added to the document, with their number, author, and type. To insert it in the document, simply use the #cmd-("listofnotes") command at the desired location.

#code-box[
```typ
#listofnotes
```
]