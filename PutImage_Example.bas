'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF PutImage Example"
pdfSetAuthor "Justsomeguy"
pdfLoadImage "media/Icon.png", "Im1"

pdfAddPage

scaleX! = 100
scaleY! = 100
xP! = 250
yP! = 650

pdfPushGraphicsStack
pdfSetImageMatrix scaleX!, 0, 0, scaleY!, xP!, yP!
pdfPutImage "Im1"
pdfPopGraphicsStack

pdfGen "pdfPutImage.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'



