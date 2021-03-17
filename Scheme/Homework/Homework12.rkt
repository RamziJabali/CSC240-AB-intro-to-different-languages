(define (replaceItem item toBeReplaced list)
  (if (null? list)
      (cons item ())
      (if (equal? toBeReplaced (car list))
          (cons item (cdr list))   
     (cons (car list) (replaceItem item toBeReplaced (cdr list)))
      )))
 