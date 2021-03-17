;Author: Ramzi Eljabali
;Purpose: Converting 6 high level math equations into 
;Scheme understandable math equations
;Date 01/27/2021

;1) 
(*  100 (expt (+ 1 0.09) 20)) ;okay
;2)
 (* (/ 100 (/ .12 12))(- 1 (expt (+ 1 (/ .12 12)) (- 60)))) ;fixed
;3)
 (- (* (/ 100 .005) (- (expt (+ 1 .005) (+ 120 1)) 1)) 100) ;okay
;4)
 (* 10000 (/ (- 1 (expt (/ (+ 1 .02) (+ 1 .05)) 10)) (- .05 .02))) ;okay
;5)
 (/ (* 5000 0.015) (- 1 (expt (+ 1 0.015) (- 60)))) ;Fixed
;6)
 (/ (* 1000 .01) (- (expt (+ 1 .01) 11) 1)) ;okay

;in order from 1-6
;560.4410767778301
;4495.503840622404
;16469.87435404903
;83881.05652432927
;126.96713713554595
;86.45407571126393