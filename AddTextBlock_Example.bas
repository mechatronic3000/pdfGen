'$INCLUDE:'pdfGen.bi'

pdfSetTitle "PDF AddTextBlock Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN

pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 24
pdfSetPosition 30, 450
pdfSetLeading 26 'Must be set before calling pdfAddTextBlock

'Moby Dick - Herman Melville
pdfAddTextBlock 60, "Call me Ishmael. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world."

pdfEndText

pdfGen "pdfAddTextBlockExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'

