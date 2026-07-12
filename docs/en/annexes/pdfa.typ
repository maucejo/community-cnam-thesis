#import "@preview/cnam-thesis:0.1.0": *

= PDF/A-1b validation

This annex provides instructions for validating that the generated PDF document complies with the PDF/A-1b standard.

#minitoc

#pagebreak()

== Submission on theses.fr

The #link("https://www.theses.fr/", "theses.fr") platform allows you to submit theses and research dissertations. For the document to be accepted, it must comply with the PDF/A-1b standard (ISO 19005-1).

== CINES validation

The online service #link("https://facile.cines.fr/", "facile.cines.fr") is provided by CINES (Centre Informatique National de l'Enseignement Supérieur) to validate PDF document compliance with the PDF/A-1b standard. It is recommended to use this service to check that your document meets formatting requirements before submitting it to theses.fr.

== Typst compilation to PDF/A-1b

Typst supports several PDF output standards, including PDF/A-1b. To generate a document compliant with this standard, several options are available:

+ Command line

#code-box[
```bash
typst compile main.typ thesis.pdf --pdf-standard a-1b
```
]

2. If you use the Typst web app, you can select the PDF/A-1b format in the export options before downloading the document (see Figure @fig:pdfa-webapp).

#figure(
  image("../../images/pdfa-webapp.png", width: 50%),
  caption: [Selecting the PDF/A-1b format in the Typst web app]
) <fig:pdfa-webapp>

3. If you use the Tinymist extension for Visual Studio Code, you can configure the PDF/A-1b format in the Typst extension settings. To do this, select the extension $->$ Export Tool. Then choose the PDF/A-1b format in the "PDF Validator" dropdown list (see Figure @fig:pdfa-vscode).

#figure(
  image("../../images/pdfa-vscode.png", width: 50%),
  caption: [Selecting the PDF/A-1b format in the Tinymist extension for Visual Studio Code]
) <fig:pdfa-vscode>

#warning-box[The PDF/A-1b format is a strict standard that imposes certain constraints on the document's content and structure. For example, this standard does not accept images with transparency. Make sure to check your document after compilation to ensure it complies with this standard.]