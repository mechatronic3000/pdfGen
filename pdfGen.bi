'Filename : pdfGen.bi

'    :::::::::  :::::::::  :::::::::: ::::::::  :::::::::: ::::    :::
'    :+:    :+: :+:    :+: :+:       :+:    :+: :+:        :+:+:   :+:
'    +:+    +:+ +:+    +:+ +:+       +:+        +:+        :+:+:+  +:+
'    +#++:++#+  +#+    +:+ :#::+::#  :#:        +#++:++#   +#+ +:+ +#+
'    +#+        +#+    +#+ +#+       +#+   +#+# +#+        +#+  +#+#+#
'    #+#        #+#    #+# #+#       #+#    #+# #+#        #+#   #+#+#
'    ###        #########  ###        ########  ########## ###    ####
'

'$DYNAMIC
$INCLUDEONCE
_TITLE "PDFGen"
'------------------------------------------------------------------------
' PDF Generator
'
'------------------------------------------------------------------------
' Operator Reference:
'
' BT - Begins a text object. Initializes the text matrix to the identity matrix.
' ET - Ends a text object. Discards the text matrix.
' charSpace Tc - Set character spacing
' fontname size Tf - Set font and size
' leading TL - Set text leading
' render Tr - Set the text rendering mode
' rise Ts - Set text rise
' wordSpace Tw - Set word spacing
' scale Tz - Set horizontal scaling
' tx ty Td - Moves to the start of the next line, offset from the start of the current line by (tx, ty).
'            tx and ty are numbers expressed in text space units.
' tx ty TD - Moves to the start of the next line, offset from the start of the current line by (tx, ty).
'              [ a b 0 ]
'              [ c d 0 ]
'              [ e f 1 ]
' a b c d e f Tm - Sets the text matrix and sets the current point and line start position to the origin.
'       Translations are specified as [1 0 0 1 tx ty], where tx and ty are the distances to
'        translate the origin of the coordinate system in x and y, respectively.
'       Scaling is obtained by [sx 0 0 sy 0 0]. This scales the coordinates so that one unit
'        in the x and y directions of the new coordinate system is the same size as sx and
'        sy units in the previous coordinate system, respectively.
'       Rotations are carried out by cos (theta) sin (theta) -sin (theta) cos (theta) 0 0 , which has the
'        effect of rotating the coordinate system axes by (theta) degrees counterclockwise.
'       Skew is specified by 1 tan (alpha) tan (beta) 1 0 0 , which skews the x-axis by an
'        angle (alpha) and the y-axis by an angle (beta). (alpha) and (beta) are measured in degrees.
'       In general, to obtain the expected results, transformations should be done in the order: translate, rotate, scale.
'
' T* - Moves to the start of the next line.
' string Tj - Shows text string, using the character and word spacing parameters from the graphics state.
' string ' - Moves to next line and shows text string, using the character and word spacing parameters from the graphics state.
' aw ac string " - Moves to next line and shows text string. aw and ac are numbers expressed in text space units.
' [ number or string ... ] TJ - Shows text string, allowing individual character positioning, and using the charac-
'                               ter and word spacing parameters from the graphics state
'


' Fonts:
'Courier             Symbol
'Courier-Bold        Times-Roman
'Courier-Oblique     Times-Bold
'Courier-BoldOblique Times-Italic
'Helvetica           Times-BoldItalic
'Helvetica-Bold      ZapfDingbats
'Helvetica-Oblique
'Helvetica-BoldOblique
'
'------------------------------------------------------------------------
'
' Text rendering modes
' MODE    DESCRIPTION
'   0       Fill text.
'   1       Stroke text.
'   2       Fill, then stroke text.
'   3       Neither fill nor stroke text (invisible).
'   4       Fill text and add to path for clipping (see above).
'   5       Stroke text and add to path for clipping.
'   6       Fill, then stroke text and add to path for clipping.
'   7       Add text to path for clipping.

'------------------------------------------------------------------------

CONST PDF_COMM_TEXT = 1
CONST PDF_COMM_SET_FONT_SIZE = 2
CONST PDF_COMM_LOADFONT = 3
CONST PDF_COMM_SET_POSITION = 4
CONST PDF_COMM_SET_MATRIX = 5
CONST PDF_COMM_ADD_PAGE = 6
CONST PDF_COMM_BEGIN_TEXT = 7
CONST PDF_COMM_END_TEXT = 8
CONST PDF_COMM_TEXT_RENDER_MODE = 9
CONST PDF_COMM_TEXT_BLOCK = 10
CONST PDF_COMM_STROKE_WIDTH = 11
CONST PDF_COMM_CHARACTER_SPACING = 12
CONST PDF_COMM_WORD_SPACING = 13
CONST PDF_COMM_HORIZONTAL_SCALE = 14
CONST PDF_COMM_TEXT_LEADING = 15
CONST PDF_COMM_TEXT_RISE = 16
CONST PDF_COMM_NEXT_LINE = 17

