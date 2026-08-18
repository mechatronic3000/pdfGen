'    :::    :::  ::::::::  :::        ::::::::::: :::::::::      :::   :::   :::
'    :+:    :+: :+:    :+: :+:            :+:     :+:    :+:   :+: :+: :+:   :+:
'    +:+    +:+ +:+    +:+ +:+            +:+     +:+    +:+  +:+   +:+ +:+ +:+
'    +#++:++#++ +#+    +:+ +#+            +#+     +#+    +:+ +#++:++#++: +#++:
'    +#+    +#+ +#+    +#+ +#+            +#+     +#+    +#+ +#+     +#+  +#+
'    #+#    #+# #+#    #+# #+#            #+#     #+#    #+# #+#     #+#  #+#
'    ###    ###  ########  ########## ########### #########  ###     ###  ###
'
'
'    ::::    ::::      :::     ::::::::: :::::::::: ::::::::
'    +:+:+: :+:+:+   :+: :+:        :+:  :+:       :+:    :+:
'    +:+ +:+:+ +:+  +:+   +:+      +:+   +:+       +:+
'    +#+  +:+  +#+ +#++:++#++:    +#+    +#++:++#  +#++:++#++
'    +#+       +#+ +#+     +#+   +#+     +#+              +#+
'    #+#       #+# #+#     #+#  #+#      #+#       #+#    #+#
'    ###       ### ###     ### ######### ########## ########

'$CONSOLE:ONLY
$LET PDFLOG = FALSE
'$INCLUDE:'pdfGen.bi'

TYPE tVECTOR_LONG
  x AS LONG
  y AS LONG
END TYPE

TYPE tMAP
  cell AS LONG
  path AS LONG
END TYPE

CONST SEED = 8765309

main

'$INCLUDE:'pdfGen.bm'

