(define (A x y) 
    (cond 
        ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; What are the values of?

; (A 1 10) ; answer is 2 * (A 1 9) => 2 * 2 * (A 1 8) => 2^10

; (((comment out lines 13-36 to suppress output)))
; ; how does this one work? can I show process?
; (A 2 4) ; answer is (A 1 (A 2 3)) => (A 1 (A 1 (A 2 2))) => (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 0 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 1 3)))
; (A 1 (A 0 (A 0 (A 0 2))))
; (A 1 (A 0 (A 0 4)))
; (A 1 (A 0 8))
; (A 1 16) ; ... which we know evaluates to 2^16

; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2))
; (A 2 (A 0 (A 1 1)))
; (A 2 (A 0 2))
; (A 2 4) ; ... which we know evaluates to 2^16

; define the following functions mathematically:

(define (f n) 
    (A 0 n)) 
; f(n) = 2n

(define (g n) 
    (A 1 n)) 
; g(n) = 2^n

(define (h n) 
    (A 2 n)) 
; h(n) = 2^(4n)

(define (k n) 
    (* 5 n n))
; k(n) = 5n^2
