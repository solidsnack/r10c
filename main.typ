#set heading(numbering: "1.a.1.a -")
#set par(justify: true)
#set text(
  hyphenate: false,
  number-width: "tabular",
)

#block(breakable: false)[
= Introduction

The Renard Series is a system of preferred numbers, standardized in ISO 3.
The Renard 10 Series (R10 Series, for short) divides an interval from 1 to 10
into an approximately geometric sequence.

While we can precede geometrically in 10 steps from 1 to 10 by
multiplying by the 10th root of 10 -- about 1.2589 -- at each step, the numbers
thus arrived at would be quite unwieldy. With very slight
rounding, the numbers become quite congenial to work with -- friendly numbers
like 2, 2.5, 4, 5 and so on. This does mean, however, that each step is not
just the previous one multiplied by the 10th root of ten. In the standardized
R10 Series, the steps are sometimes 1.23×, sometimes 1.25×, sometimes 1.28× and
sometimes other factors.

We here discuss a variation of the R10 Series, dubbing it
the #strong[R10c] Series (#strong[R]enard #strong[10] Series with more
#strong[c]onsistent ratios). By changing the 6th and 9th elements of the
series, we simplify the overall structure of the series -- there are only two
factors between adjacent elements in R10s, namely 1.25× and 1.28×. We also get
more elements that are exactly twice some prior element. Here is the
R10c Series:

- 1.00 (1st element)
- 1.25 (2nd element)
- 1.60 (3rd element)
- 2.00 (4th element)
- 2.50 (5th element)
- 3.20 (6th element, the standardized R10 Series has 3.15 here)
- 4.00 (7th element)
- 5.00 (8th element)
- 6.40 (9th element, the standardized R10 Series has 6.30 here)
- 8.00 (10th element)
- 10.0 (1st element in next decade)
- 12.5 (2nd element in next decade)
- 16.0 (3rd element in next decade)
- and so on...

By changing the 6th and 9th entries, we ensure that:

- Every element is either 1.25 or 1.28 times the previous element. The standard
  series has ratios of 1.23, 1.25, 1.28 and ≈1.30 between adjacent elements.
- Most elements are exactly twice the element 3 steps before them.
  - The exception is the second element, 1.25 (or 12.5, &c) -- the element 3
    steps before it is 0.64 (or 6.4, &c.).
  - In the standardized R10 Series, not only the 2nd element, but also
    the 6th element, are exceptions.
- Just like the standardized R10 Series, the ratio of an element and the
  element two steps after it approximates the golden ratio.
  - Every element is either 1.6000 or 1.5625 times the element
    two steps before it.
]

#block(breakable: false)[
  = Ratio Table

  A table of elements of the series and their ratios to elements one step prior
  (1°), two steps prior (2°), and so on. For example, the ratio of 4 to
  3.2 is 1.25 (1° column); the ratio of 4 to 2.5 is 1.6 (2° column);
  and so on.

  #let ratios = {
    let data = csv("r10c-ratios.tsv", delimiter: "\t")

    table(
      columns: (8%, 8%, 8%, 8%, 8%, 8%, 8%, 8%, 8%, 8%, 8%),
      stroke: none,
      fill: (_, row) => if calc.odd(row) { luma(240) } else { white },
      align: (col, _) => if col == 0 { center } else { left },
      table.header([], [1°], [2°], [3°], [4°], [5°],
                       [6°], [7°], [8°], [9°], [10°]),
      ..data.flatten(),
    )
  }

  #figure(ratios)
]

#block(breakable: false)[
  = R5, R4, R3

  Using this variation as a base, we get a different Renard 5 Series,
  the R5c Series:

  - 1.00 (1st element)
  - 1.60 (2nd element)
  - 2.50 (3rd element)
  - 4.00 (4th element)
  - 6.40 (5th element, the standardized R5 Series has 6.30 here)
  - 10.0
  - ...and so on...

  What we might call the R3 Series, also called the 1-2-5 Series, where
  each step is a very coarse approximation of the cube root of 10, is the same
  as the R3c Series:

  - 1.00 (1st element)
  - 2.00 (2nd element)
  - 5.00 (3rd element)
  - 10.0
  - ...and so on...

  Perhaps a useful intermediate between R3c and R5c is the following selection
  of numbers for an R4c Series:

  - 1.00 (1st element)
  - 1.60 (2nd element)
  - 3.20 (3rd element)
  - 5.00 (4th element)
  - 10.0
  - ...and so on...
]

#block(breakable: false)[
  = A Notation for Elements

  The R10c Series can be viewed as all numbers we get by taking the base series
  of ten numbers 1.00, 1.25, ..., 8.00, given above, and multiplying them by
  powers of ten.

  Then 1.00 is 10⁰ times the element with index 0 in the base
  R10c series, 1.25 is 10⁰ times the element with index 1 in the base R10c
  series, 12.5 is 10¹ times the element with index 1 in the base R10c series,
  and so on.

  It is consonant with traditional math notation to use a notation like
  R10c(0)₀ for this. Then 1.25 would be R10c(0)₁, 1.60 would be
  R10c(0)₂, 12.5 would be R10c(1)₁, and so on and so forth. However,
  a URN-like notation is more broadly useful because it does not require use of
  subscript characters.

  #let urns = {
    let data = csv("r?c-urn.tsv", delimiter: "\t")

    table(
      columns: (16%, 16%, 16%, 16%, 16%),
      stroke: none,
      fill: (_, row) => if calc.odd(row) { luma(240) } else { white },
      align: (col, _) => if col == 0 { center } else { right },
      table.header([], [in R10c], [in R5c], [in R4c], [in R3c]),
      [...], [...], [...], [...], [...],
      ..data.map(it => {
        it.enumerate().map(((i, txt)) => if i < 1 { txt } else { raw(txt) })
      }).flatten(),
      [...], [...], [...], [...], [...],
    )
  }

  #figure(urns)
]