SUB main
  REDIM map(102, 102) AS tMAP
  DIM AS tVECTOR_LONG ps, sz, st, ed
  DIM AS LONG scale, res, pageCount
  DIM AS STRING fl, title, solTitle
  ps.x = 55: ps.y = 120
  sz.x = UBOUND(map, 1): sz.y = UBOUND(map, 2)
  scale = 5
  pdfSetTitle "Holiday Maze"
  pdfSetSubject "Holiday Mazes"
  pdfSetAuthor "Justsomeguy"
  pdfSetKeywords "PDF, Mazes, Black Smithing, Oral Hygiene, QB64pe, Holidays"
  pdfSetCreator "pdfGen and QB64pe"
  pdfSetProducer "What does a producer even do?"

  'Only the built in fonts work.
  pdfLoadFont "F1", PDF_FONT_COURIER
  pdfLoadFont "F2", PDF_FONT_COURIER_BOLD
  pdfLoadFont "F3", PDF_FONT_ZAPFDINGBATS

  '     ::::::::   ::::::::  :::     ::: :::::::::: :::::::::
  '    :+:    :+: :+:    :+: :+:     :+: :+:        :+:    :+:
  '    +:+        +:+    +:+ +:+     +:+ +:+        +:+    +:+
  '    +#+        +#+    +:+ +#+     +:+ +#++:++#   +#++:++#:
  '    +#+        +#+    +#+  +#+   +#+  +#+        +#+    +#+
  '    #+#    #+# #+#    #+#   #+#+#+#   #+#        #+#    #+#
  '     ########   ########      ###     ########## ###    ###
  '    :::::::::     :::      ::::::::  ::::::::::
  '    :+:    :+:  :+: :+:   :+:    :+: :+:
  '    +:+    +:+ +:+   +:+  +:+        +:+
  '    +#++:++#+ +#++:++#++: :#:        +#++:++#
  '    +#+       +#+     +#+ +#+   +#+# +#+
  '    #+#       #+#     #+# #+#    #+# #+#
  '    ###       ###     ###  ########  ##########

  pdfAddPage ' Book cover
  '~Draw and fill a fancy box~

  'Set the width of the edge of the box
  pdfSetStrokeWidth 10
  'Set the color to black 0.0 - 1.0, 0.0 is Black, 1.0 is White
  pdfSetColorStroke 0, 0, 0
  'Set the fill color
  pdfSetColorNonStroke 0.0, .60, 0.0
  'Lay down path for the rectangle
  pdfRectangle 20, 20, 572, 752
  'Perform the fill
  pdfFillPath
  'Draw it again
  pdfRectangle 20, 20, 572, 752
  'Draw the Border
  pdfStrokePath
  'Return the Stroke width back to 1
  pdfSetStrokeWidth 1
  'Color back to black
  pdfSetColorNonStroke 0, 0, 0

  'Add Title Text
  pdfBeginText
  pdfSetFontSize "F2", 12
  pdfSetPosition 70, 650
  pdfSetLeading 11
  pdfSetCharacterSpacing -1
  pdfSetColorNonStroke 0.8, 0.0, 0.0
  'pdfAddText "Holiday"
  pdfAddText "                                                                         "
  pdfNextLine
  pdfAddText "     #####    ##          ###               ##                           "
  pdfNextLine
  pdfAddText "  ######  /  #### /        ###    #          ##                          "
  pdfNextLine
  pdfAddText " /#   /  /   ####/          ##   ###         ##                          "
  pdfNextLine
  pdfAddText "/    /  /    # #            ##    #          ##                          "
  pdfNextLine
  pdfAddText "    /  /     #              ##               ##                          "
  pdfNextLine
  pdfAddText "   ## ##     #      /###    ##  ###      ### ##    /###   ##   ####      "
  pdfNextLine
  pdfAddText "   ## ##     #     / ###  / ##   ###    ######### / ###  / ##    ###  /  "
  pdfNextLine
  pdfAddText "   ## ########    /   ###/  ##    ##   ##   #### /   ###/  ##     ###/   "
  pdfNextLine
  pdfAddText "   ## ##     #   ##    ##   ##    ##   ##    ## ##    ##   ##      ##    "
  pdfNextLine
  pdfAddText "   ## ##     ##  ##    ##   ##    ##   ##    ## ##    ##   ##      ##    "
  pdfNextLine
  pdfAddText "   #  ##     ##  ##    ##   ##    ##   ##    ## ##    ##   ##      ##    "
  pdfNextLine
  pdfAddText "      /       ## ##    ##   ##    ##   ##    ## ##    ##   ##      ##    "
  pdfNextLine
  pdfAddText "  /##/        ## ##    ##   ##    ##   ##    /# ##    /#   ##      ##    "
  pdfNextLine
  pdfAddText " /  #####      ## ######    ### / ### / ####/    ####/ ##   #########    "
  pdfNextLine
  pdfAddText "/     ##           ####      ##/   ##/   ###      ###   ##    #### ###   "
  pdfNextLine
  pdfAddText "#                                                                   ###  "
  pdfNextLine
  pdfAddText " ##                                                          #####   ### "
  pdfNextLine
  pdfAddText "                                                           /#######  /#  "
  pdfNextLine
  pdfAddText "                                                          /      ###/    "
  pdfNextLine
  pdfAddText "                                                                         "
  pdfNextLine
  pdfAddText "        #####   ##    ##                                                 "
  pdfNextLine
  pdfAddText "     ######  /#### #####                                                 "
  pdfNextLine
  pdfAddText "    /#   /  /  ##### #####                                               "
  pdfNextLine
  pdfAddText "   /    /  /   # ##  # ##                                                "
  pdfNextLine
  pdfAddText "       /  /    #     #                                                   "
  pdfNextLine
  pdfAddText "      ## ##    #     #      /###     ######      /##       /###          "
  pdfNextLine
  pdfAddText "      ## ##    #     #     / ###  / /#######    / ###     / #### /       "
  pdfNextLine
  pdfAddText "      ## ##    #     #    /   ###/ /      ##   /   ###   ##  ###/        "
  pdfNextLine
  pdfAddText "      ## ##    #     #   ##    ##         /   ##    ### ####             "
  pdfNextLine
  pdfAddText "      ## ##    #     ##  ##    ##        /    ########    ###            "
  pdfNextLine
  pdfAddText "      #  ##    #     ##  ##    ##       ###   #######       ###          "
  pdfNextLine
  pdfAddText "         /     #      ## ##    ##        ###  ##              ###        "
  pdfNextLine
  pdfAddText "     /##/      #      ## ##    /#         ### ####    /  /###  ##        "
  pdfNextLine
  pdfAddText "    /  #####           ## ####/ ##         ##  ######/  / #### /         "
  pdfNextLine
  pdfAddText "   /     ##                ###   ##        ##   #####      ###/          "
  pdfNextLine
  pdfAddText "   #                                       /                             "
  pdfNextLine
  pdfAddText "    ##                                    /                              "
  pdfNextLine
  pdfAddText "                                         /                               "
  pdfNextLine
  pdfAddText "                                        /                                "
  pdfSetCharacterSpacing 0
  pdfSetColorNonStroke 0.0, 0.0, 0.0
  pdfEndText


  pdfBeginText
  pdfSetFontSize "F2", 36
  pdfSetPosition 150, 100
  pdfAddText "by Justsomeguy"
  pdfEndText
  '    :::    :::  ::::::::  :::        ::::::::::: :::::::::      :::   :::   :::
  '    :+:    :+: :+:    :+: :+:            :+:     :+:    :+:   :+: :+: :+:   :+:
  '    +:+    +:+ +:+    +:+ +:+            +:+     +:+    +:+  +:+   +:+ +:+ +:+
  '    +#++:++#++ +#+    +:+ +#+            +#+     +#+    +:+ +#++:++#++: +#++:
  '    +#+    +#+ +#+    +#+ +#+            +#+     +#+    +#+ +#+     +#+  +#+
  '    #+#    #+# #+#    #+# #+#            #+#     #+#    #+# #+#     #+#  #+#
  '    ###    ###  ########  ########## ########### #########  ###     ###  ###


  '    ::::    ::::      :::     ::::::::: :::::::::: ::::::::
  '    +:+:+: :+:+:+   :+: :+:        :+:  :+:       :+:    :+:
  '    +:+ +:+:+ +:+  +:+   +:+      +:+   +:+       +:+
  '    +#+  +:+  +#+ +#++:++#++:    +#+    +#++:++#  +#++:++#++
  '    +#+       +#+ +#+     +#+   +#+     +#+              +#+
  '    #+#       #+# #+#     #+#  #+#      #+#       #+#    #+#
  '    ###       ### ###     ### ######### ########## ########
  PRINT "Warning: This program takes a long time to run (possibly hours)."
  READ pageCount
  FOR i = 1 TO pageCount
    PRINT "Maze:"; i
    'Always add a page first,or else what are going to draw to.
    pdfAddPage
    'Begin a Text Block, only do text stuff here
    pdfBeginText
    'Set font "F2" to size 10
    pdfSetFontSize "F2", 10
    pdfEndText

    pdfBeginText
    READ fl, st.x, st.y, ed.x, ed.y, title, solTitle
    generateMaze map(), SEED, fl, st.x, st.y
    PRINT "Maze Generated."
    PRINT "Building Maze PDF."
    drawMaze map(), ps.x, ps.y, scale

    pdfEndText

    pdfBeginText
    pdfSetFontSize "F2", 10
    pdfSetColorNonStroke 1, 0, 0
    pdfSetPosition ps.x + ((st.x - 1) * scale) + (scale / 2), ps.y + ((st.y - 1) * scale) + (scale / 2)
    pdfAddText "S"
    pdfEndText

    pdfBeginText
    pdfSetPosition ((ed.x - 1) * scale) + ps.x + (scale / 2), ((ed.y - 1) * scale) + ps.y + (scale / 2)
    pdfAddText "F"
    pdfEndText

    pdfBeginText
    pdfSetColorNonStroke 0, 0, 0
    pdfSetFontSize "F2", 30
    pdfSetPosition 306 - txtOffset(title, 20), 720
    pdfAddText title
    pdfEndText

    '     ::::::::   ::::::::  :::    :::     ::: :::::::::: :::::::::
    '    :+:    :+: :+:    :+: :+:    :+:     :+: :+:        :+:    :+:
    '    +:+        +:+    +:+ +:+    +:+     +:+ +:+        +:+    +:+
    '    +#++:++#++ +#+    +:+ +#+    +#+     +:+ +#++:++#   +#+    +:+
    '           +#+ +#+    +#+ +#+     +#+   +#+  +#+        +#+    +#+
    '    #+#    #+# #+#    #+# #+#      #+#+#+#   #+#        #+#    #+#
    '     ########   ########  ########## ###     ########## #########

    'Always add a page first,or else what are going to draw to.
    pdfAddPage
    'Begin a Text Block, only do text stuff here
    pdfBeginText
    'Set font "F2" to size 10
    pdfSetFontSize "F2", 10
    pdfEndText

    pdfBeginText
    PRINT "Begining Solver."
    res = mazeSolver(map(), st.x, st.y, ed.x, ed.y)
    PRINT "Maze Solved."
    PRINT "Building Solved Maze PDF."
    drawMaze map(), ps.x, ps.y, scale

    pdfEndText

    pdfBeginText
    pdfSetFontSize "F2", 10
    pdfSetColorNonStroke 1, 0, 0
    pdfSetPosition ps.x + ((st.x - 1) * scale) + (scale / 2), ps.y + ((st.y - 1) * scale) + (scale / 2)
    pdfAddText "S"
    pdfEndText

    pdfBeginText
    pdfSetPosition ((ed.x - 1) * scale) + ps.x + (scale / 2), ((ed.y - 1) * scale) + ps.y + (scale / 2)
    pdfAddText "F"
    pdfEndText

    pdfBeginText
    pdfSetFontSize "F2", 30
    pdfSetColorNonStroke 0, 0, 0
    pdfSetPosition 306 - txtOffset(solTitle, 20), 720
    pdfAddText solTitle
    pdfEndText
  NEXT

  pdfAddPage ' Book cover
  '~Draw and fill a fancy box~

  'Set the width of the edge of the box
  pdfSetStrokeWidth 10
  'Set the color to black 0.0 - 1.0, 0.0 is Black, 1.0 is White
  pdfSetColorStroke 0, 0, 0
  'Set the fill color
  pdfSetColorNonStroke 0, .60, .0
  'Lay down path for the rectangle
  pdfRectangle 20, 20, 572, 752
  'Perform the fill
  pdfFillPath
  'Draw it again
  pdfRectangle 20, 20, 572, 752
  'Draw the Border
  pdfStrokePath
  'Return the Stroke width back to 1
  pdfSetStrokeWidth 1
  'Color back to black
  pdfSetColorNonStroke 0, 0, 0


  pdfBeginText
  pdfSetFontSize "F2", 56
  pdfSetLeading 58
  pdfSetPosition 80, 400
  pdfSetColorNonStroke 0.8, 0.0, 0.0
  pdfAddText "Holiday Mazes"
  pdfNextLine
  pdfAddText "   for fun!"
  pdfSetColorNonStroke 0.0, 0.0, 0.0
  pdfEndText

  PRINT "pdfGen"
  pdfGen "pdfMaze.pdf"

  SYSTEM
  DATA 9
  DATA "media/Turkey.png",5,51,95,91,"Turkey Maze","Turkey Maze Solution"
  DATA "media/sleigh.png",1,101,91,61,"Sleigh Maze","Sleigh Maze Solution"
  DATA "media/ChristmasTree.png",51,7,51,97,"Christmas Tree Maze","Christmas Tree Maze Solution"
  DATA "media/SantaHat.png",51,7,51,97,"Santa Hat Maze","Santa Hat Maze Solution"
  DATA "media/Stocking.png",5,97,95,21,"Stocking Maze","Stocking Maze Solution"
  DATA "media/Bell.png",51,93,51,7,"Bell Maze","Bell Maze Solution"
  DATA "media/CandyCane.png",17,59,91,7,"Candy Cane Maze","Candy Cane Maze Solution"
  DATA "media/GingerBreadman.png",51,91,31,9,"Gingerbread Man Maze","Gingerbread Man Maze Solution"
  DATA "media/Present.png",31,93,51,7,"Present Maze","Present Maze Solution"
