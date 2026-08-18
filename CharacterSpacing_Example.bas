'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF Character Spacing Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 14
pdfSetPosition 150, 350 'Initial position
pdfSetLeading 15
pdfAddText "This is some text."
pdfNextLine
pdfSetCharacterSpacing 1
pdfAddText "This is some text."
pdfNextLine
pdfSetCharacterSpacing 2
pdfAddText "This is some text."
pdfNextLine
pdfSetCharacterSpacing 3
pdfAddText "This is some text."
pdfEndText

pdfGen "pdfCharacterSpacingExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

