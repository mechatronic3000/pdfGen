'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF AddText Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 24
pdfSetPosition 200, 350

pdfAddText "This is some short text."

pdfEndText

pdfGen "pdfAddTextExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

