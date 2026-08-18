'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF GrayScaleStroke Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage
c# = 0.0
FOR y& = 1 TO 5
  pdfSetStrokeWidth 10
  pdfSetGrayScaleStroke c#
  pdfBeginPath 100, 550 - y& * 20
  pdfAppendLine 500, 550 - y& * 20
  pdfStrokePath

  pdfSetGrayScaleStroke 0
  pdfSetStrokeWidth 1
  pdfRectangle 100, 545 - y& * 20, 400, 10
  pdfStrokePath

  pdfBeginText
  pdfSetFontSize "F1", 10
  pdfSetPosition 240, 547 - y& * 20
  pdfSetGrayScaleNonStroke (1 - c#) * -(y& <> 3)
  pdfAddText "Grayscale : " + STR$(c#)
  pdfEndText
  c# = c# + .25
NEXT
pdfGen "pdfGrayScaleStroketExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

