(TeX-add-style-hook
 "rapport"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("geometry" "left=2cm" "right=2cm" "top=2cm" "bottom=2cm")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "amssymb"
    "amsmath"
    "amsthm"
    "mathtools"
    "geometry"
    "hyperref"
    "xcolor"
    "xparse")
   (TeX-add-symbols
    '("smbox" 1)
    "ie"
    "R"
    "C"
    "N"
    "hs"
    "lG"
    "Gm")
   (LaTeX-add-labels
    "eq:green"
    "eq:goal"
    "tab:timebrut"
    "eq:devel"
    "eq:GL"
    "fig:sph"
    "fig:L_min_l"
    "eq:cddk"
    "fig:err_L"
    "fig:err_x0"
    "fig:tps_npts"
    "fig:part"
    "tab:funcs")
   (LaTeX-add-amsthm-newtheorems
    "pb"
    "rmq"))
 :latex)