END SUB

FUNCTION txtOffset (s AS STRING, w AS LONG)
  txtOffset = (LEN(s) * w) / 2
END FUNCTION


SUB drawMaze (map() AS tMAP, xp AS LONG, yp AS LONG, scale AS LONG)
  DIM AS LONG x, y, maze_size_x, maze_size_y, count, mcount, p
  maze_size_x = UBOUND(map, 1)
  maze_size_y = UBOUND(map, 2)
  mcount = maze_size_x * maze_size_y
  p = CSRLIN
  FOR y = 0 TO maze_size_y
    FOR x = 0 TO maze_size_x
      LOCATE p
      count = y * maze_size_y + x
      PRINT USING "Cell ###### out of ######. "; count, mcount
      pdfSetLineCapStyle PDF_LINE_CAP_ROUND
      pdfSetStrokeWidth 1

      IF map(x, y).cell = 1 THEN
        IF x > 0 THEN
          IF map(x - 1, y).cell = 1 THEN
            pdfBeginPath (x * scale) + xp, (y * scale) + yp
            pdfAppendLine ((x - 1) * scale) + xp, (y * scale) + yp
            pdfStrokePath
          END IF
        END IF
        IF x < maze_size_x THEN
          IF map(x + 1, y).cell = 1 THEN
            pdfBeginPath (x * scale) + xp, (y * scale) + yp
            pdfAppendLine ((x + 1) * scale) + xp, (y * scale) + yp
            pdfStrokePath
          END IF
        END IF
        IF y > 0 THEN
          IF map(x, y - 1).cell = 1 THEN
            pdfBeginPath (x * scale) + xp, (y * scale) + yp
            pdfAppendLine (x * scale) + xp, ((y - 1) * scale) + yp
            pdfStrokePath
          END IF
        END IF
        IF y < maze_size_y THEN
          IF map(x, y + 1).cell = 1 THEN
            pdfBeginPath (x * scale) + xp, (y * scale) + yp
            pdfAppendLine (x * scale) + xp, ((y + 1) * scale) + yp
            pdfStrokePath
          END IF
        END IF
      ELSE IF map(x, y).cell < 0 THEN
          IF x > 0 THEN
            pdfSetColorStroke 0, 1, 0
            pdfSetStrokeWidth 2
            pdfSetLineCapStyle PDF_LINE_CAP_ROUND
            IF map(x - 1, y).cell < 0 THEN
              pdfBeginPath (x * scale) + xp, (y * scale) + yp
              pdfAppendLine ((x - 1) * scale) + xp, (y * scale) + yp
              pdfStrokePath
            END IF
          END IF
          IF x < maze_size_x THEN
            IF map(x + 1, y).cell < 0 THEN
              pdfBeginPath (x * scale) + xp, (y * scale) + yp
              pdfAppendLine ((x + 1) * scale) + xp, (y * scale) + yp
              pdfStrokePath
            END IF
          END IF
          IF y > 0 THEN
            IF map(x, y - 1).cell < 0 THEN
              pdfBeginPath (x * scale) + xp, (y * scale) + yp
              pdfAppendLine (x * scale) + xp, ((y - 1) * scale) + yp
              pdfStrokePath
            END IF
          END IF
          IF y > maze_size_y THEN
            IF map(x, y + 1).cell < 0 THEN
              pdfBeginPath (x * scale) + xp, (y * scale) + yp
              pdfAppendLine (x * scale) + xp, ((y + 1) * scale) + yp
              pdfStrokePath
            END IF
          END IF
          pdfSetColorStroke 0, 0, 0
          pdfSetStrokeWidth 1
        END IF
      END IF
    NEXT
  NEXT
