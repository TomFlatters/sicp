; n<3 --> n
; n>=3 f(n) = f(n-1) + 2f(n-2) + 3f(n-3)

; recursive
(define (f n)
    (cond 
        ((< n 3) n)
        (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

; a couple of tests 
(f 3)
(f 4)
(f 5)

; iterative
; iterative processes require some kind of counter that breaks some kind of loop. here, the counter is 'n' and the loop is the call of procedure 'h'

; f(5) = f(4) + 2f(3) + 3f(2)
;      =        3f(3) + 5f(2) + 3f(1)
;      =                8f(2) + 9f(1) 

(define (g n)
    (h 3 2 1 n))

; initially, we represent the "n-3"s as a, the "n-2"s as b and the number of "n-1"s as c which, when added to g(n), gives g(ORIGINAL N)
; after every cycle, we break down the current value of n into its a, b and c coefficients and lose the old value of c (as it has been decomposed)
(define (h a b c n)
    (if (= n 3)
        (+ b (* 2 c))
        (h (* 3 c) (+ a (* 2 c)) (+ b c) (- n 1))))
(g 3)
(g 4)
(g 5)
(g 6)
