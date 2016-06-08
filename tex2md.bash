#!/bin/bash

cat jsicp.tex \
| grep -v '\\noindent' \
| gsed 's/\\j\?newterm{\([^}]*\)}/\1/g' \
| gsed 's/\\dark//g' \
| gsed 's/\\sl //g' \
| gsed 's/\\kern-\?[0-9.]*e[mx]//g' \
| gsed 's/\\tt(/(/g' \
| gsed 's/\\dots/.../g'  \
| gsed 's/\\var{\([^}]*\)}/\1/g' \
| gsed 's/\\langle{\([^}]*\)}\\rangle/\1/g' \
| gsed 's/ \\[lr]angle //g' \
| gsed 's/\~\\( \([^\]*\)\\)\~/\1/g' \
| gsed 's/\~ \([^\~]*\)\~/\1/g' \
