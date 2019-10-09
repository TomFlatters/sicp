; (a, b) => 2^a * 3^b
; we are using the prime factorization of a number to define a pair

(define (cons a b)
    (* (expt 2 a) (expt 3 b)))

(define (car p)
    (define (iter num count)
        (let ((new (/ num 2)))
        (if(integer? new)
            (iter new (+ count 1))
            count)))
    (iter p 0))

(define (cdr p)
    (define (iter num count)
        (let ((new (/ num 3)))
        (if(integer? new)
            (iter new (+ count 1))
            count)))
    (iter p 0))

(car (cons 3 6))
(cdr (cons 3 6))
(car (cons 4 2))
(cdr (cons 4 2))