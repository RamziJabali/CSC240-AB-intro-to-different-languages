;Function 1

;regular list: ex '("a"  "a" "b" "c")
(define (getBagCount list item)
  (cond
    ((null? list) 0)
    ((string=? (car list) item) (+ 1 (getBagCount (cdr (car list)) item)))
    (else (+ 0 (getBagCount (cdr list) item)))
  )
)

;dotted list: Ex '(("a" . 2) ("b" . 1) ("c" . 1)) 
(define (getBagCountF list item)
  (cond
    ((null? list) 0)
    ((string=? (car (car list)) item) (cdr (car list)))
    (else (getBagCountF (cdr list) item))
    )
)

;function 2

;regular lists ex: '("a" "a" "b" "c")
(define (insertBag list item)
  (cond
    ((null? list) (cons item ()))
    (else (cons item list))
  )
)

;dotted list: Ex '(("a" . 2) ("b" . 1) ("c" . 1)) 
(define (insertBagF list item)
(cond
    ((null? list) (cons (cons item 1) list))
    ((string=? (car (car list)) item) (cons (cons item (+ (cdr (car list)) 1)) (cdr list)))
    (else (cons
          (cons (car (car list)) (cdr (car list)))
          (insertBagF (cdr list) item)
          )
       )
    )
)
;helper function
(define (insertAllBagF list item itemCount)
  (cond
    ((= 0 itemCount) list)
    (else (insertAllBagF (insertBagF list item) item (- itemCount 1)))
   )
  )
  
;function 3

;regular list: ex '("a"  "a" "b" "c")
(define (deleteBag list item)
  (cond
    ((string=? (car list) item) (cdr list))
    (else (cons (car list) (deleteBag (cdr list) item)))
    )
)

;dotted list: Ex '(("a" . 2) ("b" . 1) ("c" . 1))
(define (deleteBagF list item)
  (cond
    ((null? list) ())
    ((and (string=? (car (car list)) item) (= (cdr (car list)) 1)) (cdr list))
    ((string=? (car (car list)) item) (cons (cons item (- (cdr (car list)) 1)) (cdr list)))
    (else (cons
          (cons (car (car list)) (cdr (car list)))
          (deleteBagF (cdr list) item)
        )
      )
   )
)

;function 4

;regular lists ex: '("a" "a" "b" "c")
(define (deleteAllBag list item)
  (cond
    ((null? list) '())
    ((string=? (car list) item) (deleteAllBag (deleteBag  list item) item))
    (else (cons (car list) (deleteAllBag (cdr list) item)))
   )
)

;dotted list: Ex '(("a" . 2) ("b" . 1) ("c" . 1))

;done using nothing but this function
(define (deleteAllBagF list item)
(cond
    ((null? list) '())
    ((string=? (car (car list)) item) (cdr list))
    (else (cons
          (cons (car (car list)) (cdr (car list)))
          (deleteAllBagF (cdr list) item)
         )
      )
   )
)

;dotted list: Ex '(("a" . 2) ("b" . 1) ("c" . 1))

;done using deleteBagF function previously made
(define (deleteAllBagF2 list item)
  (cond
    ((null? list) '())
    ((string=? (car (car list)) item) (deleteAllBagF2 (deleteBagF list item) item))
    (else (cons
          (cons (car (car list)) (cdr (car list)))
          (deleteAllBagF2 (cdr list) item)
         )
    )
  )
)

;function 5
;regular list: ex '("a"  "a" "b" "c")
(define (unionBag list1 list2)
  (cond
    ((and (null? list1) (null? list2)) '())
    ((null? list2) (listDotted list1))
    ((null? list1) (listDotted list2))
    (else (unionBag (insertBagOnEnd list1 (car list2))
                    (deleteBag list2 (car list2))))
  )
)

;dotted list: Ex '(("a" . 2) ("b" . 1) ("c" . 1))
(define (unionBagF list1 list2)
  (cond
   ((and (null? list1) (null? list2)) '())
   ((null? list1) list2)
   ((null? list2) list1)
   (else (unionBagF (insertAllBagF list1 (car (car list2)) (cdr (car list2))) (cdr list2)))
   )
)

;function 6
;regular lists ex: '("a" "a" "b" "c")
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

;dotted list: Ex '(("a" . 2) ("b" . 1) ("c" . 1))
(define (intersectionBagF list1 list2)
  (cond
   ((and (null? list1) (null? list2)) '())
   ((null? list1) ())
   ((null? list2) list1)
   ((<= (getBagCountF list1 (car(car list1))) (getBagCountF list2 (car(car list1))))
    (cons
         (cons (car (car list1)) (cdr (car list1)))
         (intersectionBagF (cdr list1) list2)
         ))
   ((> (getBagCountF list1 (car(car list1))) (getBagCountF list2 (car(car list1))))
    (cons
         (cons (car (car list1)) (getBagCountF list2 (car(car list1))))
         (intersectionBagF (cdr list1) list2)
         ))
   )
)

;Makes the dotted pair
(define (listDotted list )
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
;regular lists ex: '("a" "a" "b" "c")
(define (insertBagOnEnd Lst Item)
  ( if ( null? Lst )
       (cons Item ())
       (cons (car Lst) (insertBagOnEnd (cdr Lst) Item))
   )
)
