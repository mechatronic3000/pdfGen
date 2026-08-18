'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF NextLine Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 14
pdfSetPosition 150, 350 'Initial position
pdfSetLeading 15

pdfAddText "This is some text."
pdfAddText " This is some more text."
pdfNextLine
pdfAddText "This is some text on a new line."
pdfEndText

pdfGen "pdfNextLineExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

