;Author: Ramzi Eljabali
;Program:  Writing Scheme functions with decisions
;(using 'if' or 'cond')
;Three subroutines that employ the use of if and cond
;date: 02/10/2021

;1
(define (waterWeight pipeDiameter pipeLength pureWater)
  (if pureWater
      (* 3.14159 (/ pipeDiameter 24) pipeLength 62.4)
      (* 3.14159 (/ pipeDiameter 24) pipeLength 64.08)
   )
  )
;2
(define (radioFrequency frequencyMHz)
  (cond
    ((and (< frequencyMHz .03) (>= frequencyMHz .01))  "Very Low Frequency(VLF)")
    ((and (< frequencyMHz .3) (>= frequencyMHz .03))  "Low Frequency(LF)")
    ((and (< frequencyMHz 3) (>= frequencyMHz .3))  "Medium Frequency(MF)")
    ((and (< frequencyMHz 30) (>= frequencyMHz 3))  "High Frequency(HF)")
    ((and (< frequencyMHz 328.6) (>= frequencyMHz 30))  "Very High Frequency(VHF)")
    ("Ultra High Frequency(VHF)"))
     
  )
;3
(define (totalWeeklyPaycheck hourly numHoursOrCommissions hourlyRate giftCard)
  (if hourly
      (if (> numHoursOrCommissions 40)
      (- (+ (* 40 hourlyRate) (* hourlyRate (- numHoursOrCommissions 40) 1.5)) giftCard)
      (- (* numHoursOrCommissions hourlyRate) giftCard)
      )
      (cond
        ((< numHoursOrCommissions 500) (- (* numHoursOrCommissions 0.015) giftCard))
        ((and (< numHoursOrCommissions 1000) (>= numHoursOrCommissions 500)) (- (* numHoursOrCommissions 0.03) giftCard))
        ((>= numHoursOrCommissions 1000) (- (* numHoursOrCommissions 0.05) giftCard)))
      )
  )