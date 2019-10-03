; a (iterative)

(define (cont-frac n d k)
    (define (iter cur)
        (if(> cur k)
            0
            (/ (n cur) (+ (d cur) (iter (+ cur 1))) )))
    (iter 1))

(cont-frac 
        (lambda (i) 1)
        (lambda (i) 1)
        5) ; 5/8

(cont-frac 
        (lambda (i) 1)
        (lambda (i) 1)
        10) ; 55/89

(cont-frac 
        (lambda (i) 1)
        (lambda (i) 1)
        50) ; 12586269025/20365011074

; b (recursive)

(define (cont-frac-recursive n d cur max)
    (if(> cur max)
        0
        (/ (n cur) (+ (d cur) (cont-frac-recursive n d (+ cur 1) max)))))

(define (cont-frac-rec n d k)
    (cont-frac-recursive n d 1 k))

(cont-frac-rec
        (lambda (i) 1)
        (lambda (i) 1)
        50)