(define (make-rat n d) 
    (let ((g ((if (< d 0) - +) (abs (gcd n d))))) 
        (cons (/ n g) (/ d g)))) 

(define (gcd a b)
    (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

(print-rat (make-rat -3 4))
(print-rat (make-rat 3 -4))
(print-rat (make-rat -3 -4))
(print-rat (make-rat 3 4))
