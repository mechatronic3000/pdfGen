'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF RotateText Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 14
FOR deg! = 0 TO 360 STEP 15
  pdfRotateText 300, 400, deg!
  pdfAddText "           This is some text. "
NEXT
pdfEndText

pdfGen "pdfRotateTextExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

