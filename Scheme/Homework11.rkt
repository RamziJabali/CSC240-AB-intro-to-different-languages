(define
  (numberOfMatches Lst Item)
  (if
   (null? Lst)
   0
   (if
    (equal?
     (car Lst) Item)
    (+ 1
       (numberOfMatches (cdr Lst) Item))
    (+ 0
       (numberOfMatches(cdr Lst) Item)))))