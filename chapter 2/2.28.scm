; will do this one recursively, for a change!

(define (fringe tree)
    (cond
        ((null? tree) `())
        ((not (pair? tree)) (cons tree `()))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))

(fringe (list x x))
