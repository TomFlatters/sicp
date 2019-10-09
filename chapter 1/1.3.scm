(define (sumsq1 a b c) 
    (cond
        ((and (> a b) (> c b)) (+ (* a a) (* c c)))
        ((and (> a b) (> b c)) (+ (* a a) (* b b)))
        (else (+ (* b b) (* c c)))
))

(define (sumsq2 a b c) (- (+ (* a a) (* b b ) (* c c)) (* (min a b c) (min a b c))))

(sumsq1 9 3 2)
(sumsq2 9 3 2)