END SUB

SUB generateMaze (map() AS tMAP, seed AS LONG, fl AS STRING, xs AS LONG, ys AS LONG)
  DIM AS LONG x, y, maze_size_x, maze_size_y
  DIM AS LONG checkedUp, checkedDown, checkedLeft, checkedRight, cellOk, direction
  maze_size_x = UBOUND(map, 1)
  maze_size_y = UBOUND(map, 2)
  DIM stack((maze_size_x / 2) * (maze_size_y / 2)) AS tVECTOR_LONG
  DIM stackPointer AS LONG
  DIM cell AS tVECTOR_LONG

  'prepare Cells
  FOR x = 0 TO maze_size_x
    FOR y = 0 TO maze_size_y
      IF x >= 0 AND y >= 0 AND x <= maze_size_x AND y <= maze_size_y THEN
        map(x, y).cell = 2 'unvisited cell
      END IF
    NEXT
  NEXT

  FOR x = 0 TO maze_size_x STEP 2
    FOR y = 0 TO maze_size_y
      IF x >= 0 AND y >= 0 AND x <= maze_size_x AND y <= maze_size_y THEN
        map(x, y).cell = 1 'plain cell
      END IF
    NEXT
  NEXT

  FOR x = 0 TO maze_size_x
    FOR y = 0 TO maze_size_y STEP 2
      IF x >= 0 AND y >= 0 AND x <= maze_size_x AND y <= maze_size_y THEN
        map(x, y).cell = 1 'plain cell
      END IF
    NEXT
  NEXT

  RANDOMIZE seed

  imageDeRes fl, map()
  'Start of Maze Generator

  cell.x = xs
  cell.y = ys

  map(cell.x, cell.y).cell = 0
  stackPointer = 0

  DO
    checkedUp = 0
    checkedDown = 0
    checkedLeft = 0
    checkedRight = 0

    DO
      cellOk = 1
      direction = INT(RND * 4) ' Pick a direction at random
      SELECT CASE direction
        CASE 0:
          checkedLeft = 1
          IF cell.x - 2 < 0 THEN 'check if not at maps edge
            cellOk = 0
          ELSEIF map(cell.x - 2, cell.y).cell <> 2 THEN 'check if it has been visited
            cellOk = 0
          END IF
        CASE 1:
          checkedUp = 1
          IF cell.y - 2 < 0 THEN 'check if not at maps edge
            cellOk = 0
          ELSEIF map(cell.x, cell.y - 2).cell <> 2 THEN 'check if it has been visited
            cellOk = 0
          END IF
        CASE 2:
          checkedRight = 1
          IF cell.x + 2 > maze_size_x THEN 'check if not at maps edge
            cellOk = 0
          ELSEIF map(cell.x + 2, cell.y).cell <> 2 THEN 'check if it has been visited
            cellOk = 0
          END IF
        CASE 3:
          checkedDown = 1
          IF cell.y + 2 > maze_size_y THEN 'check if not at maps edge
            cellOk = 0
          ELSEIF map(cell.x, cell.y + 2).cell <> 2 THEN 'check if it has been visited
            cellOk = 0
          END IF
      END SELECT
    LOOP UNTIL cellOk OR (checkedLeft AND checkedRight AND checkedUp AND checkedDown)

    IF cellOk THEN
      SELECT CASE direction
        CASE 0:
          cell.x = cell.x - 1
          map(cell.x, cell.y).cell = 0
          cell.x = cell.x - 1
          map(cell.x, cell.y).cell = 0
        CASE 1:
          cell.y = cell.y - 1
          map(cell.x, cell.y).cell = 0
          cell.y = cell.y - 1
          map(cell.x, cell.y).cell = 0
        CASE 2:
          cell.x = cell.x + 1
          map(cell.x, cell.y).cell = 0
          cell.x = cell.x + 1
          map(cell.x, cell.y).cell = 0
        CASE 3:
          cell.y = cell.y + 1
          map(cell.x, cell.y).cell = 0
          cell.y = cell.y + 1
          map(cell.x, cell.y).cell = 0
      END SELECT
      stack(stackPointer).x = cell.x
      stack(stackPointer).y = cell.y
      stackPointer = stackPointer + 1
    ELSE
      stackPointer = stackPointer - 1
      IF stackPointer < 0 THEN EXIT DO
      cell.x = stack(stackPointer).x
      cell.y = stack(stackPointer).y
    END IF
  LOOP UNTIL stackPointer < 1
