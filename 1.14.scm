; process generated by count-change procedure for 11 cents:

; (count-change 11)
; (cc 11 5)
; (+ (cc 11 4) (cc (- 11 (first-demonination 5))
;                     5))
; (+ (cc 11 4) (cc -39 5))
; (+ (cc 11 4) 0)
; (+ (cc 11 4) 0)
; (+ (+ (cc 11 3) (cc (- 11 25) 4)) 0)
; (+ (+ (cc 11 3) 0) 0)

; what are the orders of growth of space and #steps by this process as the amount to be changed increases?

; 