;game state 
(define RELGameState 0)

;function 1
(define (RELStartGame)
  (begin
    (set! RELGameState '("X"(0 0 0 0 0 0 0)
                       (0 0 0 0 0 0 0)
                       (0 0 0 0 0 0 0)
                       (0 0 0 0 0 0 0)
                       (0 0 0 0 0 0 0)
                       (0 0 0 0 0 0 0)))
    #t
  )
)

;function 2
(define (RELMarkMove column)
  (begin
    (cond
      ((equal? 0 (getMatrixCell (cdr RELGameState) 6 column)) (set! RELGameState (changePlayer (setMatrixCell (cdr RELGameState) 6 column (car RELGameState)) (car RELGameState))))
      ((equal? 0 (getMatrixCell (cdr RELGameState) 5 column)) (set! RELGameState (changePlayer (setMatrixCell (cdr RELGameState) 5 column (car RELGameState)) (car RELGameState))))
      ((equal? 0 (getMatrixCell (cdr RELGameState) 4 column)) (set! RELGameState (changePlayer (setMatrixCell (cdr RELGameState) 4 column (car RELGameState)) (car RELGameState))))
      ((equal? 0 (getMatrixCell (cdr RELGameState) 3 column)) (set! RELGameState (changePlayer (setMatrixCell (cdr RELGameState) 3 column (car RELGameState)) (car RELGameState))))
      ((equal? 0 (getMatrixCell (cdr RELGameState) 2 column)) (set! RELGameState (changePlayer (setMatrixCell (cdr RELGameState) 2 column (car RELGameState)) (car RELGameState))))
      ((equal? 0 (getMatrixCell (cdr RELGameState) 1 column)) (set! RELGameState (changePlayer (setMatrixCell (cdr RELGameState) 1 column (car RELGameState)) (car RELGameState))))
      )
    )
  )
;helper
(define (changePlayer matrix player)
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


;12 a functions
(define (getMatrixCell matrix row column)
  (cond
    ((> row 1) (getMatrixCell (cdr matrix) (- row 1) column))
    ((= 1 row) (getMatrixCell (car matrix) (- row 1) column))
    ((> column 1) (getMatrixCell (cdr matrix) row (- column 1)))
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

;tester
(define(tester matrix)
  (cdr RELGameState)
  )