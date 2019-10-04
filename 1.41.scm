(define (double f)
    (lambda (i) (f (f i))))

(define (inc x) (+ x 1))

((double inc) 1) ; 3

(((double (double double)) inc) 5) ; 21