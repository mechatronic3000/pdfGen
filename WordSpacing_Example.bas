'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF Word Spacing Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 14
pdfSetPosition 150, 650
pdfSetLeading 15
pdfAddText "This is some text."
pdfNextLine
pdfSetWordSpacing 1
pdfAddText "This is some text."
pdfNextLine
pdfSetWordSpacing 2
pdfAddText "This is some text."
pdfNextLine
pdfSetWordSpacing 3
pdfAddText "This is some text."
pdfNextLine
pdfSetWordSpacing 4
pdfAddText "This is some text."
pdfNextLine
pdfSetWordSpacing 5
pdfAddText "This is some text."
pdfEndText

pdfGen "pdfWordSpacingExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

