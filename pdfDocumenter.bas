'OPTION _EXPLICIT
'PdfDocumenter
'Library include
'$INCLUDE:'pdfGen.bi'

TYPE tDEFAULTS
  textBlockWidth AS LONG
  textBlockLines AS LONG
  logfile AS LONG
  ma AS SINGLE
  mb AS SINGLE
  mc AS SINGLE
  md AS SINGLE
  me AS SINGLE
  mf AS SINGLE
  irot AS SINGLE
END TYPE

DIM SHARED AS tDEFAULTS default
default.textBlockWidth = 120
default.textBlockLines = 100
default.logfile = FREEFILE
default.ma = 100
default.mb = 0
default.mc = 0
default.md = 100
default.me = 100
default.mf = 700
default.irot = 0
CONST PDF_HEADER = "_pdf_"

DIM AS STRING fl
fl = _OPENFILEDIALOG$("Open File", "", "*.bas|*.bi|*.bm", "Source Files", -1)
IF _FILEEXISTS(fl) THEN
  pdfDocSource fl, "'"
END IF


'_pdf_+B#40,740L12FF1,Courier@F1,10
SYSTEM
'Library include
'$INCLUDE:'pdfGen.bm'


SUB pdfDocSource (file AS STRING, comment AS STRING)
  DIM AS LONG fl, v
  DIM AS STRING s, s1
  OPEN "srcLog.txt" FOR OUTPUT AS default.logfile
  fl = FREEFILE
  OPEN file FOR INPUT AS fl

  DO WHILE NOT EOF(fl)
    LINE INPUT #fl, s
    IF LEN(s) > 1 THEN
      s1 = LCASE$(stripWhiteSpace(s))
      IF LEFT$(s1, 9) <> "'$include" THEN ' skip meta commands
        IF INSTR(LCASE$(s1), comment + PDF_HEADER) THEN
          v = pdfParseSource(s, comment, v)
        ELSE
          ' if v = 1 then start including source code into pdf
          IF v = 1 THEN
            PRINT #default.logfile, s
            pdfAddTextBlock default.textBlockWidth, s
            pdfNextLine
          END IF
        END IF
      END IF
    END IF
  LOOP
  CLOSE fl
  CLOSE default.logfile
END SUB
'_pdf_E+B#40,740L12FF1,Courier@F1,10
'_pdf_T'***** parse source *****
'_pdf_T'

