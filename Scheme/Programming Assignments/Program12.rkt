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
   ((equal? 0 (RELGetMatrixCell (cdr RELGameState) row column)) (set! RELGameState (RELChangePlayer (RELSetMatrixCell (cdr RELGameState) row column (car RELGameState)) (car RELGameState))))
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
   (#t (RELDecrementRow (- row 1) column))
   )
  )

;6
(define (RELWinP columnOfLastMove)
  (if (> (RELGetTopMostOccupiedRow 6 columnOfLastMove) 0)
  (cond
  ((>= (RELNumberOfPlayersVertically (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove) 4) #t)
  ((>= (+ (RELNumberOfPlayersHorizontallyLeft (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove)
          (RELNumberOfPlayersHorizontallyRight (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove))4) #t)
  ((>= (+ (RELNumberOfPlayersDiagonallyToTheBottomLeft (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove)
          (RELNumberOfPlayersDiagonallyToTheTopRight (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove)) 4) #t)
  ((>= (+ (RELNumberOfPlayersDiagonallyToTheBottomRight (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove)
          (RELNumberOfPlayersDiagonallyToTopLeft (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove)) 4) #t)
  )
  )
  #f
)
;helper
(define (RELNumberOfPlayersDiagonallyToTheBottomLeft row column)
   (cond
    ((< row 1)  0)
    ((< column 1)  0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersVertically (- row 1) (- column 1))))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTheBottomRight row column)
   (cond
    ((< row 1)  0)
    ((> column 7)  0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersVertically (- row 1) (- column 1))))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTopLeft row column)
   (cond
    ((> row 6)  0)
    ((< column 1)  0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersVertically (+ row 1) (- column 1))))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersDiagonallyToTheTopRight row column)
   (cond
    ((> row 6)  0)
    ((> column 7)  0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersVertically (+ row 1) (+ column 1))))
    (#t 0)
    )
  )
  
(define (RELNumberOfPlayersVertically row column)
  (cond
    ((< row 1)  0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersVertically (- row 1) column)))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersHorizontallyLeft row column)
  (cond
    ((< column 1)  0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersHorizontallyLeft row (- column 1))))
    (#t 0)
    )
  )

(define (RELNumberOfPlayersHorizontallyRight row column)
  (cond
    ((> column 7)  0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersHorizontallyRight row (+ column 1))))
    (#t 0)
    )
  )

(define (RELGetTopMostOccupiedRow row column)
  (cond
    ((= row 0) 0)
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) row)
    (#t (RELGetTopMostOccupiedRow (- row 1) column))
    )
)

;function 7
(define (RELWillWinP column)
  (begin
  (display (RELWinP (RELMarkMove column)))
  (newline)
  (set! RELGameState (cons (RELOppositePlayer (car RELGameState)) (RELSetMatrixCell (cdr RELGameState) (RELGetTopMostOccupiedRow 6 column) column 0))) 
  )
  )

(define (RELOppositePlayer name)
  (cond
    ((equal? name "X") "O")
    (#t "X")
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