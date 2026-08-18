'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF SetMatrix Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 36

xp! = 50
yp! = 700
pdfSetMatrix 1, 0, 0, 1, xp!, yp!
pdfAddText "This is normal text."

scaleX! = 2
scaleY! = 2
pdfSetMatrix scaleX!, 0, 0, scaleY!, xp!, yp! - 100.0
pdfAddText "This is scaled text. "

alpha! = 0.0
beta! = 45.0
pdfSetMatrix 1, TAN(_D2R(alpha!)), TAN(_D2R(beta!)), 1, xp!, yp! - 200
pdfAddText "This is skewed text. "

theta! = 30.0
pdfSetMatrix COS(_D2R(theta!)), SIN(_D2R(theta!)), -SIN(_D2R(theta!)), COS(_D2R(theta!)), xp!, yp! - 400
pdfAddText "This is rotated text. "

pdfEndText

pdfGen "pdfSetMatrixExample.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

