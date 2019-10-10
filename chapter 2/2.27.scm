; basically we have to traverse the tree that is built by the list, 
; and reverse every list we find in order

(define (deep-reverse items)
    (define (make-new new-list old-list)
        (cond 
            ((null? old-list) new-list)
            ((not (list? old-list)) 
                (if (not(null? new-list)) (cons old-list new-list) old-list))
            (else 
                (make-new (cons (make-new `() (car old-list)) new-list) (cdr old-list)))))
    (make-new `() items))

(deep-reverse (list 1 23 4))
(deep-reverse (list (list 1 2 3) 3 4 (list 1 (list 2 3))))