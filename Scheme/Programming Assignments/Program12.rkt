;game state 
(define RELGameState 0)

;function 1
(define (RELStartGame)
  (begin
    (set! RELGameState '((0 0 0 0 0 0 0)
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
    (cond
      ((equal? 0 (getMatrixCell RELGameState 6 column)) (set! RELGameState (setMatrixCell RELGameState 6 column "X")))
      ((equal? 0 (getMatrixCell RELGameState 5 column)) (set! RELGameState (setMatrixCell RELGameState 5 column "X")))
      ((equal? 0 (getMatrixCell RELGameState 4 column)) (set! RELGameState (setMatrixCell RELGameState 4 column "X")))
      ((equal? 0 (getMatrixCell RELGameState 3 column)) (set! RELGameState (setMatrixCell RELGameState 3 column "X")))
      ((equal? 0 (getMatrixCell RELGameState 2 column)) (set! RELGameState (setMatrixCell RELGameState 2 column "X")))
      ((equal? 0 (getMatrixCell RELGameState 1 column)) (set! RELGameState (setMatrixCell RELGameState 1 column "X")))
      (else (#f))
      )
  )
;helper
(define (matrix matrixs)
  matrixs
  )

;function 3
(define (RELShowGame)
  (begin
    (matrixNavigator RELGameState)
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
