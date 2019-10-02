; iterative method in log time for multiplying numbers

(define (prod a b)
    (quick-prod a b 0))

(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (quick-prod a b counter)
    (cond 
        ((= b 1) (+ a counter))
        ((even? b) (quick-prod (double a) (halve b) counter))
        (else (quick-prod a (- b 1) (+ a counter)))))

(prod 8 7)
(prod 8 17)
(prod 5 20)