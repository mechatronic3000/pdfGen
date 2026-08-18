'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF CropBox Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 100
pdfSetPosition 25, 350
pdfAddText "Cropped Text"
pdfEndText

pdfCropBox 100, 100, 512, 692

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 100
pdfSetPosition 25, 350
pdfAddText "Cropped Text"
pdfEndText

pdfGen "pdfCropBox.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'



