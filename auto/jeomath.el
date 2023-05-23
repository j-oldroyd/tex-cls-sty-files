(TeX-add-style-hook
 "jeomath"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("enumitem" "shortlabels") ("cleveref" "capitalize" "noabbrev") ("parskip" "parfill")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "booktabs"
    "enumitem"
    "hyperref"
    "cleveref"
    "parskip")
   (TeX-add-symbols
    '("ivec" ["argument"] 1)
    '("exersec" 2)
    '("vcdice" 1)
    "RR"
    "QQ"
    "NN"
    "ZZ"
    "CC"
    "ii"
    "jj"
    "kk"
    "propositionautorefname"
    "corollaryautorefname"
    "lemmaautorefname"
    "definitionautorefname"
    "remarkautorefname"
    "algoritheoremautorefname"
    "exampleautorefname"
    "pointbox"
    "oldemptyset"
    "emptyset"
    "DeclareUSUnit"
    "US")
   (LaTeX-add-environments
    "theorem"
    "proposition"
    "corollary"
    "lemma"
    "definition"
    "remark"
    "fact"
    "algorithm"
    "example"))
 :latex)

