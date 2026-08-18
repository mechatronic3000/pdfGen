'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF GrayScaleNonStroke Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage
c# = 0.0
FOR y& = 1 TO 5
  pdfSetStrokeWidth 10
  pdfSetGrayScaleStroke c#
  pdfBeginPath 45, 650 - y& * 20
  pdfAppendLine 120, 650 - y& * 20
  pdfStrokePath

  pdfBeginText
  pdfSetFontSize "F1", 10
  pdfSetPosition 50, 647 - y& * 20
  pdfSetGrayScaleNonStroke (1 - c#) * -(y& <> 3)
  pdfAddText "Grayscale : " + STR$(c#)
  pdfEndText
  c# = c# + .25
NEXT
pdfGen "pdfGrayScaleNonStroketExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

