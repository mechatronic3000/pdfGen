'$INCLUDE:'pdfGen.bi'

pdfLoadImage "media/Icon.png", "Im1"

pdfAddPage
FOR theta! = 0 TO 360 STEP 15
  pdfPushGraphicsStack
  pdfSetImageMatrix 100, 0, 0, 100, 300, 600
  pdfRotateImage 0, 0, theta!
  pdfPutImage "Im1"
  pdfPopGraphicsStack
NEXT

pdfGen "pdfRotateImage.pdf"

SYSTEM
'$INCLUDE:'pdfGen.bm'



