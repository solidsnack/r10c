# A Variation of the Renard Series

The Renard Series is a system of preferred numbers which divides an interval
from 1 to 10 into an approximately geometric sequence. We propose a variation
of the Renard 10 Series (R10 Series), altering the 6th and 9th element:

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
  - In consqeuence, we call this the R10f series, because it has fewer factors.
- Most elements are exactly twice the element 3 steps before them.
  - The exception is the second element, 1.25 (or 12.5, &c) -- the element 3
    steps before it is 0.64 (or 6.4, &c.).
  - In the standardized R10 Series, not only the 2nd element, but also
    the 6th element, are exceptions.
- Just like the standardized R10 Series, the ratio of an element and the
  element two steps after it approximates the golden ratio.
  - Every element is either 1.6000 or 1.5625 (which is 1.25²) times the element
    two steps before it.

This variation leads to a variation of the standardized Renard 5 Series
(R5 Series):

- 1.00 (R5: 1st element)
- 1.60 (R5: 2nd element)
- 2.50 (R5: 3rd element)
- 4.00 (R5: 4th element)
- 6.40 (R5: 5th element, the standardized R5 Series has 6.30 here)
- 10.0
- ...and so on...

What we might call the "R3 Series", is also called the 1-2-5 Series, where each
step is a very coarse approximation of the cube root of 10:

- 1.00 (R3: 1st element)
- 2.00 (R3: 2nd element)
- 5.00 (R3: 3rd element)
- 10.0
- ...and so on...

## Miscellaneous Series

Perhaps a useful intermediate between R3 and R5 is the following selection of
numbers for an "R4 Series":

- 1.00 (1st element)
- 1.60 (2nd element)
- 3.20 (3rd element)
- 5.00 (4th element)
- 10.0
- ...and so on...

## Table of Ratios

The file `r10f.tsv` contains a table of ratios in a machine readable format,
starting with the elements in the decade `1..10`.

- The first column is the R10f element.
- The second column is its ratio to the element one step before it. For
  example, 1 is 1.25× the element one step before it (0.8) and 1.6 is 1.28×
  the element one step before it (1.25). These ratios are always either 1.25 or
  1.28.
- The third column is its ratio to the element two steps before it. For
  example, 1 is 1.5625× the element two steps before it (0.64) and 2.0 is
  1.6× the element two steps before it (1.25). These ratios approximate the
  golden section.
- The fourth column is its ratio to the element three steps before it. For
  example, 1 is 2× the element three steps before it (0.5) and 1.25 is
  1.953125× the element three steps before (0.64). This column is 2 except for
  the 2nd element in every decade -- 1.25, 12.5, and so on.
- The fifth column is its ratio to the element four steps before it...
- The sixth column is its ratio to the element five steps before it...
- ...and so on.
- The eleventh column is always 10. After eleven steps, we reach the next
  decade.

```
1.00  1.25  1.5625  2         2.5   3.125  4        5     6.25  8       10
1.25  1.25  1.5625  1.953125  2.5   3.125  3.90625  5     6.25  7.8125  10
1.60  1.28  1.6     2         2.5   3.2    4        5     6.4   8       10
2.00  1.25  1.6     2         2.5   3.125  4        5     6.25  8       10
2.50  1.25  1.5625  2         2.5   3.125  3.90625  5     6.25  7.8125  10
3.20  1.28  1.6     2         2.56  3.2    4        5     6.4   8       10
4.00  1.25  1.6     2         2.5   3.2    4        5     6.25  8       10
5.00  1.25  1.5625  2         2.5   3.125  4        5     6.25  7.8125  10
6.40  1.28  1.6     2         2.56  3.2    4        5.12  6.4   8       10
8.00  1.25  1.6     2         2.5   3.2    4        5     6.4   8       10
```