CONST PDF_COMM_BEGIN_PATH = 18
CONST PDF_COMM_APPEND_LINE = 19
CONST PDF_COMM_APPEND_BEZIER_CURVE_123 = 20
CONST PDF_COMM_APPEND_BEZIER_CURVE_23 = 21
CONST PDF_COMM_APPEND_BEZIER_CURVE_13 = 22
CONST PDF_COMM_CLOSE_PATH = 23
CONST PDF_COMM_RECTANGLE = 24
CONST PDF_COMM_STROKE_PATH = 25
CONST PDF_COMM_CLOSE_AND_STROKE = 26
CONST PDF_COMM_FILL_PATH = 27
CONST PDF_COMM_FILL_EO = 28
CONST PDF_COMM_FILL_STROKE = 29
CONST PDF_COMM_FILL_STROKE_EO = 30
CONST PDF_COMM_CLOSE_FILL_STROKE = 31
CONST PDF_COMM_CLOSE_FILL_STROKE_EO = 32
CONST PDF_COMM_END_PATH = 33

CONST PDF_COMM_SET_COLOR_STROKE = 40
CONST PDF_COMM_SET_COLOR_NONSTROKE = 41
CONST PDF_COMM_GRAYSCALE_STROKE = 42
CONST PDF_COMM_GRAYSCALE_NONSTROKE = 43

CONST PDF_COMM_PUSH_GRAPHIC_STACK = 50
CONST PDF_COMM_POP_GRAPHIC_STACK = 51

CONST PDF_COMM_LOAD_IMAGE = 60
CONST PDF_COMM_SET_IMAGE_MATRIX = 61
CONST PDF_COMM_PUT_IMAGE = 62

CONST PDF_COMM_SET_MEDIA_BOX = 70

CONST PDF_COMM_LINE_CAP_STYLE = 80
CONST PDF_COMM_LINE_JOIN_STYLE = 81
CONST PDF_COMM_LINE_DASH_PATTERN = 82

CONST PDF_VERSION = "1.5"
CONST PDF_BEGIN_TEXT_OPERATOR = "BT"
CONST PDF_END_TEXT_OPERATOR = "ET"

CONST PDF_DEFAULT_FONT_NAME = "F1"
CONST PDF_DEFAULT_FONT = "Times-Roman"
CONST PDF_DEFAULT_FONT_SIZE = 16

CONST PDF_FONT_COURIER = "Courier"
CONST PDF_FONT_COURIER_BOLD = "Courier-Bold"
CONST PDF_FONT_COURIER_OBLIQUE = "Courier-Oblique"
CONST PDF_FONT_COURIER_BOLD_OBLIQUE = "Courier-BoldOblique"
CONST PDF_FONT_HELVETICA = "Helvetica"
CONST PDF_FONT_HELVETICA_BOLD = "Helvetica-Bold"
CONST PDF_FONT_HELVETICA_OBLIQUE = "Helvetica-Oblique"
CONST PDF_FONT_HELVETICA_BOLD_OBLIQUE = "Helvetica-BoldOblique"
CONST PDF_FONT_SYMBOL = "SYMBOL"
CONST PDF_FONT_TIMES_ROMAN = "Times-Roman"
CONST PDF_FONT_TIMES_BOLD = "Times-Bold"
CONST PDF_FONT_TIMES_ITALIC = "Times-Italic"
CONST PDF_FONT_TIMES_BOLD_ITALIC = "Times-BoldItalic"
CONST PDF_FONT_ZAPFDINGBATS = "ZapfDingbats"

CONST PDF_FONT_ENCODING_MAC_ROMAN = "MacRomanEncoding"
CONST PDF_FONT_ENCODING_MAC_EXPERT = "MacExpertEncoding"
CONST PDF_FONT_ENCODING_WIN_ANSI = "WinAnsiEncoding"
CONST PDF_FONT_ENCODING_STANDARD = "StandardEncoding"
CONST PDF_FONT_ENCODING_PDF_DOC = "PDFDocEncoding"

