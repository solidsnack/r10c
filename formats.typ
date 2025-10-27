#let paged(doc, paper: "a5") = [
  #set page(
    footer-descent: 25%,
    header: context {
      let rel = query(<release>)

      if rel.len() > 0 {
        align(center)[#raw(rel.first().value)]
      }
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
  #show <attribution>: txt => block(breakable: false, width: 100%)[
    #set block(spacing: 1%)
    #context {
      align(center)[
        #block()[#document.date.display()]

        #for author in document.author [
          #block()[#author]
        ]
      ]
    }
  ]

  #doc
]

// Do nothing.
#let web(doc) = [
  // Replace empty block.
  #show <attribution>: txt => block(breakable: false, width: 100%)[
    #context [
        / Date: #document.date.display()

        #let rel = query(<release>)
        #if rel.len() > 0 [
          / Release: #raw(rel.first().value)
        ]

        #let authors = document.author
        #if authors.len() > 0 [
          / Authors: #authors.join(", ")
        ]
    ]
  ]

  #doc
]
