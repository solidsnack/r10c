#let paged(info, doc, paper: "a5") = [
  #set page(
    footer: context {
      let rel = query(<release>)

      if rel.len() > 0 {
        align(center)[#raw(rel.first().value)]
      }
      align(center)[#counter(page).display(both: true)]
    },
    footer-descent: 40%,
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

  #show title: txt => text(size: 4mm, weight: "bold")[#smallcaps(txt)]
  #show title: set align(center)

  #title()

  #block(breakable: false, width: 100%)[
    #set block(spacing: 1%)
    #context {
      align(center)[
        #block()[#document.date.display()]

        #for author in document.author [
          #block()[#author]
        ]

        #block()[#link("http://" + info.domain)[#raw(info.domain)]]
      ]
    }
  ]

  #doc
]

#let web(info, doc) = [
  #html.link(href: "css/normalize.css", rel: "stylesheet")
  #html.link(href: "css/style.css", rel: "stylesheet")

  #title()

  #block(breakable: false, width: 100%)[
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

        #let pdf = info.label + ".pdf"

        / Printable: #html.a(href: "./" + pdf)[#raw(pdf)]
        / Sources: #html.a(href: info.sources)[#raw(info.sources)]
    ]
  ]

  #outline()

  #doc
]
