'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF Stroke Path Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage
pdfSetStrokeWidth 4

pdfBeginText
pdfSetFontSize "F1", 18
pdfSetPosition 100, 710
pdfAddText "StrokePath Example (Does not close shape)"
pdfEndText

pdfBeginPath 100, 700
pdfAppendLine 500, 700
pdfAppendLine 500, 650
pdfAppendLine 100, 650
pdfStrokePath

pdfBeginText
pdfSetPosition 100, 610
pdfAddText "CloseStrokePath Example (Closes shape)"
pdfEndText

pdfBeginPath 100, 600
pdfAppendLine 500, 600
pdfAppendLine 500, 550
pdfAppendLine 100, 550
pdfCloseStrokePath

pdfBeginText
pdfSetPosition 100, 510
pdfAddText "FillPath Example (Fills shape)"
pdfEndText

pdfSetStrokeWidth 1
rad! = 75: xc! = 300: yc! = 420
star rad!, xc!, yc!
pdfFillPath

pdfBeginText
pdfSetPosition 100, 300
pdfAddText "FillEO Example (Fills Even Odd Shape)"
pdfEndText

rad! = 75: xc! = 300: yc! = 200
star rad!, xc!, yc!
pdfFillEO

pdfGen "pdfStrokeShowcaseExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

SUB star (rad!, xc!, yc!)
  pdfBeginPath xc! + rad! * SIN(0), yc! + rad! * COS(0)
  FOR i! = 1 TO 5
    pdfAppendLine xc! + rad! * SIN(_D2R(i! * 144)), yc! + rad! * COS(_D2R(i! * 144))
  NEXT
END SUB
