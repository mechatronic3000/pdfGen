'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF SetPosition Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage

pdfBeginText
pdfSetFontSize "F1", 24
pdfSetPosition 120, 350
pdfAddText "This is 120,350."
pdfSetPosition 60, 60
pdfAddText "This is 60, 60 from previous position."
pdfEndText

pdfGen "pdfSetPositionExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

