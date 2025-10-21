#!/usr/bin/env -S just --justfile

set shell := ['bash', '-o', 'errexit', '-o', 'nounset', '-o', 'pipefail', '-c']
# set script-interpreter := [
#   'bash', '-o', 'errexit', '-o', 'nounset', '-o', 'pipefail'
# ]

[default]
web: (typst "main.typ" "tmp/index.html" "--features" "html")

render doc="main.typ": (typst doc "tmp/" + without_extension(doc) + ".pdf")

typst input output *args:
    mkdir -p {{parent_directory(output)}}
    typst compile --root ./ {{args}} {{input}} {{output}}

view doc="main.typ": (render doc)
    open tmp/{{without_extension(doc)}}.pdf

rel:
    @git log -n1 --date=format:%Y%m%d --format="%ad-%h"
