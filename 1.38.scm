(define (cont-frac n d k)
    (define (iter cur)
        (if(> cur k)
            0
            (/ (n cur) (+ (d cur) (iter (+ cur 1))) )))
    (iter 1))

(define (euler-d x)
    (if(= (remainder 3 (+ x 1)) 0)
        (/ (* (+ x 1) 2) 3)
        1))

(cont-frac
    (lambda (i) 1)
    euler-d
    10) ; good to 3dp