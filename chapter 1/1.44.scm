(define dx 0.1)

(define (average a b c)
    (/ (+ a b c) 3))

(define (smooth f)
    (lambda (x) (average (f (+ x dx)) (f x) (f (- x dx)))))

(define (cube x)
    (* x x x))

((smooth cube) 3)

(define (compose f1 f2)
    (lambda (i) (f1 (f2 i))))

(define (repeated f n)
    (if(< n 1)
        (lambda (i) i)
        (compose f (repeated f (- n 1)))))

(define (n-fold-smooth f n)
    ((repeated smooth n) f))

((n-fold-smooth cube 3) 3)