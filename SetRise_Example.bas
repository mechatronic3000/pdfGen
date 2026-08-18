'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF SetRise Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetPosition 50, 720 'Initial position
pdfSetFontSize "F1", 14
pdfAddText "This is some text. "
pdfSetFontSize "F1", 7
pdfSetRise 7
pdfAddText "This is superscript"
pdfSetRise -3
pdfAddText "This is subscript"
pdfSetRise 0
pdfSetFontSize "F1", 14
pdfAddText "This is normal text"

pdfEndText

pdfGen "pdfSetRiseExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

