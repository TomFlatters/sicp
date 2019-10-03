(define (cont-frac n d k)
    (define (iter cur)
        (if(> cur k)
            0
            (/ (n cur) (+ (d cur) (iter (+ cur 1))) )))
    (iter 1))

(define (square i) (* i i))

(define (tan-cf x k)
    (cont-frac 
            (lambda (i) (if(= i 1) 
                            x
                            (- (square x))))
            (lambda (i) (- (* 2 i) 1))
            k))

(tan-cf 1 10) ; very accurate! 