;; These lines are for using beta version of org-mode
(require 'ox-latex)
(require 'ox-bibtex)
(require 'table)

(setq org-latex-pdf-process
      '("platex %f"
        "platex %f"
        "bibtex %b"
        "platex %f"
        "platex %f"
        "dvipdfmx %b.dvi"))
(setq org-export-latex-date-format "%Y-%m-%d")
(add-to-list 'org-latex-classes
             '("thesis"
               "\\documentclass[12pt, a4paper]{article}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}
		\\usepackage{amsmath}
                \\usepackage{natbib}
                \\usepackage[dvipdfm]{geometry}
		\\usepackage[boxed]{algorithm2e}
                \\geometry{left=20mm,right=20mm,top=35mm,bottom=30mm} % 余白の微調整
                "
	       ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
               ))

(add-to-list 'org-latex-classes
             '("mybeamer"
		"\\documentclass[dvipdfmx, 14pt, presentation]{beamer}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
		\\mode<presentation>{
			\\usetheme{AnnArbor}
			\\usecolortheme{}
		}
		\\usepackage{graphicx}
		\\usepackage{color}
		\\setbeamertemplate{navigation symbols}{}
		\\setbeamertemplate{blocks}[rounded][shadow=false]
		\\setbeamertemplate{itemize items}{\checkmark}
		\\setbeamerfont*{block title}{size=\Large}
		\\setbeamerfont*{block body}{size=\large}
		\\definecolor{ThickBlue}{RGB}{26,77,122} 
		\\definecolor{ThickRed}{RGB}{160,52,41} 
		\\definecolor{BlueForChar}{RGB}{19, 59, 94} 
		\\definecolor{ThinYellow}{RGB}{253, 253, 199}
		\\definecolor{AlertOrange}{RGB}{255,76,0}
		\\definecolor{AlmostBlack}{RGB}{26,77,122}
		\\setbeamercolor{Blue-Yellow}{fg=BlueForChar, bg=ThinYellow}
		\\setbeamercolor{white-Blue}{fg=white, bg=ThickBlue}
		\\setbeamercolor{white-Red}{fg=white, bg=ThickRed}
		\\setbeamercolor{block title}{fg=white, bg=ThickBlue} 
		\\setbeamercolor{block body}{fg=BlueForChar}
		\\setbeamercolor{alerted text}{fg=AlertOrange} 
		\\setbeamercolor*{bibliography entry title}{fg=ThickBlue}
		\\renewcommand{\\pgfuseimage}[1]{\\includegraphics[scale=.6]{#1}}
                "
		org-beamer-sectioning
               ))
(setq org-latex-with-hyperref nil)
;; inline figure size setting
(setq org-image-actual-width 10)
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)

