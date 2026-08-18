'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF Stroke Width Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage

FOR y# = 1 TO 10 STEP .5
  pdfSetStrokeWidth y#
  pdfBeginPath 150, 550 - y# * 30
  pdfAppendLine 250, 550 - y# * 30
  pdfStrokePath
  pdfBeginText
  pdfSetFontSize "F1", 12
  pdfSetPosition 50, 547 - y# * 30
  pdfAddText "Stroke width : " + STR$(y#)
  pdfEndText
NEXT
pdfGen "pdfStrokeWidthExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

