(define (same-parity first . l)
    (let ((parity (if (even? first) even? odd?)))
    (define (check same items)
        (if(null? items)
            same
            (if(parity (car items))
                (check (append same (cons (car items) `())) (cdr items))
                (check same (cdr items)))))
    (cons first (check `() l))))

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(same-parity 1 2 3 4 5 6 7 7 8)