FUNCTION pdfParseSource (s AS STRING, comment AS STRING, v AS LONG)
  DIM AS LONG c, i, ac
  DIM AS STRING arg1, arg2, arg3, arg4
  arg1 = "": arg2 = "": arg3 = "": arg4 = ""
  c = INSTR(s, comment + PDF_HEADER)
  pdfParseSource = v
  IF c THEN
    i = c + LEN(PDF_HEADER): DO
      IF i <= LEN(s) THEN
        ac = ASC(s, i)
        SELECT CASE ac
          CASE 40 '( output text to pdf
            PRINT #default.logfile, "("
            pdfParseSource = 1
          CASE 43 '+ Addpage
            PRINT #default.logfile, "+"
            pdfAddPage
          CASE 66 'B Begin Text
            PRINT #default.logfile, "B"
            pdfBeginText
            pdfParseSource = 1
          CASE 87 'W set text block width
            i = i + 1 'skip the 'W'
            arg1 = takeInNumber$(s, i)
            default.textBlockWidth = VAL(arg1)
            PRINT #default.logfile, "W  "; arg1
            i = i - 1
          CASE 35 '#xxx,yyy Set position
            i = i + 1 'skip the pound
            arg1 = takeInNumber$(s, i)
            i = i + 1 'skip the delimiter like a comma
            arg2 = takeInNumber$(s, i)
            pdfSetPosition VAL(arg1), VAL(arg2)
            i = i - 1
            PRINT #default.logfile, "#  "; arg1; " "; arg2
          CASE 70 'F load font
            i = i + 1 ' skip the F
            arg1 = takeInAlphaNumber$(s, i)
            i = i + 1 ' skip the delimiter
            arg2 = takeInAlphaNumber$(s, i)
            pdfLoadFont arg1, arg2
            i = i - 1
            PRINT #default.logfile, "loadfont "; arg1; "  "; arg2
          CASE 64 '@ Set Font and size
            i = i + 1 'skip the pound
            arg1 = takeInAlphaNumber$(s, i)
            i = i + 1 'skip the delimiter like a comma
            arg2 = takeInNumber$(s, i)
            pdfSetFontSize arg1, VAL(arg2)
            i = i - 1
            PRINT #default.logfile, "@  "; arg1; " "; arg2
            '_pdf_E+B#40,740L12FF1,Courier@F1,10
          CASE 76 'L Set Leading
            i = i + 1 'skip the 'L'
            arg1 = takeInNumber$(s, i)
            pdfSetLeading VAL(arg1)
            PRINT #default.logfile, "L  "; arg1
            i = i - 1
          CASE 84 ' T add text
            i = i + 1 ' skip the T
            'i = i + 1 ' skip the delimiter
            pdfAddTextBlock default.textBlockWidth, MID$(s, i)
            PRINT #default.logfile, MID$(s, i)
            pdfNextLine
            EXIT DO ' Ignore the rest of the line
          CASE 116 ' t add text, no line feed
            i = i + 1 ' skip the 't'
            pdfAddTextBlock default.textBlockWidth, MID$(s, i)
            PRINT #default.logfile, MID$(s, i)
            EXIT DO ' Ignore the rest of the line
          CASE 69 'E End Text
            PRINT #default.logfile, "E"
            pdfEndText
            pdfParseSource = 0
          CASE 71 'G Generate pdf
            i = i + 1 ' skip the G
            i = i + 1 ' skip the delimiter
            arg1 = takeInAlphaNumber$(s, i)
            pdfGen arg1
            i = i + 1
            PRINT #default.logfile, "pdfGen "; arg1
          CASE 41 ') ignore text
            PRINT #default.logfile, ")"
            pdfParseSource = 0
          CASE 88 ' X Vector art related
            i = i + 1 ' skip the X
            ac = ASC(s, i)
            i = i + 1 ' skip the following character
            SELECT CASE ac
              CASE 119 'w stroke width
                arg1 = takeInNumber$(s, i)
                pdfSetStrokeWidth VAL(arg1)
                i = i - 1
              CASE 99 'c stroke color
                arg1 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg2 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg3 = takeInNumber$(s, i)
                pdfSetColorStroke VAL(arg1), VAL(arg2), VAL(arg3)
                i = i - 1
                PRINT #default.logfile, "Xc  "; arg1; " "; arg2; " "; arg3
              CASE 110 'n non-stroke color
                arg1 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg2 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg3 = takeInNumber$(s, i)
                pdfSetColorNonStroke VAL(arg1), VAL(arg2), VAL(arg3)
                i = i - 1
                PRINT #default.logfile, "Xn  "; arg1; " "; arg2; " "; arg3
              CASE 114 'r rectangle
                arg1 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg2 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg3 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg4 = takeInNumber$(s, i)
                pdfRectangle VAL(arg1), VAL(arg2), VAL(arg3), VAL(arg4)
                i = i - 1
                PRINT #default.logfile, "Xr  "; arg1; " "; arg2; " "; arg3; " "; arg4
              CASE 98 'b begin path
                arg1 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg2 = takeInNumber$(s, i)
                pdfBeginPath VAL(arg1), VAL(arg2)
                i = i - 1
                PRINT #default.logfile, "Xb  "; arg1; " "; arg2
              CASE 108 'l append line
                arg1 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg2 = takeInNumber$(s, i)
                pdfAppendLine VAL(arg1), VAL(arg2)
                i = i - 1
                PRINT #default.logfile, "Xl  "; arg1; " "; arg2
              CASE 115 's stroke path
                pdfStrokePath
                PRINT #default.logfile, "Xs  "
              CASE 102 'f fill path
                pdfFillPath
                PRINT #default.logfile, "Xf  "
            END SELECT
          CASE 73 'I Image related commands
            i = i + 1 ' skip the I
            ac = ASC(s, i)
            SELECT CASE ac
              CASE 108 'l Image Load
                i = i + 1 ' skip the l
                arg1 = takeInAlphaNumber$(s, i)
                i = i + 1 ' skip the delimiter
                arg2 = takeInAlphaNumber$(s, i)
                pdfLoadImage arg1, arg2
                i = i - 1
                PRINT #default.logfile, "image load "; arg1; "  "; arg2
              CASE 112 'p Image position xxx,yyy
                i = i + 1 ' skip the p
                arg1 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg2 = takeInNumber$(s, i)
                i = i - 1
                default.me = VAL(arg1)
                default.mf = VAL(arg2)
                PRINT #default.logfile, "image position "; arg1; "  "; arg2
              CASE 115 's Image scale xxx,yyy
                i = i + 1 'skip the s
                arg1 = takeInNumber$(s, i)
                i = i + 1 'skip the delimiter like a comma
                arg2 = takeInNumber$(s, i)
                i = i - 1
                default.ma = VAL(arg1)
                default.md = VAL(arg2)
                PRINT #default.logfile, "image scale "; arg1; "  "; arg2
              CASE 114 'r Image rotate aaa
                i = i + 1 'skip the r
                arg1 = takeInNumber$(s, i)
                i = i - 1
                default.irot = VAL(arg1)
                PRINT #default.logfile, "image rotation "; arg1
              CASE 100 'd draw image
                i = i + 1 ' skip the d
                arg1 = takeInAlphaNumber$(s, i)
                'Push the current graphic state to the stack
                pdfPushGraphicsStack
                'Set the Matrix
                pdfSetImageMatrix default.ma, default.mb, default.mc, default.md, default.me, default.mf
                'Rotate
                pdfRotateImage 0, 0, default.irot
                'Draw the Image "Im1"
                pdfPutImage arg1
                'Return the graphics state
                pdfPopGraphicsStack
                PRINT #default.logfile, "image matrix "; default.ma; " "; default.mb; " "; default.mc; " "; default.md; " "; default.me; " "; default.mf
                PRINT #default.logfile, "image rotate "; default.irot
                PRINT #default.logfile, "image draw "; arg1
            END SELECT
          CASE 77 'M meta related commands
            i = i + 1 ' skip the M
            ac = ASC(s, i)
            i = i + 1 'skip the subcommand
            SELECT CASE ac
              CASE 116 't Title
                arg1 = escapeSeq$(MID$(s, i))
                pdfSetTitle arg1
                PRINT #default.logfile, "Title "; arg1
                i = i - 1
              CASE 97 'a author
                arg1 = escapeSeq$(MID$(s, i))
                pdfSetAuthor arg1
                PRINT #default.logfile, "Author "; arg1
                i = i - 1
              CASE 115 's subject
                arg1 = escapeSeq$(MID$(s, i))
                pdfSetSubject arg1
                PRINT #default.logfile, "Subject "; arg1
                i = i - 1
              CASE 107 'k keywords
                arg1 = escapeSeq$(MID$(s, i))
                pdfSetKeywords arg1
                PRINT #default.logfile, "Keywords "; arg1
                i = i - 1
              CASE 99 'c creator
                arg1 = escapeSeq$(MID$(s, i))
                pdfSetCreator arg1
                PRINT #default.logfile, "Creator "; arg1
                i = i - 1
              CASE 112 'p producer
                arg1 = escapeSeq$(MID$(s, i))
                pdfSetProducer arg1
                PRINT #default.logfile, "Producer "; arg1
                i = i - 1
            END SELECT
        END SELECT
      END IF
    i = i + 1: LOOP UNTIL i > LEN(s)
  END IF
