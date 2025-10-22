#set page(
  paper: "a5",
  margin: (
    x: 10mm, // 148mm - (10mm + 10mm) = 128mm
    y: 25mm, // 210mm - (25mm + 25mm) = 160mm
  ),
  numbering: "1 / 1",
)
#set text(
  font: ("New Computer Modern",
         "New Computer Modern Math",
         "DejaVu Sans Mono"),
  fallback: false,
  hyphenate: false,
  number-width: "tabular",
  size: 2.5mm,
)

#show heading: smallcaps
#show heading: set align(right)

#include "content.typ"