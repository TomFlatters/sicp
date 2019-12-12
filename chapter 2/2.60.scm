(define (element-of-set? x set)
    (cond 
        ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
    (cons x set))

(define (intersection-set set1 set2)
    (cond 
        ((or (null? set1) (null? set2)) `())
        ((element-of-set? (car set1) set2)
            (cons 
                (car set1)
                (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
    
(define (union-set set1 set2)
    (cond
        ((null? set1) set2)
        ((null? set2) set1)
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)))))

(union-set (list 1 2 3 4) (list 1 2 3 4 5))
(union-set (list 1 2 4) (list 1 2 3 4 5))
(union-set (list 1 2 0) (list 7 2 3 4))

; the time complexities and efficiencies just depend on the implementations:
; for instance, I have implemented these procedures to simply adjoin all elements, since we are allowing duplicates.
; yet, in some application, this may not be desired behaviour. This is a matter of implementation