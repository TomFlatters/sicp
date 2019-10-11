(define (map proc items)
    (if (null? items)
        `()
        (cons 
            (proc (car items))
            (map proc (cdr items)))))

(define (subsets s)
    (if (null? s)
        (list `())
        (let ((rest (subsets (cdr s))))
            (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define l (list 1 2 3))

(subsets l)