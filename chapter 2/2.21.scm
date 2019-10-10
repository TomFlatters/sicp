(define (map proc items)
    (if (null? items)
        `()
        (cons 
            (proc (car items))
            (map proc (cdr items)))))

(define (square-list-1 items)
    (if (null? items)
        `()
        (cons 
            (square (car items))
            (square-list-1 (cdr items)))))

(define (square x) (* x x))

(define (square-list-2 items)
    (map square items))

(square-list-1 (list 1 4 3 2))
(square-list-2 (list 1 4 3 2))