CONST PDF_OBJECT_TYPE_HEADER = 1
CONST PDF_OBJECT_TYPE_OUTLINES = 2
CONST PDF_OBJECT_TYPE_PAGES = 3
CONST PDF_OBJECT_TYPE_PAGE = 4
CONST PDF_OBJECT_TYPE_CONTENT = 5
CONST PDF_OBJECT_TYPE_PROCEDURE = 6
CONST PDF_OBJECT_TYPE_FONT = 7
CONST PDF_OBJECT_TYPE_XREF = 8
CONST PDF_OBJECT_TYPE_XREF_START = 9
CONST PDF_OBJECT_TYPE_EOF = 10
CONST PDF_OBJECT_TYPE_CATALOG = 11
CONST PDF_OBJECT_TYPE_TRAILER = 12
CONST PDF_OBJECT_TYPE_IMAGE = 13
CONST PDF_OBJECT_TYPE_INFO = 14

CONST PDF_PROC_PDF = 1
CONST PDF_PROC_TEXT = 2
CONST PDF_PROC_IMAGEB = 4
CONST PDF_PROC_IMAGEC = 8
CONST PDF_PROC_IMAGEI = 16

'DeviceGray, DeviceRGB, DeviceCMYK
CONST PDF_IMAGE_DEVICE_GRAY = 0
CONST PDF_IMAGE_DEVICE_RGB = 1
CONST PDF_IMAGE_DEVICE_CMYK = 2

CONST PDF_LINE_CAP_BUTT = 0
CONST PDF_LINE_CAP_ROUND = 1
CONST PDF_LINE_CAP_PROJECTING_SQUARE = 2

CONST PDF_LINE_JOIN_MITER = 0
CONST PDF_LINE_JOIN_ROUND = 1
CONST PDF_LINE_JOIN_BEVEL = 2

CONST PDF_RENDER_MODE_FILL = 0
CONST PDF_RENDER_MODE_STROKE = 1
CONST PDF_RENDER_MODE_FILL_STROKE = 2
CONST PDF_RENDER_MODE_INVISIBLE = 3
CONST PDF_RENDER_MODE_FILL_ADD_PATH = 4
CONST PDF_RENDER_MODE_STROKE_ADD_PATH = 5
CONST PDF_RENDER_MODE_FILL_STROKE_ADD_PATH = 6
CONST PDF_RENDER_MODE_ADD_PATH = 7

'------------------------------------------------------------------------
CONST False%% = 0
CONST True%% = NOT False
'------------------------------------------------------------------------
TYPE tCOLORRGB
  red AS SINGLE
  green AS SINGLE
  blue AS SINGLE
END TYPE

TYPE tLINKLIST
  parent AS LONG
  child AS LONG
END TYPE

TYPE tVECl
  x AS LONG
  y AS LONG
END TYPE

TYPE tBOXl
  a AS tVECl
  b AS tVECl
END TYPE

TYPE tMATs
  a AS SINGLE
  b AS SINGLE
  c AS SINGLE
  d AS SINGLE
  e AS SINGLE
  f AS SINGLE
END TYPE

TYPE tPDFCOMMAND
  command AS INTEGER
  s AS STRING
  s1 AS STRING
  argVec1 AS tVECl
  argVec2 AS tVECl
  argVec3 AS tVECl
  argLong1 AS LONG
  argLong2 AS LONG
  argLong3 AS LONG
  argSingle1 AS SINGLE
  argSingle2 AS SINGLE
  argSingle3 AS SINGLE
  mat AS tMATs
END TYPE

TYPE tPDFSTATE
  fileSteam AS STRING
  objectCount AS LONG
  pageCount AS LONG
  imgCount AS LONG
  text AS _BYTE
  font_set AS _BYTE
  font_name AS STRING ' pdf's reference, not the actual font name
  font AS STRING ' actual font name
  font_size AS LONG
  current_page AS LONG ' used during generation
  proc AS _BYTE
END TYPE

TYPE tPDFFONT
  font_name AS STRING ' pdf's reference, not the actual font name
  font AS STRING ' actual font name
  font_size AS LONG
  font_type AS STRING '
  encoding AS STRING
END TYPE

TYPE tPDFPAGE
  object AS LONG
  font AS STRING
  mediaBox AS tBOXl
  cropBox AS tBOXl
  ll AS tLINKLIST ' used for rearranging page ordering
END TYPE

TYPE tPDFIMAGE
  sz AS tVECl
  colorspace AS STRING
  imageDevice AS _UNSIGNED _BYTE
  bbc AS LONG
  length AS LONG
  filter AS STRING
  IMG AS LONG
  nm AS STRING
  obj AS LONG
END TYPE

