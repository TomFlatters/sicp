; the given method:
(define (* a b)
(if (= b 0)
0
(+ a (* a (- b 1)))))

(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

; new approach:
(define (quick-* a b)
    (cond 
        ((= b 0) 0)
        ((even? b) (double (quick-* a (halve b))))
        (else (+ a (quick-* a (- b 1))))))

(quick-* 4 7)