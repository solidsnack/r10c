#set document(
  title: [A Variation of the Renard Series],
  author: "Jason Dusek",
  date: datetime(year: 2025, month: 10, day: 14),
)

#set par(justify: true)
#set text(
  // These are default fonts embedded in the `typst` program.
  font: ("New Computer Modern",
         "New Computer Modern Math",
         "DejaVu Sans Mono"),
  fallback: false,
  hyphenate: false,
  number-width: "tabular",
  size: 2.5mm,
  // slashed-zero: true,
)

= #context document.title

The Renard Series is a system of preferred numbers which divides an interval
from 1 to 10 into an approximately geometric sequence. We propose a variation
of the Renard 10 Series (R10 Series), called the R10f Series, by altering the
6th and 9th elements of the standardize series:

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
  - In consqeuence, we call this the R10#strong[f] series, because it has
    #strong[f]ewer factors.
- Most elements are exactly twice the element 3 steps before them.
  - The exception is the second element, 1.25 (or 12.5, &c) -- the element 3
    steps before it is 0.64 (or 6.4, &c.).
  - In the standardized R10 Series, not only the 2nd element, but also
    the 6th element, are exceptions.
- Just like the standardized R10 Series, the ratio of an element and the
  element two steps after it approximates the golden ratio.
  - Every element is either 1.6000 or 1.5625 (which is 1.25²) times the element
    two steps before it.

== R5, R4, R3

Using this variation as a base, we get a different Renard 5 Series,
the R5f Series:

- 1.00 (R5: 1st element)
- 1.60 (R5: 2nd element)
- 2.50 (R5: 3rd element)
- 4.00 (R5: 4th element)
- 6.40 (R5: 5th element, the standardized R5 Series has 6.30 here)
- 10.0
- ...and so on...

What we might call the "R3f Series" is also called the 1-2-5 Series, where
each step is a very coarse approximation of the cube root of 10:

- 1.00 (R3: 1st element)
- 2.00 (R3: 2nd element)
- 5.00 (R3: 3rd element)
- 10.0
- ...and so on...

Perhaps a useful intermediate between R3f and R5f is the following selection of
numbers for an R4f Series:

- 1.00 (1st element)
- 1.60 (2nd element)
- 3.20 (3rd element)
- 5.00 (4th element)
- 10.0
- ...and so on...

#pagebreak(weak: true)
== A Notation for Elements

The R10f Series can be viewed as all numbers we get by taking the base series
of ten numbers 1.00, 1.25, ..., 8.00, given above, and multiplying them by
powers of ten.

// Then 1.00 is $10^0$ times the element with index 0 in the base
// R10f series, 1.25 is $10^0$ times the element with index 1 in the base R10f
// series, and so on.

// It is consonant with traditional math notation to use a notation like
// $"R10f"(0)_0$ for this. Then 1.25 would be $"R10f"(0)_1$, 1.60 would be
// $"R10f"(0)_2$, 12.5 would be $"R10f"(1)_2$, and so on and so forth. However,
// a URN-like notation is more broadly useful, because it is difficult to type
// a notation with subscripts like that.

#table(
  columns: 4,
  table.header([], [in R10f], [in R5f], [in R3f]),
  [...], [...], [...], [...],
  [0.50], [`r10f:-1:7`], [], [`r3f:-1:2`],
  [0.64], [`r10f:-1:8`], [`r5f:-1:4`], [],
  [0.80], [`r10f:-1:9`], [], [],
  [1.00], [`r10f:0:0`], [`r5f:0:0`], [`r3f:0:0`],
  [1.25], [`r10f:0:1`], [], [],
  [1.60], [`r10f:0:2`], [`r5f:0:1`], [],
  [2.00], [`r10f:0:3`], [], [`r3f:0:1`],
  [2.50], [`r10f:0:4`], [`r5f:0:2`], [],
  [3.20], [`r10f:0:5`], [], [],
  [4.00], [`r10f:0:6`], [`r5f:0:3`], [],
  [5.00], [`r10f:0:7`], [], [`r3f:0:2`],
  [6.40], [`r10f:0:8`], [`r5f:0:4`], [],
  [8.00], [`r10f:0:9`], [], [],
  [10.0], [`r10f:1:0`], [`r5f:1:0`], [`r3f:1:0`],
  [12.5], [`r10f:1:1`], [], [],
  [16.0], [`r10f:1:2`], [`r5f:1:1`], [],
  [...], [...], [...], [...],
)