TYPE tPDFOBJECT
  obtype AS LONG
  objectNumber AS LONG ' may be unnecessary since you could use the index as the number
  generationNumber AS LONG ' usually 0
  objectString AS STRING
  arg1 AS STRING
  arg2 AS STRING
  arg3 AS STRING
  arg4 AS STRING
  byteCount AS LONG
  pageNumber AS LONG
END TYPE

TYPE tPDFTIMEANDDATE
  year AS STRING
  month AS STRING
  day AS STRING
  hour AS STRING
  minute AS STRING
  second AS STRING
  O AS STRING
  HH AS STRING
  mm AS STRING
END TYPE

TYPE tPDFINFO
  title AS STRING
  author AS STRING
  subject AS STRING
  creator AS STRING
  producer AS STRING
  keywords AS STRING
  creationDate AS tPDFTIMEANDDATE
  modDate AS tPDFTIMEANDDATE
END TYPE

TYPE tPDFDEFAULT
  info AS tPDFINFO
  compressedText AS _UNSIGNED _BYTE
  mediaBox AS tBOXl
  cropBox AS tBOXl
  imageDevice AS _BYTE ' grayscale or rgb
  grayScaleCoeff AS tCOLORRGB
  fontEncoding AS STRING
END TYPE

TYPE tPDFVARS
  varName AS STRING
  varValue AS STRING
END TYPE
'------------------------------------------------------------------------
DIM SHARED pdfStates AS tPDFSTATE
DIM SHARED pdfCommand(0) AS tPDFCOMMAND
DIM SHARED pdfFont(0 TO 1) AS tPDFFONT
DIM SHARED pdfImage(0 TO 1) AS tPDFIMAGE
DIM SHARED pdfPage(0 TO 1) AS tPDFPAGE
DIM SHARED pdfObject(0 TO 1) AS tPDFOBJECT
DIM SHARED pdfObjectString(0 TO 20) AS STRING
DIM SHARED pdfDefault AS tPDFDEFAULT
DIM SHARED pdfVars(0) AS tPDFVARS
$IF PDFLOG = TRUE THEN
DIM SHARED pdflogfile AS LONG
$END IF
'------------------------------------------------------------------------
pdfStates.objectCount = 1
pdfStates.font_name = PDF_DEFAULT_FONT
pdfStates.font = PDF_DEFAULT_FONT
pdfStates.font_size = PDF_DEFAULT_FONT_SIZE
pdfStates.proc = PDF_PROC_PDF OR PDF_PROC_TEXT

pdfDefault.mediaBox.a.x = 0
pdfDefault.mediaBox.a.y = 0
pdfDefault.mediaBox.b.x = 612
pdfDefault.mediaBox.b.y = 792

pdfDefault.cropBox.a.x = 0
pdfDefault.cropBox.a.y = 0
pdfDefault.cropBox.b.x = 612
pdfDefault.cropBox.b.y = 792

pdfDefault.fontEncoding = PDF_FONT_ENCODING_PDF_DOC

'Compress and text
pdfDefault.compressedText = True

'Grayscale or RGB, maybe more later
pdfDefault.imageDevice = PDF_IMAGE_DEVICE_RGB

'These should add up to 1.0 or close
pdfDefault.grayScaleCoeff.red = 0.2989
pdfDefault.grayScaleCoeff.green = 0.5870
pdfDefault.grayScaleCoeff.blue = 0.1140

pdfDefault.info.title = "Untitled"
pdfDefault.info.author = "Unknown"
pdfDefault.info.subject = "Unknown"
pdfDefault.info.keywords = "Unknown"
pdfDefault.info.creator = "PDFGen"
pdfDefault.info.producer = "Unknown"
pdfDefault.info.creationDate.O = "Z"
pdfDefault.info.creationDate.HH = "00"
pdfDefault.info.creationDate.mm = "00"
pdfDefault.info.modDate.O = "Z"
pdfDefault.info.modDate.HH = "00"
pdfDefault.info.modDate.mm = "00"

pdfObjectString(1) = "Header"
pdfObjectString(2) = "Outlines"
pdfObjectString(3) = "Pages"
pdfObjectString(4) = "Page"
pdfObjectString(5) = "Content"
pdfObjectString(6) = "Procedure"
pdfObjectString(7) = "Font"
pdfObjectString(8) = "XREF"
pdfObjectString(9) = "XREF_START"
pdfObjectString(10) = "EOL"
pdfObjectString(11) = "Catalog"
pdfObjectString(12) = "Trailer"

'------------------------------------------------------------------------
$IF PDFLOG = TRUE THEN
pdflogfile = FREEFILE
OPEN "pdfGenLog.txt" FOR OUTPUT AS #pdflogfile
$END IF

