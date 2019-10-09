(define (repeated f n)
    (if(< n 1)
        (lambda (i) i)
        (compose f (repeated f (- n 1)))))

(define (compose f1 f2)
    (lambda (i) (f1 (f2 i))))

(define (square x) (* x x))

((repeated square 2) 5)