END FUNCTION
'_pdf_E+B#40,740L12FF1,Courier@F1,10

FUNCTION stripWhiteSpace$ (s AS STRING)
  DIM AS STRING ts: ts = ""
  DIM AS LONG i: i = 1: DO
    IF ASC(s, i) <> 32 THEN ts = ts + CHR$(ASC(s, i))
  i = i + 1: LOOP UNTIL i > LEN(s)
  stripWhiteSpace = ts
END FUNCTION

FUNCTION isNumber (s AS STRING) 'Takes in single character
  isNumber = INSTR("0123456789.-", s) > 0
END FUNCTION

FUNCTION isAlpha (s AS STRING) ' Take in single character
  isAlpha = INSTR("abcdefghijklmnopqrstuvwxyz", LCASE$(s)) > 0
END FUNCTION

FUNCTION isDelimiter (s AS STRING) ' Take in single character
  isDelimiter = INSTR(",._" + CHR$(34), s) > 0
END FUNCTION

FUNCTION isAlphaNumeric (s AS STRING)
  isAlphaNumeric = isNumber(s) OR isAlpha(s)
END FUNCTION

FUNCTION takeInNumber$ (s AS STRING, i AS LONG)
  DIM AS LONG n
  DIM AS STRING ts, c
  FOR n = i TO LEN(s)
    c = CHR$(ASC(s, n))
    IF isNumber(c) THEN
      ts = ts + c
    ELSE
      i = n
      takeInNumber = ts
      EXIT FUNCTION
    END IF
  NEXT
  i = n
  takeInNumber = ts
END FUNCTION

FUNCTION takeInAlphaNumber$ (s AS STRING, i AS LONG)
  DIM AS LONG n
  DIM AS STRING ts, c
  FOR n = i TO LEN(s)
    c = CHR$(ASC(s, n))
    IF isAlphaNumeric(c) THEN
      ts = ts + c
    ELSE
      i = n
      takeInAlphaNumber = ts
      EXIT FUNCTION
    END IF
  NEXT
  i = n
  takeInAlphaNumber = ts
END FUNCTION
'_pdf_EG'Documenter.pdf'

