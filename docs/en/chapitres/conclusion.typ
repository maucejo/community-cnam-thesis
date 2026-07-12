#import "@preview/cnam-thesis:0.1.0": *

#show: chapter-nonum

= Conclusion

This user guide for the `cnam-thesis` Typst template was written to help students and researchers prepare theses that comply with Cnam requirements. It provides practical instructions for configuration, structure, bibliography management, and advanced features such as annotations.

== Feature summary

#set table(stroke: none)
#table(
  columns: (auto, 1fr, auto),
  align: left + horizon,
  table.hline(),
  [Feature], [Syntax], [Chapter],
  table.hline(),
  [Template import], [`#import "@preview/cnam-thesis:0.1.0": *`], table.cell(rowspan: 2)[Chapter @ch:usage-general],
  [Template initialization], [`#show: cnam-thesis.with(...)`],
  table.hline(),
  [Heading hierarchy], [`= Chapter`, `== Section`, `=== Subsection`], table.cell(rowspan: 7)[Chapter @ch:structure],
  [Unnumbered chapters], [`#show: chapter-nonum`],
  [Unnumbered sections], [`== Section <nonum-sec>`],
  [Cross-references], [`<my-label>` + `@my-label`],
  [Layout environments], [`front-matter`, `main-matter`, `appendix`],
  [Parts], [`#part[Part title]`],
  [Back cover], [`backcover(...)`],
  table.hline(),
  [Insert image], [`image("path/to/image.png")`], table.cell(rowspan: 4)[Chapter @ch:figures],
  [Insert table], [`table(...)`],
  [Numbered figures/tables], [`figure(...)`],
  [Subfigures], [`subfigure(...)`],
  table.hline(),
  [Inline equations], [`$E=mc^2$`], table.cell(rowspan: 3)[Chapter @ch:equations],
  [Numbered equations], [`$ E=mc^2 $`],
  [Unnumbered equations], [`$ E=mc^2 $ <nonum-eq>`],
  table.hline(),
  [Info box], [`#info-box[...]`], table.cell(rowspan: 7)[Chapter @ch:boxes],
  [Tip box], [`#tip-box[...]`],
  [Warning box], [`#warning-box[...]`],
  [Important box], [`#important-box[...]`],
  [Proof box], [`#proof-box[...]`],
  [Question box], [`#question-box[...]`],
  [Code box], [`#code-box[...]`],
  table.hline(),
)

#pagebreak()
#table(
  columns: (auto, 1fr, auto),
  align: left + horizon,
  table.hline(),
  [Feature], [Syntax], [Chapter],
  table.hline(),
  [Insert bibliography], [`#bibliography("path/to/biblio.bib")`], table.cell(rowspan: 3)[Chapter @ch:ref],
  [Citation in text], [`@key`],
  [Multiple references], [`@key1 @key2`],
  table.hline(),
  [Enable comments], [`#show: activate-comment`], table.cell(rowspan: 3)[Chapter @ch:review],
  [Comment], [`#comment(...)[Comment text]`],
  [Highlighted comment], [`#highlight-comment(...)[text][comment]`],
  table.hline(),
)
