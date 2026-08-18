'Example 1: Simple Text with some Special Characters
'Library include
'$INCLUDE:'pdfGen.bi'
'Fill in the Meta Data
pdfDefault.compressedText = False
pdfSetTitle "PDF Simple Example"
pdfSetSubject "Example"
pdfSetAuthor "Justsomeguy"
pdfSetKeywords "PDF, Example, QB64pe, Special Characters"
pdfSetCreator "pdfGen and QB64pe"
pdfSetProducer "Justsomeguy"

'Create a page
pdfAddPage
'Begin Text block
pdfBeginText
'Load internal Font using the ID of "F1"
pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
'Set the size of "F1" to 24
pdfSetFontSize "F1", 24
'Set the position. By default the origin is in the lower left.
'Any further calls to pdfSetPosition will be relative from the last call.
pdfSetPosition 30, 600
'Set Line height. This is how far the "cursor" moves down to the next line.
pdfSetLeading 28
'Draw line of text with a maximum width of 55 characters.
pdfAddTextBlock 55, "To draw special characters you have to use a '\xxx'." + _
                    " 'xxx' is a 3 digit octal number."
'Drop down a line.
pdfNextLine
'Draw a line of text, with no length limit.
pdfAddText "These are some special characters \201 \202 \203 \204 \251"
'End text block
pdfEndText

'Generate File
pdfGen "Example 1.pdf"
SYSTEM
'Library include
'$INCLUDE:'pdfGen.bm'



