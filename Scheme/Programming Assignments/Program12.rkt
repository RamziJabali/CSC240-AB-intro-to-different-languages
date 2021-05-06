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
  (RELReplaceZero (random 8))
)

;helper
(define (RELReplaceZero num)
  (cond
    ((= num 0) (+ num 1))
    (#t num)
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
   ((= row 0) ())
   ((equal? 0 (RELGetMatrixCell (cdr RELGameState) row column)) #t)
   (#t (RELIsItLegal (- row 1) column))
   )
  )

;6
(define (RELWinP columnOfLastMove)
  (RELCreateAndTestNewMatrix (cdr RELGameState) (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove)
  #f
  )
;helper
(define (RELNumberOfPlayersDiagonallyToTheBottomLeft board row column)
   (cond
    ((> row 6) +  0)
    ((< column 1) +  0)
    ((equal? (car RELGameState) (RELGetMatrixCell board row column))
     (+ 1 (RELNumberOfPlayersDiagonallyToTheBottomLeft board (+ row 1) (- column 1))))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTheBottomRight board row column)
   (cond
    ((> row 6) + 0)
    ((> column 7) +  0)
    ((equal? (car RELGameState)(RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersDiagonallyToTheBottomRight board (+ row 1) (+ column 1))))
    (#t + 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTopLeft board row column)
   (cond
    ((< row 1) + 0)
    ((< column 1) + 0)
    ((equal? (car RELGameState)(RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersDiagonallyToTopLeft board (- row 1) (- column 1))))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTheTopRight board row column)
   (cond
    ((< row 1)  + 0)
    ((> column 7) + 0)
    ((equal? (car RELGameState)(RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersDiagonallyToTheTopRight board (- row 1) (+ column 1))))
    (#t 0)
    )
  )
  
(define (RELNumberOfPlayersVertically board row column)
  (cond
    ((> row 6) + 0)
    ((equal? (car RELGameState)(RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersVertically board (+ row 1) column)))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersHorizontallyLeft board row column)
  (cond
    ((< column 1) + 0)
    ((equal? (car RELGameState)(RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersHorizontallyLeft board row (- column 1))))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersHorizontallyRight board row column)
  (cond
    ((> column 7) + 0)
    ((equal? (car RELGameState)(RELGetMatrixCell board row column)) (+ 1 (RELNumberOfPlayersHorizontallyRight board row (+ column 1))))
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
    ((equal? 0 (RELGetMatrixCell (cdr RELGameState) row column)) (+ row 1))
    (#t (RELGetTopMostOccupiedRow (- row 1) column))
    )
)

;function 7
(define (RELWillWinP column)
    (RELCreateAndTestNewMatrix
     (RELSetMatrixCell (cdr RELGameState) (- (RELGetTopMostOccupiedRow 6 column) 1) column (car RELGameState)) (- (RELGetTopMostOccupiedRow 6 column) 1) column)
)

;helpers
(define (RELCreateAndTestNewMatrix matrix row column)
      (cond
        ((>= (RELNumberOfPlayersVertically matrix row column) 4) #t)
        ((>= (+ (RELNumberOfPlayersHorizontallyLeft  matrix row column)
                (RELNumberOfPlayersHorizontallyRight  matrix row column)) 4) #t)
        ((>= (+ (RELNumberOfPlayersDiagonallyToTheBottomLeft  matrix row column)
                (RELNumberOfPlayersDiagonallyToTheTopRight matrix row column)) 4) #t)
        ((>= (+ (RELNumberOfPlayersDiagonallyToTheBottomRight matrix row column)
                (RELNumberOfPlayersDiagonallyToTopLeft matrix row column)) 4) #t)
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