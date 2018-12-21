# prompt
set prompt=`echo $prompt | sed 's/>%b$/:%C>%b/'`" "

# editor
setenv CSHEDIT vim
setenv EDITOR vim
setenv WINEDITOR gvim

# path
setenv PATH ${HOME}/bin:${PATH}

