(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

; a
(define (left-branch mobile)
    (car mobile))
(define (right-branch mobile)
    (car (cdr mobile)))
(define (branch-length branch)
    (car branch))
(define (branch-structure branch)
    (car (cdr branch)))

; b
(define (get-weight mob)
    (cond 
        ((null? mob) 0)
        ((not(pair? mob)) mob)
        (else (+ 
                (get-weight (branch-structure (left-branch mob)))
                (get-weight (branch-structure (right-branch mob)))))))


(define m1 (make-mobile 
    (make-branch 4 6) 
    (make-branch 
        5 
        (make-mobile 
        (make-branch 3 7) 
        (make-branch 9 8)))))

(get-weight m1) 