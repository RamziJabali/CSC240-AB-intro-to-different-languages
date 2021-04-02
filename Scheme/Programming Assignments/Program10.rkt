(define (getBagCount list item)
  (cond
    ((null? list) 0)
    ((string=? (car list) item) (+ 1 (getBagCount (cdr list) item)))
    (else (+ 0 (getBagCount (cdr list) item)))
   )
  )