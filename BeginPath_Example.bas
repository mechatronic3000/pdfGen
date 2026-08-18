'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF BeginPath Example"
pdfSetAuthor "Justsomeguy"

pdfAddPage
xC! = 300
yC! = 350
rad! = 250
deg! = 0

pdfBeginPath xC! + rad! * SIN(_D2R(deg!)), yC! + rad! * COS(_D2R(deg!))

FOR i& = 0 TO 249
  deg! = deg! + 91
  rad! = rad! - 1
  pdfAppendLine xC! + rad! * SIN(_D2R(deg!)), yC! + rad! * COS(_D2R(deg!))
NEXT
pdfStrokePath

pdfGen "pdfBeginPathExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

