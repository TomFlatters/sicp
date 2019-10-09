(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

(define (last-pair l)
    (define (get-last new)
        (if(= (length new) 1)
            (car new)            
            (get-last (cdr new))))
    (get-last l))

(define rands (list 23 72 149 34))

(last-pair rands)