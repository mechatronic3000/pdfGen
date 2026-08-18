'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF BeginText Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage

pdfBeginText

pdfSetFontSize "F1", 14
pdfSetPosition 150, 350 'Initial position
pdfAddText "This is some text."
pdfSetPosition 20, 20 'Relative position
pdfAddText " This some more text."
pdfEndText

pdfBeginText 'Resets back to lower left

pdfSetFontSize "F1", 14
pdfSetPosition 150, 300
pdfAddText "This is some text."
pdfSetPosition 20, 20 'Relative position
pdfAddText " This some more text."
pdfEndText


pdfGen "pdfBeginTextExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

