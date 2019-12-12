(define (equal? a b)
    (cond 
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        ((and (list? a) (list? b))
            (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        (else #f)))

(equal? '(this is a list) '(this is a list))

(equal? '(this is a list) '(this (is a) list))