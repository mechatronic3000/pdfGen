'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF AddPage Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage

pdfBeginText
pdfSetFontSize "F1", 64
pdfSetPosition 120, 350
pdfAddText "This is a page"
pdfEndText

pdfAddPage

pdfBeginText
pdfSetFontSize "F1", 64
pdfSetPosition 35, 350
pdfAddText "This is another page"
pdfEndText

pdfGen "pdfAddPageExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'



