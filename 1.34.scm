(define (f g) (g 2))

(f (lambda (x) (+ x 2))) ;4
(f (lambda (z) (* z (+ z 1)))) ;6
(f f) ; (f f) => (f 2) => (2 2) => the object is not applicable