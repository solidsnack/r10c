#!/usr/bin/env -S just --justfile

set shell := ['bash', '-o', 'errexit', '-o', 'nounset', '-o', 'pipefail', '-c']

# # Build the website.
# [default]
# dist: (web) (render)
#     @mkdir -p tmp/dist
#     cp tmp/index.html tmp/dist/
#     cp tmp/main.pdf tmp/dist/

# Render the main webpage.
web: (typst "main.typ" "tmp/index.html" "--features" "html")

# Run Typst.
typst input output *args:
    mkdir -p {{parent_directory(output)}}
    typst compile --root ./ {{args}} {{input}} {{output}}

# Prepare metadata -- release information, date, author and so on.
metadata:
    #!/bin/bash
    set -o errexit -o nounset -o pipefail

    export TZ=UTC

    mkdir -p tmp/build/
    cat > tmp/build/metadata.typ <<EOF
    #set document(
      author: "$(git log -n1 --format=%an)",
      date: datetime(
        year: $(git log -n1 --date=format:%Y --format=%ad),
        month: $(git log -n1 --date=format:%m --format=%ad),
        day: $(git log -n1 --date=format:%d --format=%ad),
      ),
    )
    #metadata("$(git log -n1 --date=format:%Y%m%d --format=%ad-%h)") <release>
    EOF

# Render the PDF.
pdf: metadata
    #!/bin/bash
    set -o errexit -o nounset -o pipefail

    mkdir -p tmp/build/
    cd tmp/build/

    cat > paged.typ <<\EOF
    #import "../../formats.typ"

    #show: formats.paged
    #include "../../main.typ"
    #include "./metadata.typ"
    EOF

    typst compile --root ../../ paged.typ paged.pdf

# Build and view the PDF.
view-pdf: pdf
    open tmp/build/paged.pdf

# Render a document with Typst.
render doc="main.typ":
    mkdir -p tmp/{{parent_directory(doc)}}
    typst compile --root ./ {{doc}} tmp/{{without_extension(doc)}}.pdf

# Render a document with Typst and view the result.
view doc="main.typ": (render doc)
    open tmp/{{without_extension(doc)}}.pdf

# Remove all build products.
clean:
    rm -rf tmp/
    mkdir -p tmp/

# Display tabular data with `xsv`.
display data="r10f-ratios.tsv":
    @xsv table {{data}}
