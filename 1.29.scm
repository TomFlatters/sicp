; f: function to integrate
; a,b: lower and upper limits of integration
; n: the number of steps to use in evaluation. an even integer
(define (simpsons-rule f a b n)
    ; (define (hval) 
    ;     (/ (- b a) n))
    (define (sum-iter term)
        (cond
        ((= term n) (f (+ a (* term (/ (- b a) n)))))
        ((= term 0) (+ (f a) (sum-iter (+ term 1))))
        (else       (if (even? term)
                        (+ (* 4 (f (+ a (* term (/ (- b a) n))))) (sum-iter (+ term 1)))
                        (+ (* 2 (f (+ a (* term (/ (- b a) n))))) (sum-iter (+ term 1)))))))
    (* (/ (/ (- b a) n) 3) (sum-iter 0)))
    
(define (cube x) (* x x x))

(simpsons-rule cube 0 1 100) ; 14803/60000 = 0.247
(simpsons-rule cube 0 1 1000) ; 1498003/6000000 = 0.2497
(simpsons-rule cube 0 1 10000) ; 149980003/600000000 = 0.2499