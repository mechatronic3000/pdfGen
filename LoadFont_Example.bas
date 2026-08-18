'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF Load Font Example"
pdfSetAuthor "Justsomeguy"
pdfLoadFont "F1", PDF_FONT_COURIER
pdfLoadFont "F2", PDF_FONT_COURIER_BOLD
pdfLoadFont "F3", PDF_FONT_COURIER_OBLIQUE
pdfLoadFont "F4", PDF_FONT_COURIER_BOLD_OBLIQUE
pdfLoadFont "F5", PDF_FONT_HELVETICA
pdfLoadFont "F6", PDF_FONT_HELVETICA_BOLD
pdfLoadFont "F7", PDF_FONT_HELVETICA_OBLIQUE
pdfLoadFont "F8", PDF_FONT_HELVETICA_BOLD_OBLIQUE
pdfLoadFont "F9", PDF_FONT_SYMBOL
pdfLoadFont "F10", PDF_FONT_TIMES_ROMAN
pdfLoadFont "F11", PDF_FONT_TIMES_BOLD
pdfLoadFont "F12", PDF_FONT_TIMES_ITALIC
pdfLoadFont "F13", PDF_FONT_TIMES_BOLD_ITALIC
pdfLoadFont "F14", PDF_FONT_ZAPFDINGBATS
pdfAddPage
pdfBeginText
pdfSetFontSize "F1", 12
pdfSetLeading 15
pdfSetPosition 40, 700
pdfAddText "Courier": pdfNextLine
pdfSetFontSize "F2", 12
pdfAddText "Courier Bold": pdfNextLine
pdfSetFontSize "F3", 12
pdfAddText "Courier Oblique": pdfNextLine
pdfSetFontSize "F4", 12
pdfAddText "Courier Bold Oblique": pdfNextLine
pdfSetFontSize "F5", 12
pdfAddText "Helvetica": pdfNextLine
pdfSetFontSize "F6", 12
pdfAddText "Helvetica Bold": pdfNextLine
pdfSetFontSize "F7", 12
pdfAddText "Helvetica Oblique": pdfNextLine
pdfSetFontSize "F8", 12
pdfAddText "Helvetica Bold Oblique": pdfNextLine
pdfSetFontSize "F1", 12
pdfAddText "Symbol  ": pdfSetFontSize "F9", 12: pdfAddText "abcdefgh": pdfNextLine
pdfSetFontSize "F10", 12
pdfAddText "Times Roman": pdfNextLine
pdfSetFontSize "F11", 12
pdfAddText "Times Bold": pdfNextLine
pdfSetFontSize "F12", 12
pdfAddText "Times Italic": pdfNextLine
pdfSetFontSize "F13", 12
pdfAddText "Times Bold Italic": pdfNextLine
pdfSetFontSize "F1", 12
pdfAddText "ZAPFDINGBATS  ": pdfSetFontSize "F14", 12: pdfAddText "abcdefgh": pdfNextLine

pdfEndText

pdfGen "pdfLoadFontExample.pdf"
SYSTEM

'$INCLUDE:'pdfGen.bm'



