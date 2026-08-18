'$INCLUDE:'pdfGen.bi'
pdfSetTitle "PDF AddTextBlockEx Example"
pdfSetAuthor "Justsomeguy"

pdfLoadFont "F1", PDF_FONT_TIMES_ROMAN
pdfAddPage
pdfBeginText
pdfSetPosition 30, 720
pdfSetFontSize "F1", 18
pdfSetLeading 20
FOR l& = 1 TO 400: bigString$ = bigString$ + RandomWord + " ": NEXT
lineCount& = 33 ' Set the line count max.
charCount& = 48
DO
  bigString$ = pdfAddTextBlockEx(charCount&, lineCount&, bigString$)
  IF LEN(bigString$) > 0 THEN ' Start a new page
    pdfEndText 'End the text block
    pdfAddPage ' Add a page
    pdfBeginText ' Begin New Text Block
    pdfSetFontSize "F1", 18
    pdfSetPosition 30, 720
    pdfSetLeading 20
  END IF
LOOP WHILE LEN(bigString$) > 0
pdfEndText
pdfGen "pdfAddTextBlockEx_Example.pdf"
SYSTEM
'$INCLUDE:'pdfGen.bm'

FUNCTION RandomWord$
  consonants$ = "BCDFGHJKLMNPRSTVWYZ": vowels$ = "AEIOU"
  Z& = (RND * 2) + 2
  FOR X& = 1 TO Z&
    B& = (RND * 19) + 1: c$ = c$ + MID$(consonants$, B&, 1)
    IF LEN(c$) > 4 THEN vowels$ = "AEIOUY"
    B& = (RND * 4) + 1: c$ = c$ + MID$(vowels$, B&, 1)
  NEXT
  B& = (RND * 4)
  IF B& >= 1 AND LEN(c$) > 5 THEN c$ = LEFT$(c$, LEN(c$) - 1)
  RandomWord$ = c$
END FUNCTION

