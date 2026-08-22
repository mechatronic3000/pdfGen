'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF VarText Example"
pdfSetAuthor "Justsomeguy"
' Initialize variables and font
pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
' Variables are not case sensitive
pdfSetVar "VAR", "This is Some Text!"
pdfSetVar "simple variable", "More Text!"
' Add page
pdfAddPage
' Display First Variable
pdfBeginText
pdfSetFontSize "F1", 24
pdfSetPosition 200, 350
pdfAddVariableText "VAR"
pdfEndText
' Display Second Variable
pdfBeginText
pdfSetFontSize "F1", 28
pdfSetPosition 200, 320
pdfAddVariableText "simple variable"
pdfEndText

pdfGen "pdfVarTextExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

