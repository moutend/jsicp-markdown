%g/^\\noindent$/d
%s/\\j*newterm{\([^}]*\)}/\1/g
%s/\~\\var{\\dark \([^}]*\)}\~/\1/g
%s/\\kern[0-9.]*em//g
%s/\~\\( \\dark \\.angle \\)\~//g
%s/\\( \\langle\\hbox{\\sl \([^}]*\)}\\rangle \\)/\1/g
%s/\~\\( \\dots \\)\~/.../g
%s/\\( \\langle{\([^}]*\)}\\rangle \\)/\1/g
%s/\~\\( \\dark \\langle{\([^}]*\)}\\rangle \\)\~/\1/g
