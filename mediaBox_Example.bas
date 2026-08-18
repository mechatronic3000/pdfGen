'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF MediaBox Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfMediaBox 0, 0, 2048, 600

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 24
pdfSetPosition 900, 500
pdfAddText "Wide Page"
pdfEndText

pdfMediaBox 0, 0, 600, 2048

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 24
pdfSetPosition 270, 1948
pdfAddText "Long Page"
pdfEndText

pdfGen "pdfMediaBox.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'



