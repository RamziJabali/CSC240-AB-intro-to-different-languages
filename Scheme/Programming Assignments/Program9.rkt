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
(define (unionBag list1 list2)
  (cond
    ((and (null? list1) (null? list2)) '())
    ((null? list2) (listDotted list1))
    ((null? list1) (listDotted list2))
    (else (unionBag (insertBagOnEnd list1 (car list2))
                    (deleteBag list2 (car list2))))
  )
)

;function 6
(define (intersectionBag list1 list2)
 (cond
    ((and (null? list1) (null? list2)) '())
    ((null? list1) (listDotted list2))
    ((null? list2) (listDotted list1))

    ((= 0 (getBagCount list2 (car list1)))
     (intersectionBag (deleteAllBag list1 (car list1)) (insertAllBag list2 (car List1))))

    ((= (getBagCount list1 (car list1)) (getBagCount list2 (car list1)))
     (intersectionBag (deleteAllBag list1 (car list1)) list2))

    ((> (getBagCount list1 (car list1)) (getBagCount list2 (car list1)))
     (intersectionBag (deleteAllBag list1 (car list1)) list2))

    (else (intersectionBag list1
            (insertAllBag
              (deleteAllBag list2 (car list1)) (car list1)
               (getBagCount list1 (car list1)))))
  )
)

;Makes the dotted pair
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


;Alternative to function 2
(define (insertBagOnEnd Lst Item)
  ( if ( null? Lst )
       (cons Item ())
       (cons (car Lst) (insertBagOnEnd (cdr Lst) Item))
   )
)

;Helper function
(define (insertAllBag list item numOfInserts)
(cond
  ((= numOfInserts 0) list)
  (else (insertAllBag (insertBag list item) item (- numOfInserts 1)))
  )
)

(define (inOrder lst)
   (if (null? lst)
 	#t
   (if (null? (cdr lst))
 	#t
   (if (> (car lst) (car (cdr lst)))
 	#f
   (inOrder (cdr lst))
   )
  )
 )
)

(define (bubblePass lst)
   (if (or (null? lst) (null? (cdr lst)))
	lst
   (if (< (car lst) (car (cdr lst)))
   (cons
     (car lst)
     (bubblePass (cdr lst))
 )

   (cons
      (car (cdr lst))
      (bubblePass
          (cons
	      (car lst)
 	      (cdr (cdr lst))
     )
    )
   )
  )
 )
)

(define (bubbleSort lst)
   (if (inOrder lst)
      lst
   (bubbleSort (bubblePass lst))
 )
)