END SUB

FUNCTION mazeSolver (map() AS tMAP, xStart AS LONG, yStart AS LONG, xFinish AS LONG, yFinish AS LONG)
  DIM AS LONG maze_size_x, maze_size_y
  DIM AS LONG checkedUp, checkedDown, checkedLeft, checkedRight, direction
  DIM AS SINGLE tmr: tmr = TIMER

  maze_size_x = UBOUND(map, 1)
  maze_size_y = UBOUND(map, 2)

  DIM stack((maze_size_x) * (maze_size_y)) AS tVECTOR_LONG
  DIM stackPointer AS LONG
  DIM AS tVECTOR_LONG cell, vec

  cell.x = xStart
  cell.y = yStart

  DIM AS LONG nosolution, solved, pathCount, pcMax

  nosolution = 0
  solved = 0

  stack(stackPointer) = cell

  stackPointer = stackPointer + 1
  pathCount = 2

  map(cell.x, cell.y).cell = pathCount

  DO
    DO WHILE nosolution = 0 AND stackPointer > 0 AND solved = 0
      checkedUp = 0
      checkedDown = 0
      checkedLeft = 0
      checkedRight = 0

      nosolution = 0

      IF direction = 0 THEN 'down
        IF map(cell.x, cell.y + 1).cell = 0 THEN
          cell.y = cell.y + 1
          map(cell.x, cell.y).cell = pathCount
          'check left
          IF map(cell.x - 1, cell.y).cell = 0 THEN
            stack(stackPointer).x = cell.x - 1
            stack(stackPointer).y = cell.y
            stackPointer = stackPointer + 1
          END IF
          'check Right
          IF map(cell.x + 1, cell.y).cell = 0 THEN
            stack(stackPointer).x = cell.x + 1
            stack(stackPointer).y = cell.y
            stackPointer = stackPointer + 1
          END IF
        ELSE
          checkedDown = 1
          direction = direction + 1
        END IF
      END IF

      IF direction = 1 THEN 'right
        IF map(cell.x + 1, cell.y).cell = 0 THEN
          cell.x = cell.x + 1
          map(cell.x, cell.y).cell = pathCount
          'check down
          IF map(cell.x, cell.y + 1).cell = 0 THEN
            stack(stackPointer).x = cell.x
            stack(stackPointer).y = cell.y + 1
            stackPointer = stackPointer + 1
          END IF
          'check up
          IF map(cell.x, cell.y - 1).cell = 0 THEN
            stack(stackPointer).x = cell.x
            stack(stackPointer).y = cell.y - 1
            stackPointer = stackPointer + 1
          END IF
        ELSE
          checkedRight = 1
          direction = direction + 1
        END IF
      END IF

      IF direction = 2 THEN 'up
        IF map(cell.x, cell.y - 1).cell = 0 THEN
          cell.y = cell.y - 1
          map(cell.x, cell.y).cell = pathCount
          IF map(cell.x - 1, cell.y).cell = 0 THEN
            stack(stackPointer).x = cell.x - 1
            stack(stackPointer).y = cell.y
            stackPointer = stackPointer + 1
          END IF
          IF map(cell.x + 1, cell.y).cell = 0 THEN
            stack(stackPointer).x = cell.x + 1
            stack(stackPointer).y = cell.y
            stackPointer = stackPointer + 1
          END IF
        ELSE
          checkedUp = 1
          direction = direction + 1
        END IF
      END IF

      IF direction = 3 THEN 'left
        IF map(cell.x - 1, cell.y).cell = 0 THEN
          cell.x = cell.x - 1
          map(cell.x, cell.y).cell = pathCount
          IF map(cell.x, cell.y + 1).cell = 0 THEN
            stack(stackPointer).x = cell.x
            stack(stackPointer).y = cell.y + 1
            stackPointer = stackPointer + 1
          END IF
          IF map(cell.x, cell.y - 1).cell = 0 THEN
            stack(stackPointer).x = cell.x
            stack(stackPointer).y = cell.y - 1
            stackPointer = stackPointer + 1
          END IF
        ELSE
          checkedLeft = 1
          direction = direction + 1
        END IF
      END IF

      IF direction > 3 THEN direction = 0

      IF checkedUp = 1 AND checkedLeft = 1 AND checkedRight = 1 AND checkedDown = 1 THEN
        nosolution = 1
      END IF
      IF cell.x = xFinish AND cell.y = yFinish THEN solved = 1
    LOOP

    stackPointer = stackPointer - 1

    cell = stack(stackPointer)
    pathCount = pathCount + 1
    map(cell.x, cell.y).cell = pathCount

    nosolution = 0
  LOOP WHILE stackPointer > 0

  cell.x = xStart
  cell.y = yStart

  map(cell.x, cell.y).cell = 0

  'Remove paths that don't lead to the End
  DO
    pcMax = 0
    vec.x = 0
    vec.y = 0
    IF cell.x < maze_size_x - 1 THEN
      IF map(cell.x + 1, cell.y).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x + 2, cell.y).cell = pcMax THEN
          pcMax = map(cell.x + 2, cell.y).cell
          vec.x = 1
          vec.y = 0
        END IF
      END IF
    END IF
    IF cell.x > 1 THEN
      IF map(cell.x - 1, cell.y).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x - 2, cell.y).cell = pcMax THEN
          pcMax = map(cell.x - 2, cell.y).cell
          vec.x = -1
          vec.y = 0
        END IF
      END IF
    END IF
    IF cell.y > 1 THEN
      IF map(cell.x, cell.y - 1).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x, cell.y - 2).cell = pcMax THEN
          pcMax = map(cell.x, cell.y - 2).cell
          vec.x = 0
          vec.y = -1
        END IF
      END IF
    END IF
    IF cell.y < maze_size_y - 1 THEN
      IF map(cell.x, cell.y + 1).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x, cell.y + 2).cell = pcMax THEN
          pcMax = map(cell.x, cell.y + 2).cell
          vec.x = 0
          vec.y = 1
        END IF
      END IF
    END IF
    IF cell.x < maze_size_x - 1 THEN
      IF map(cell.x + 1, cell.y).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x + 2, cell.y).cell > pcMax THEN
          pcMax = map(cell.x + 2, cell.y).cell
          vec.x = 1
          vec.y = 0
        END IF
      END IF
    END IF
    IF cell.x > 1 THEN
      IF map(cell.x - 1, cell.y).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x - 2, cell.y).cell > pcMax THEN
          pcMax = map(cell.x - 2, cell.y).cell
          vec.x = -1
          vec.y = 0
        END IF
      END IF
    END IF
    IF cell.y > 1 THEN
      IF map(cell.x, cell.y - 1).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x, cell.y - 2).cell > pcMax THEN
          pcMax = map(cell.x, cell.y - 2).cell
          vec.x = 0
          vec.y = -1
        END IF
      END IF
    END IF
    IF cell.y < maze_size_y - 1 THEN
      IF map(cell.x, cell.y + 1).cell <> 1 THEN 'Check if wall is there
        IF map(cell.x, cell.y + 2).cell > pcMax THEN
          pcMax = map(cell.x, cell.y + 2).cell
          vec.x = 0
          vec.y = 1
        END IF
      END IF
    END IF

    'Check if Maze is solved
    IF cell.x = xFinish AND cell.y = yFinish THEN
      map(cell.x, cell.y).cell = 0
      mazeSolver = -1
      EXIT DO
    END IF
    'time out if maze can't be solved
    IF TIMER > tmr + 10 THEN
      mazeSolver = 0
      EXIT DO
    END IF

    cell.x = cell.x + vec.x
    cell.y = cell.y + vec.y
    map(cell.x, cell.y).cell = -1

    cell.x = cell.x + vec.x
    cell.y = cell.y + vec.y
    map(cell.x, cell.y).cell = -1
  LOOP
