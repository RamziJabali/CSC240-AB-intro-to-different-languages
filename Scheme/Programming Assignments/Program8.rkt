;Author: Ramzi Eljabali
;Date: 03/21/2021
;Purpose to perform three different functions using the scheme language
;A)to perform dot product given two lists
;B)to find duplicates within a list 
;C)to find the smallest product between two lists

;Function a) Dot product

(define (dotProduct list1 list2)
  (if (null? list1)
  0
  (+ (* (car list1) (car list2))
   (dotProduct (cdr list1) (cdr list2)))
     )
  )


;Function b) Does it contain duplicates

(define (doesContainDupes list)
   (cond
     ((null? list) #f)
     ((toBeCompared (cdr list) (car list)) #t)
     (else (doesContainDupes (cdr list)))
  )
)

;helper for b

(define (toBeCompared lst number)
 (if (null? lst)
      #f
  (if (= (car lst) number)
      #t
  (toBeCompared (cdr lst) number)      
      )
   )
)

;Function C) Smallest product in a list
 
(define (smallestProduct lst1 lst2)
  (cond
    ((isItTheSmallestProduct (cdr lst1) (cdr lst2) (* (car lst1) (car lst2))) (* (car lst1) (car lst2)))
    (else (smallestProduct (cdr lst1) (cdr lst2)))
    )
  )

;helper C

(define (isItTheSmallestProduct lst1 lst2 product)
(if (null? lst1)
     #t
  (if
     (> product (* (car lst1) (car lst2)))
     #f
     
  (isItTheSmallestProduct (cdr lst1) (cdr lst2) product)
    )
  )
)