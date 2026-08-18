'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF ClosePath Example"
pdfSetAuthor "Justsomeguy"

pdfAddPage
xC! = 300
yC! = 350
pdfBeginPath xC! + 5, yC! 'Start the path
pdfAppendLine xC! + 100, yC! + 100 'Points along the path
pdfAppendLine xC! + 100, yC! - 100 'Points along the path
pdfClosePath 'close path to the start

pdfBeginPath xC! - 5, yC! 'Start the path
pdfAppendLine xC! - 100, yC! - 100 'Points along the path
pdfAppendLine xC! - 100, yC! + 100 'Points along the path
pdfClosePath 'close path to the start

pdfStrokePath ' Path is not drawn until now

pdfGen "pdfClosePathExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

