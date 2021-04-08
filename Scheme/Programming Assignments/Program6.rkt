;Ramzi Eljabali 
;Program 6
;Purpose: To learn how to use recursion

;a
(define (findNthTerm commonRatio scaleFactor n)
  (if (= (- n 1) 0)
      scaleFactor
      (if  (= (- n 1) 1)
           (* commonRatio scaleFactor)
      (* commonRatio (findNthTerm commonRatio scaleFactor (- n 1)))
      )))
;a done using the recursive formula FIXED
(define (geometricSequence commonRatio scaleFactor N)
   (if (> N 1)
      (* commonRatio (geometricSequence commonRatio scaleFactor  (- N 1)))
      scaleFactor
   )
)

;b FIXED
(define (fastPower base exponent)
   (if (= exponent 0)
      1
      (if (even? exponent)
         (expt (fastPower base (/ exponent 2)) 2)
         (* base (expt (fastPower base (/ (- exponent 1) 2)) 2)))
   )
)
