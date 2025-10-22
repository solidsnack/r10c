#!/usr/bin/env -S just --justfile

set shell := ['bash', '-o', 'errexit', '-o', 'nounset', '-o', 'pipefail', '-c']

# Build the website.
[default]
dist: (web) (render)
    @mkdir -p tmp/dist
    cp tmp/index.html tmp/dist/
    cp tmp/main.pdf tmp/dist/

# Remove all build products.
clean:
    rm -rf tmp/
    mkdir -p tmp/

# Render the main webpage.
web: (typst "content.typ" "tmp/index.html" "--features" "html")

# Render a Typst document as a PDF, placing it in the temporary folder.
render doc="main.typ": (typst doc "tmp/" + without_extension(doc) + ".pdf"
                              "--features" "html")
# NB: Passed `html` here so that `target()` is available in the context object.

# Run Typst.
typst input output *args:
    mkdir -p {{parent_directory(output)}}
    typst compile --root ./ {{args}} {{input}} {{output}}

# Build and view a Typst document as a PDF.
view doc="main.typ": (render doc)
    open tmp/{{without_extension(doc)}}.pdf

# Notional release identifier.
rel:
    @git log -n1 --date=format:%Y%m%d --format="%ad-%h"

# Display tabular data with `xsv`.
display data="r10f-ratios.tsv":
    @xsv table {{data}}
