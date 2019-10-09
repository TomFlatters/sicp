(define (compose f1 f2)
    (lambda (i) (f1 (f2 i))))

((compose 
    (lambda (i) (* i i)) 
    (lambda (i) (+ 1 i))) 6)