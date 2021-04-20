;Author: Ramzi Eljabali
;Date: 04/20/2021
;Purpose: part 1 of a bigger program 

(define (getMatrixCell matrix row column)
  (cond
    ((> row 1) (getMatrixCell (cdr matrix) (- row 1) column))
    ((= 1 row) (getMatrixCell (car matrix) (- row 1) column))
    ((> column 1) (getMatrixCell (cdr matrix) row (- column 1)))
    (else (car matrix))
    )
)

(define (setMatrixCell matrix row column item)
  (cond
    ((null? matrix) ())
    ((> row 1) (cons (car matrix) (setMatrixCell (cdr matrix) (- row 1) column item)))
    ((>= column 1) (cons (replaceItemInList (car matrix) item column) (setMatrixCell (cdr matrix) row 0 item)))
    (else (cons (car matrix) (setMatrixCell (cdr matrix) row column item)))
    )
  )

;Helper function
(define (replaceItemInList list item iNumber)
  (cond 
    ((null? list) ())
    ((> iNumber 1) (cons (car list) (replaceItemInList (cdr list) item (- iNumber 1))))
    ((= iNumber 1) (cons item (replaceItemInList (cdr list) item (- iNumber 1))))
    (else (cons (car list) (replaceItemInList (cdr list) item iNumber)))
    )
)