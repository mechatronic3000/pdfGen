'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF Rectangle Example"
pdfSetAuthor "Justsomeguy"

pdfAddPage
xC! = 150
yC! = 350
w! = 300
h! = 300

pdfSetStrokeWidth 4
FOR i& = 0 TO 100 STEP 10
  pdfRectangle xC! + i&, yC! + i&, w! - (i& * 2), h! - (i& * 2)
  pdfStrokePath
NEXT

pdfGen "pdfRectangleExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

