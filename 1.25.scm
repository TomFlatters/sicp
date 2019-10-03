(define (fast-expt b n)
    (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

(define (expmod2 base exp m)
(remainder (fast-expt base exp) m))

(define (expmod base exp m)
    (cond 
        ((= exp 0) 1)
        ((even? exp)
        (remainder
        (square (expmod base (/ exp 2) m))
        m))
    (else
        (remainder
        (* base (expmod base (- exp 1) m))
        m))))


; the fast-expt method ends up squaring really big numbers, whereas our expmod method applies the remainder at each step to keep the numbers small.