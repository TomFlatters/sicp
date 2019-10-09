; define 'cons' to be a procedure that takes two parameters and returns a procedure.
; the returned procedure is applied to the two initial arguments of 'cons'
(define (cons x y)
    (lambda (m) (m x y)))

; define 'car' to be a procedure that takes one procedure 'z' as argument and applies
; the 'z' procedure to return 'p' - the first of two arguments
(define (car z)
    (z (lambda (p q) p)))

(car (cons 1 2))
; ((cons 1 2) (lambda (p q) p))
; ((lambda (m) (m 1 2)) (lambda (p q) p))
; ((lambda (p q) p) 1 2)
; 1
; [ This can also be shown for the general case of x,y,p,q etc ]

(define (cdr z)
    (z (lambda (p q) q)))

(cdr (cons 1 2))