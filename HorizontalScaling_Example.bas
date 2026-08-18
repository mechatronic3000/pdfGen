'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF Horizontal Scaling Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 48
pdfSetPosition 100, 720
pdfSetLeading 48
pdfSetHorizontalScaling 80
pdfAddText "This is some text."
pdfNextLine
pdfSetHorizontalScaling 90
pdfAddText "This is some text."
pdfNextLine
pdfSetHorizontalScaling 100
pdfAddText "This is some text."
pdfNextLine
pdfSetHorizontalScaling 110
pdfAddText "This is some text."
pdfNextLine
pdfSetHorizontalScaling 120
pdfAddText "This is some text."
pdfEndText

pdfGen "pdfHorizontalScalingExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

