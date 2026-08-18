'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF AppendBezier23 Example"
pdfSetAuthor "Justsomeguy"
pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
'Starting Point
xC! = 300
yC! = 350
'Control Point 1
cPx1! = xC! + 50
cPy1! = yC! + 250
'Final Point
fNx! = xC! + 200
fNy! = yC! + 200
'draw Bezier
pdfBeginPath xC!, yC!
pdfAppendBezier23 cPx1!, cPy1!, fNx!, fNy!
pdfStrokePath
'draw visual aids
pdfRectangle xC! - 2, yC! - 2, 4, 4
pdfStrokePath
pdfRectangle fNx! - 2, fNy! - 2, 4, 4
pdfStrokePath
pdfRectangle cPx1! - 2, cPy1! - 2, 4, 4
pdfStrokePath
pdfBeginPath cPx1!, cPy1!
pdfSetLineDashPattern 2, 2, 0
pdfAppendLine fNx!, fNy!
pdfStrokePath
pdfBeginText
pdfSetFontSize "F1", 14
pdfSetPosition xC! - 40, yC - 15!
pdfAddText "Starting Point"
pdfEndText
pdfBeginText
pdfSetFontSize "F1", 14
pdfSetPosition cPx1! - 40, cPy1! + 5
pdfAddText "Control Point"
pdfEndText
pdfBeginText
pdfSetFontSize "F1", 14
pdfSetPosition fNx! - 30, fNy! - 15
pdfAddText "End Point"
pdfEndText

pdfGen "pdfAppendBezier23Example.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

