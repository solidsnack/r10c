#let paged(doc, paper: "a5") = [
  #set page(
    footer: context {
      let page-num = counter(page).display(both: true)
      let meta = query(<release>)

      let content = if meta.len() > 0 {
        [#page-num \
         #meta.first().value]
      } else {
        page-num
      }

      align(center)[#content]
    },
    footer-descent: 25%,
    header: context {
      let title = document.title
      align(right, document.title)
    },
    header-ascent: 25%,
    margin: (
      x: 10mm, // 148mm - (10mm + 10mm) = 128mm
      y: 25mm, // 210mm - (25mm + 25mm) = 160mm
    ),
    numbering: "1 / 1",
    paper: paper,
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

  #show title: txt => text(size: 4mm, weight: "bold")[#smallcaps(txt)]
  #show title: set align(center)

  // Replace empty block.
  #show <attribution>: txt => block(breakable: false)[
    #context { document.date } \
    #context { document.author }
  ]

  #doc
]

// Do nothing.
#let html(doc) = [ #doc ]
