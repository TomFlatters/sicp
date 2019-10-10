(define (for-each proc items)
    (define (iter-each l)
        (proc (car l))
        (if(null? (cdr l))
            (display "")
            ((iter-each (cdr l)))))
    (iter-each items))

(for-each (lambda(x) (newline) (display x)) (list 57 321 88))