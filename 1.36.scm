(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
        tolerance))
    (define (try guess)
        (let ((next (f guess)))
        (newline)
        (display next)
        (if (close-enough? guess next)
        next
        (try next))))
    (try first-guess))

; x^x = 1000 <=> ln(1000)/ln(x) = x
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2) ; much fewer steps with the average damping added !