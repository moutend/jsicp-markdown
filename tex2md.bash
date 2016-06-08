#!/bin/bash

# tex2md.bash --- Latex to markdown converter for SICP Japanese edition by Manabe.
# This script subjects to the latex source of SICP Japanese edition translated by Manabe, this is not general purpose converter.
# If you have a question, please contact at Yoshiyuki Koyanagi <moutend@gmail.com>

set -e

if [ -f "./jsicp-original.tex" ]
then
  echo Pre formatting for converting latex to markdown.
else
  echo jsicp-original.tex: Not found.
  exit 1
fi

cat jsicp-original.tex \
| grep -v '\\noindent' \
| gsed 's/\\acronym{\([^}]*\)}/\1/g' \
| gsed 's/\\link{\([^}]*\)}/\1/g' \
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
| gsed 's/\\hbox{\([^}]*\)}/\1/g' \
| gsed 's/\\[lr]angle//g' \
| cat > temporary.tex

echo Converting latex to markdown.

pandoc -f latex -t markdown temporary.tex \
| gsed ':a;N;$!ba;s/<span[^>]*\n/<span/g' \
| gsed 's/<span[^>]*>//g' \
| gsed 's/<\/span>//g' \
| gsed 's/&gt;/>/g' \
| gsed 's/&lt;/</g' \
| gsed ':a;N;$!ba;s/\\\n/ /g' \
| cat > jsicp-original.md

echo Successfully done.
