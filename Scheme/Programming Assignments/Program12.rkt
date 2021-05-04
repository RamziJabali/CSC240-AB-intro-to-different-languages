;game state 
(define RELGameState 0)

;function 1
(define (RELStartGame)
  (begin
    (set! RELGameState '("REL"("***" "***" "***" "***" "***" "***" "***")
                       ("***" "***" "***" "***" "***" "***" "***")
                       ("***" "***" "***" "***" "***" "***" "***")
                       ("***" "***" "***" "***" "***" "***" "***")
                       ("***" "***" "***" "***" "***" "***" "***")
                       ("***" "***" "***" "***" "***" "***" "***")))
    #t
  )
)

;function 2
(define (RELMarkMove column)
  (begin
   (display (RELLegalMove column))
   (newline)
    (if (RELLegalMove column)   
        (cond
          ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 6 column)) (set! RELGameState (cons (car RELGameState) (setMatrixCell (cdr RELGameState) 6 column (car RELGameState)))))
          ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 5 column)) (set! RELGameState (cons (car RELGameState) (setMatrixCell (cdr RELGameState) 5 column (car RELGameState)))))
          ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 4 column)) (set! RELGameState (cons (car RELGameState) (setMatrixCell (cdr RELGameState) 4 column (car RELGameState)))))
          ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 3 column)) (set! RELGameState (cons (car RELGameState) (setMatrixCell (cdr RELGameState) 3 column (car RELGameState)))))
          ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 2 column)) (set! RELGameState (cons (car RELGameState) (setMatrixCell (cdr RELGameState) 2 column (car RELGameState)))))
          ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 1 column)) (set! RELGameState (cons (car RELGameState) (setMatrixCell (cdr RELGameState) 1 column (car RELGameState)))))
          ) 
        )
    )
  ) 



;function 3
(define (RELShowGame)
  (begin
    (display "Player ")
    (display (car RELGameState))
    (newline)
    (matrixNavigator (cdr RELGameState))
  #t
  )
)

;helper
(define (matrixNavigator matrix)
  (cond
   ((null? matrix) ())
   (else (begin
    (display (car matrix))
    (newline)
    (matrixNavigator (cdr matrix))))
   )
)

;function 4
(define (RELMakeMove)
  (replaceZero (random 8))
)

;helper
(define (replaceZero num)
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
      ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 6 column)) #t)
      ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 5 column)) #t)
      ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 4 column)) #t)
      ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 3 column)) #t)
      ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 2 column)) #t)
      ((equal? "***" (RELGetMatrixCell (cdr RELGameState) 1 column)) #t)
      (#t #f)
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
          (RELNumberOfPlayersDiagonallyToTheTopLeft (RELGetTopMostOccupiedRow 6 columnOfLastMove) columnOfLastMove)) 4) #t)
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
    ((equal? (car RELGameState)(RELGetMatrixCell (cdr RELGameState) row column)) (+ 1 (RELNumberOfPlayersVertically (+ row 1) + column 1)))
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


;12 a functions
(define (RELGetMatrixCell matrix row column)
  (cond
    ((> row 1) (RELGetMatrixCell (cdr matrix) (- row 1) column))
    ((= 1 row) (RELGetMatrixCell (car matrix) (- row 1) column))
    ((> column 1) (RELGetMatrixCell (cdr matrix) row (- column 1)))
    (#t (car matrix))
    )
)

(define (setMatrixCell matrix row column item)
  (cond
    ((null? matrix) ())
    ((> row 1) (cons (car matrix) (setMatrixCell (cdr matrix) (- row 1) column item)))
    ((>= column 1) (cons (replaceItemInList (car matrix) item column) (setMatrixCell (cdr matrix) row 0 item)))
    (#t (cons (car matrix) (setMatrixCell (cdr matrix) row column item)))
    )
  )

;Helper function
(define (replaceItemInList list item iNumber)
  (cond 
    ((null? list) ())
    ((> iNumber 1) (cons (car list) (replaceItemInList (cdr list) item (- iNumber 1))))
    ((= iNumber 1) (cons item (replaceItemInList (cdr list) item (- iNumber 1))))
    (#t (cons (car list) (replaceItemInList (cdr list) item iNumber)))
    )
)