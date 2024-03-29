(define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)

(define tolerance 0.001)

(define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess))

(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
        tolerance))
    (define (try guess)
        (let ((next (f guess)))
        (if (close-enough? guess next)
        next
        (try next))))
    (try first-guess))

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
    (lambda (x) (+ 
                    (cube x) 
                    (* a (square x)) 
                    (* b x) 
                    c)))

(define (sqrt x)
    (newtons-method (lambda (y) (- (square y) x)) 1.0))

(newtons-method (cubic 1 2 3) 1)

