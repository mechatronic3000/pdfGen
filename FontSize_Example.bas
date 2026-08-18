'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF SetFontSize Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage

pdfBeginText
pdfSetPosition 50, 750 'Initial position
FOR i& = 0 TO 28
  fSize& = 8 + i&
  pdfSetFontSize "F1", fSize&
  pdfSetLeading fSize&
  pdfAddText "This is fontSize " + STR$(fSize&) + "."
  pdfNextLine
NEXT
pdfEndText


pdfGen "pdfSetFontSizeExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

