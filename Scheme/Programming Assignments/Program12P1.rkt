(define (getMatrixCell matrix row column)
  (cond
    ((> row 1) (getMatrixCell (cdr matrix) (- row 1) column))
    ((= 1 row) (getMatrixCell (car matrix) (- row 1) column))
    ((> column 1) (getMatrixCell (cdr matrix) row (- column 1)))
    (else (car matrix))
    )
)

; for testing purposes
(define (test matrix)
(car(cdr matrix))
)

(define (test2 matrix)
(cdr matrix)
)

(define (test3 matrix)
(car(car matrix))
)


(define (test4 matrix)
(cdr (car matrix))
)

(define (test5 matrix)
(car matrix)
)