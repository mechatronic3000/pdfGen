'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF RenderMode Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_BOLD

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 64
pdfSetPosition 200, 414 'Initial position
pdfSetStrokeWidth .25
pdfSetRenderMode PDF_RENDER_MODE_STROKE_ADD_PATH
pdfAddText "pdfGEN"
pdfEndText

pdfBeginText
pdfSetPosition 200, 480 'Initial position
pdfSetFontSize "F1", 6: pdfSetLeading 6
pdfSetRenderMode PDF_RENDER_MODE_FILL
FOR i& = 0 TO 1000: s$ = s$ + "clipped": NEXT
pdfAddTextBlock 100, s$
pdfEndText

pdfGen "pdfRenderModeExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

