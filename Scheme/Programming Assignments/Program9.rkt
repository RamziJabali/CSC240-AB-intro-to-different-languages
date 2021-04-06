;Function 1

(define (getBagCount list item)
  (cond
    ((null? list) 0)
    ((string=? (car list) item) (+ 1 (getBagCount (cdr list) item)))
    (else (+ 0 (getBagCount (cdr list) item)))
  )
)

;function 2
(define (insertBag list item)
  (cond
    ((null? list) (cons item ()))
    (else (cons item list))
  )
)

;function 3
(define (deleteBag list item)
  (cond
    ((string=? (car list) item) (cdr list))
    (else (cons (car list) (deleteBag (cdr list) item)))
    )
)

;function 4
(define (deleteAllBag list item)
  (cond
    ((null? list) '())
    ((string=? (car list) item) (deleteAllBag (deleteBag  list item) item))
    (else (cons (car list) (deleteAllBag (cdr list) item)))
   )
)

;function 5



;dottedfunction
(define (listDotted list)
  (cond
    ((null? list) '())
    (else
     (cons
         (cons (car list) (getBagCount list (car list)))
         (listDotted (deleteAllBag list (car list)))
         )
     )
   )
)