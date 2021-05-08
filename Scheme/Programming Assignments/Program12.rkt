;game state 
(define RELGameState 0)

;function 1
(define (RELStartGame)
    (set! RELGameState '("X"(0 0 0 0 0 0 0)
                            (0 0 0 0 0 0 0)
                            (0 0 0 0 0 0 0)
                            (0 0 0 0 0 0 0)
                            (0 0 0 0 0 0 0)
                            (0 0 0 0 0 0 0))
          )
  #t
  )
;function 2
(define (RELMarkMove column)
  (begin
    (if (RELLegalMove column)
        (RELDecrementRow 6 column)
        )
    column 
    )
  )

;helper
(define (RELDecrementRow row column)
 (cond
   ((= row 0) ())
   ((equal? 0 (RELGetMatrixCell (cdr RELGameState) row column))
    (set! RELGameState (RELChangePlayer (RELSetMatrixCell (cdr RELGameState) row column (car RELGameState)) (car RELGameState))))
   (#t (RELDecrementRow (- row 1) column))
   )
)

;for test purposes
(define (RELChangePlayerTest matrix player)
 (cons player matrix)
)

;og function 
(define (RELChangePlayer matrix player)
  (cond
  ((equal? "X" player) (cons "O" matrix))
  (#t (cons "X" matrix))
  )
)


;function 3
(define (RELShowGame)
  (begin
    (display "Player ")
    (display (car RELGameState))
    (newline)
    (RELMatrixNavigator (cdr RELGameState))
  #t
  )
)

;helper for show game
(define (RELMatrixNavigator matrix)
  (cond
   ((null? matrix) ())
   (else (begin
    (display (car matrix))
    (newline)
    (RELMatrixNavigator (cdr matrix))))
   )
)

;function 4
(define (RELMakeMove)
  (if (RELIsThereSpaceForAnotherMove 1)
       (cond
         ((RELWillPlayerWinInAnyColumn 1) (RELMarkMove (RELPickLegalMove (RELGetPlayerWinColumn 1))))
         ((RELWillOpponentWinInAnyColumn 1) (RELMarkMove (RELPickLegalMove (RELGetOpponentWinColumn 1))))
         (#t (RELMarkMove (RELPickLegalMove (random 8))))
    )
  )
)

(define (RELPickLegalMove column)
  (cond
    ((RELLegalMove column) column)
    (#t (RELPickLegalMove (random 8)))
    )
)
(define (RELIsThereSpaceForAnotherMove column)
  (cond
    ((> column 7) #f)
    ((RELLegalMove column) #t)
    (#t (RELIsThereSpaceForAnotherMove (+ 1 column)))  
    )
)

(define (RELWillOpponentWinInAnyColumn column)
  (cond 
    ((> column 7) #f)
    ((RELWillOpponentWin column) #t)
    (#t (RELWillOpponentWinInAnyColumn (+ column 1)))
    )
  )
(define (RELGetOpponentWinColumn column)
  (cond
    ((> column 7) 0)
    ((RELWillOpponentWin column) column)
    (#t (RELGetOpponentWinColumn (+ column 1)))
    )
  )

(define (RELWillPlayerWinInAnyColumn column)
  (cond
    ((> column 7) #f)
    ((< column 1) #f)
    ((RELWillWinP column) #t)
    (#t (RELWillPlayerWinInAnyColumn (+ column 1)))
    )
  )

(define (RELGetPlayerWinColumn column)
  (cond
    ((> column 7) 0)
    ((RELWillWinP column) column)
    (#t (RELGetPlayerWinColumn (+ column 1)))
    )
  )


;function 5
(define (RELLegalMove column)
     (cond
      ((< column 1) #f)
      ((> column 7) #f)
      ((RELIsItLegal 6 column) #t)
      (#t #f)
      )
  )
;helper
(define (RELIsItLegal row column)
 (cond
   ((< row 1) #f)
   ((equal? 0 (RELGetMatrixCell (cdr RELGameState) row column)) #t)
   (#t (RELIsItLegal (- row 1) column))
   )
  )

;6
(define (RELWinP columnOfLastMove)
  (RELCreateAndTestNewMatrix (cdr RELGameState) (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove (car RELGameState))
  )

;helper
(define (RELNumberOfPlayersDiagonallyToTheBottomLeft board row column player)
   (cond
    ((> row 6) +  0)
    ((< row 1) + 0)
    ((< column 1) +  0)
    ((equal? player (RELGetMatrixCell board row column))
     (+ 1 (RELNumberOfPlayersDiagonallyToTheBottomLeft board (+ row 1) (- column 1) player)))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTheBottomRight board row column player)
   (cond
    ((> row 6) + 0)
    ((< row 1) + 0)
    ((> column 7) +  0)
    ((equal? player (RELGetMatrixCell board row column))
     (+ 1 (RELNumberOfPlayersDiagonallyToTheBottomRight board (+ row 1) (+ column 1) player)))
    (#t + 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTopLeft board row column player)
   (cond
    ((> row 6) + 0)
    ((< row 1) + 0)
    ((< column 1) + 0)
    ((equal? player (RELGetMatrixCell board row column))
     (+ 1 (RELNumberOfPlayersDiagonallyToTopLeft board (- row 1) (- column 1) player)))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTheTopRight board row column player)
   (cond
    ((> row 6) + 0)
    ((< row 1)  + 0)
    ((> column 7) + 0)
    ((equal? player (RELGetMatrixCell board row column))
     (+ 1 (RELNumberOfPlayersDiagonallyToTheTopRight board (- row 1) (+ column 1) player)))
    (#t 0)
    )
  )
  
(define (RELNumberOfPlayersVertically board row column player)
  (cond
    ((> row 6) + 0)
    ((equal? player (RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersVertically board (+ row 1) column player)))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersHorizontallyLeft board row column player)
  (cond
    ((> row 6) + 0)
    ((< row 1) + 0)
    ((< column 1) + 0)
    ((equal? player (RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersHorizontallyLeft board row (- column 1) player)))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersHorizontallyRight board row column player)
  (cond
    ((> column 7) + 0)
    ((equal? player (RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersHorizontallyRight board row (+ column 1) player)))
    (#t 0)
    )
  )

;OUT OF SERVICE
(define (RELGetTopMostOccupiedRowDEAD row column)
  (cond
    ((equal? (car RELGameState)  (RELGetMatrixCell (cdr RELGameState) row column)) (RELGetTopMostOccupiedRow (- row 1) column))
    (#t (+ row 1))
    )
)
;OUT OF SERVICE


;IN SERVICE
(define (RELGetTopMostOccupiedRow row column)
  (cond
    ((< row 1) 0)
    ((> row 6) 7)
    ((equal? 0 (RELGetMatrixCell (cdr RELGameState) row column)) (+ row 1))
    (#t (RELGetTopMostOccupiedRow (- row 1) column))
    )
)

;function 7
(define (RELWillWinP column)
    (RELCreateAndTestNewMatrix
     (RELSetMatrixCell (cdr RELGameState) (- (RELGetTopMostOccupiedRow 6 column) 1) column (car RELGameState))
     (- (RELGetTopMostOccupiedRow 6 column) 1) column (car RELGameState))
)

(define (RELWillOpponentWin column)
  (RELCreateAndTestNewMatrix
   (RELSetMatrixCell (cdr RELGameState) (- (RELGetTopMostOccupiedRow 6 column) 1) column (RELGetOppositePlayer))
   (- (RELGetTopMostOccupiedRow 6 column) 1) column (RELGetOppositePlayer))
 )

(define (RELGetOppositePlayer)
  (cond
    ((equal? (car RELGameState) "X") "O")
    (#t "X")
    )
  )
  
;helpers
(define (RELCreateAndTestNewMatrix matrix row column player)
      (cond
        ((< row 1) #f)
        ((> row 6) #f)
        ((< column 1) #f)
        ((> column 7) #f)
        ((>= (RELNumberOfPlayersVertically matrix row column player) 4) #t)
        ((> (+ (RELNumberOfPlayersHorizontallyLeft  matrix row column player)
                (RELNumberOfPlayersHorizontallyRight  matrix row column player)) 4) #t)
        ((> (+ (RELNumberOfPlayersDiagonallyToTheBottomLeft  matrix row column player)
                (RELNumberOfPlayersDiagonallyToTheTopRight matrix row column player)) 4) #t)
        ((> (+ (RELNumberOfPlayersDiagonallyToTheBottomRight matrix row column player)
                (RELNumberOfPlayersDiagonallyToTopLeft matrix row column player)) 4) #t)
        (#t   #f)
        )

  )

;12 a functions
(define (RELGetMatrixCell matrix row column)
  (cond
    ((> row 1) (RELGetMatrixCell (cdr matrix) (- row 1) column))
    ((= 1 row) (RELGetMatrixCell (car matrix) (- row 1) column))
    ((> column 1) (RELGetMatrixCell (cdr matrix) row (- column 1)))
    (#t (car matrix))
    )
)

(define (RELSetMatrixCell matrix row column item)
  (cond
    ((null? matrix) ())
    ((> row 1) (cons (car matrix) (RELSetMatrixCell (cdr matrix) (- row 1) column item)))
    ((>= column 1) (cons (RELReplaceItemInList (car matrix) item column) (RELSetMatrixCell (cdr matrix) row 0 item)))
    (#t (cons (car matrix) (RELSetMatrixCell (cdr matrix) row column item)))
    )
  )

;Helper function
(define (RELReplaceItemInList list item iNumber)
  (cond 
    ((null? list) ())
    ((> iNumber 1) (cons (car list) (RELReplaceItemInList (cdr list) item (- iNumber 1))))
    ((= iNumber 1) (cons item (RELReplaceItemInList (cdr list) item (- iNumber 1))))
    (#t (cons (car list) (RELReplaceItemInList (cdr list) item iNumber)))
    )
)
  