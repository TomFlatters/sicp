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

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

; (append (list 1 3) (list 88 7)) ; just checking it works!

(define (reverse items)
    (define (make-new new-list old-list)
        (if(null? old-list)
            new-list
            (make-new (cons (car old-list) new-list) (cdr old-list))))
    (make-new `() items))

(reverse (list 1 2 3 4))