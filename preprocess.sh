#!/bin/bash

cat jsicp.tex \
| grep -v '\\noindent' \
| gsed 's/\\j*newterm{\([^}]*\)}/\1/g' \
| gsed 's/\\kern-\?[0-9.]*e[mx]//g' \
| gsed 's/\~\\( \\dots \\)\~/.../g' \
| gsed 's/\~\\var{\\dark \([^}]*\)}\~/\1/g' \
| gsed 's/\~\\( \\dark \\.angle \\)\~//g' \
| gsed 's/\\( \\langle\\hbox{\\sl \([^}]*\)}\\rangle \\)/\1/g' \
| gsed 's/\\( \\langle{\([^}]*\)}\\rangle \\)/\1/g' \
| gsed 's/\~\\( \\dark \\langle{\([^}]*\)}\\rangle \\)\~/\1/g' \
| gsed 's/\\( \\langle \\)\\var{\([^}]*\)}\\( \\rangle \\)/\1/g' \
| gsed 's/\\dots/.../g' \
| gsed 's/\\langle{\([^}]*\)}\\rangle/\1/g' \
| pandoc -f latex -t markdown \
| gsed ':a;N;$!ba;s/<span[^>]*\n/<span@@@/g' \
| gsed 's/<span[^>]*>//g' \
| gsed 's/<\/span>//g' \
| gsed ':a;N;$!ba;s/\\\n/ /g' \
| gsed 's/\\//g' \