END FUNCTION

SUB imageDeRes (file AS STRING, map() AS tMAP)
  DIM AS LONG maze_size_x, maze_size_y, img, imgX, imgY, iX, iY, iXm, iYm
  maze_size_x = UBOUND(map, 1)
  maze_size_y = UBOUND(map, 2)
  DIM AS _INTEGER64 temp(maze_size_x, maze_size_y), temp2(maze_size_x, maze_size_y), min, max, avg
  img = _LOADIMAGE(file, 32)
  IF img < -1 THEN
    imgX = _WIDTH(img)
    imgY = _HEIGHT(img)
    _SOURCE img
    iXm = INT(imgX / maze_size_x)
    iYm = INT(imgY / maze_size_y)
    FOR iY = 0 TO imgY
      FOR iX = 0 TO imgX
        temp(INT(iX / iXm), INT(iY / iYm)) = temp(INT(iX / iXm), INT(iY / iYm)) + _RED32(POINT(iX, imgY - iY))
      NEXT
    NEXT

    min = 999999999
    max = 0

    FOR iY = 0 TO maze_size_y
      FOR iX = 0 TO maze_size_x
        IF temp(iX, iY) < min THEN min = temp(iX, iY)
        IF temp(iX, iY) >= max THEN max = temp(iX, iY)
      NEXT
    NEXT

    avg = (min + max) / 2.0

    FOR iY = 0 TO maze_size_y
      FOR iX = 0 TO maze_size_x
        IF temp(iX, iY) > avg THEN
          temp2(iX, iY) = 1
        ELSE
          temp2(iX, iY) = 0
        END IF
      NEXT
    NEXT

    FOR iY = 0 TO maze_size_y
      FOR iX = 0 TO maze_size_x
        IF temp2(iX, iY) = 0 THEN
          map(iX, iY).cell = 0
        ELSE
          IF temp2(iX, iY) > 1 THEN
            map(iX, iY).cell = 1
          END IF
        END IF
      NEXT
    NEXT

    FOR iY = 0 TO maze_size_y
      FOR iX = 0 TO maze_size_x
        IF map(iX, iY).cell = 2 THEN
          FOR iYm = -1 TO 1
            FOR iXm = -1 TO 1
              IF iX + iXm >= 0 AND iX + iXm <= maze_size_x AND iY + iYm >= 0 AND iY + iYm <= maze_size_y THEN
                IF map(iX + iXm, iY + iYm).cell = 0 THEN map(iX + iXm, iY + iYm).cell = 1
              END IF
            NEXT
          NEXT
        END IF
      NEXT
    NEXT

  END IF
END SUB
