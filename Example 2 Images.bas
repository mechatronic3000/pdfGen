'Simple PDF with Image Example
'$INCLUDE:'pdfGen.bi'

'Always Load a Font, "F1" is it Identifier
'Only the built in fonts work
pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

'Load some Images, "Im1" and "Im2" are the identifiers
'pdfSetImageDevice PDF_IMAGE_DEVICE_GRAY
pdfLoadImage "media/IMG.png", "Im1"
'pdfSetImageDevice PDF_IMAGE_DEVICE_RGB
pdfLoadImage "media/img2.png", "Im2"

'Always Add page, you need a page to work on
pdfAddPage
'Begin a Text Block, only do text stuff here
pdfBeginText
'Set font "F1" to size 36
pdfSetFontSize "F1", 36
'Move relative from 0,0 to xxx,yyy. All positions are relative.
'To reset the position back to 0,0 end the text block and begin a new one.
pdfSetPosition 200, 100
'Draw some text
pdfAddText "Image Example"
'End the text block. Always end the text block!
pdfEndText

'Push the current graphic state to the stack
pdfPushGraphicsStack
'Set the Matrix to 100% scale in the X,Y and Translate to xxx,yyy
pdfSetImageMatrix 100, 0, 0, 100, 120, 340
'Rotate it for fun
pdfRotateImage 0, 0, -45
'Draw the Image "Im1"
pdfPutImage "Im1"
'Return the graphics state
pdfPopGraphicsStack

''Push the current graphic state to the stack
pdfPushGraphicsStack
'Set the Matrix to 200% scale in the X,Y and Translate to xxx,yyy
pdfSetImageMatrix 200, 0, 0, 200, 250, 340
'Draw the Image "Im2"
pdfPutImage "Im2"
'Return the graphics state
pdfPopGraphicsStack

'Generate The PDF
pdfGen "Example 2 Images.pdf"

SYSTEM
'$INCLUDE:'pdfGen.bm'



