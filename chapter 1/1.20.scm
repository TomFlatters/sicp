; GCD algorithm
(define (gcd a b)
    (if (= b 0)
    a
    (gcd b (remainder a b))))

(gcd 3 9)
(gcd 9 3)

(gcd 206 40)

; normal-order
; (if(= 40 0) 
;       206
;       (gcd 40 (remainder 206 40)))
; (if(= 40 0)
;       206
;       (if(= (remainder 206 40) 0)
;           40
;           (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))) ... etc ...
; the computer evaluates the expression when the if statement is zero, at which point there are 18 remainder procedures to evaluate, but only 4 are used to calc. the result.

; applicative order
; (if (= 40 0)
;   206
;   (gcd 40 (remainder 206 40)))
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (if (= 6 0)
;   40
;   (gcd 6 (remainder 40 6)))
; (gcd 6 4)
; (gcd 4 (remainder 4 6))
; (gcd 4 2)
; (gcd 2 (remainder 2 4))
; (gcd 2 2)
; (gcd 2 (remainder 2 2))
; (gcd 2 0)
; 2
; so the applicative method applies remainder 4 times only