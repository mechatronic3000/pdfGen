'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF EndText Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage

pdfBeginText 'Begin Text Block
pdfSetFontSize "F1", 14
pdfSetPosition 150, 350 'Initial position
pdfAddText "This is some text."

pdfEndText 'End Text Block

pdfGen "pdfEndTextExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

