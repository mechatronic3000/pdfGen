'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF SetLeading Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetPosition 50, 720 'Initial position
pdfSetFontSize "F1", 14
pdfSetLeading 14
pdfAddText "This is some text."
pdfSetLeading 16
pdfNextLine
pdfAddText "This is some text."
pdfSetLeading 18
pdfNextLine
pdfAddText "This is some text."
pdfSetLeading 20
pdfNextLine
pdfAddText "This is some text."
pdfSetLeading 22
pdfNextLine
pdfAddText "This is some text."
pdfSetLeading 24
pdfNextLine
pdfAddText "This is some text."
pdfEndText

pdfGen "pdfSetLeadingExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

