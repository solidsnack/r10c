#!/usr/bin/env -S just --justfile

set shell := ['bash', '-o', 'errexit', '-o', 'nounset', '-o', 'pipefail', '-c']

label := shell(
    "fgrep label ./info.typ | cut -d':' -f 2- | tr -Cd 'a-z0-9.-'"
)

domain := shell(
    "fgrep domain ./info.typ | cut -d':' -f 2- | tr -Cd 'a-z0-9.-'"
)

# Build the website.
[default]
dist: (dist-web) (dist-pdf)

# Build the PDF and place it in the distribution folder.
dist-pdf: pdf
    #!/bin/bash
    set -o errexit -o nounset -o pipefail

    label={{label}}

    mkdir -p tmp/dist
    cp tmp/build/paged.pdf tmp/dist/"$label".pdf

# Build and view the PDF.
view-pdf: dist-pdf
    open tmp/dist/{{label}}.pdf

# Build the web page and place it in the distribution folder.
dist-web: web
    #!/bin/bash
    set -o errexit -o nounset -o pipefail

    mkdir -p tmp/dist
    cp -a tmp/build/css/ tmp/dist/css/
    cp tmp/build/index.html tmp/dist

# Build and view the web page.
view-web: dist-web
    open tmp/dist/index.html

# Deploy the distribution.
deploy url=("s3://" + domain + "/"): dist
    echo aws s3 sync tmp/dist/ {{url}} --delete

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
    $(cat ./info.typ)
    #set document(
      title: info.title,
      author: "$(git log -n1 --format=%an)",
      date: datetime(
        year: $(git log -n1 --date=format:%Y --format=%ad),
        month: $(git log -n1 --date=format:%m --format=%ad),
        day: $(git log -n1 --date=format:%d --format=%ad),
      ),
    )
    #metadata(
      info.label + ":$(git log -n1 --date=format:%Y%m%d --format=%ad-%h)"
    ) <release>
    EOF

# Render the PDF.
pdf: metadata
    #!/bin/bash
    set -o errexit -o nounset -o pipefail

    mkdir -p tmp/build/
    cd tmp/build/

    cat > paged.typ <<EOF
    #import "../../formats.typ"

    $(cat ./metadata.typ)

    #show: formats.paged(info)[#include "../../main.typ"]
    EOF

    typst compile --root ../../ paged.typ paged.pdf

# Render the main webpage.
web: metadata
    #!/bin/bash
    set -o errexit -o nounset -o pipefail

    mkdir -p tmp/build/

    tar -c css/ | tar -C tmp/build/ -x

    cd tmp/build/

    cat > web.typ <<EOF
    #import "../../formats.typ"

    $(cat ./metadata.typ)

    #show: formats.web(info)[#include "../../main.typ"]
    EOF

    typst compile --root ../../ --features html web.typ index.html

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
display data:
    @xsv table {{data}}
