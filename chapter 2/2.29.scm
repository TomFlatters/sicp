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

; c
(define (is-branch-balanced? mob)
    (= 
        (* (get-weight (branch-structure (left-branch mob))) (branch-length (left-branch mob)))
        (* (get-weight (branch-structure (right-branch mob))) (branch-length (right-branch mob)))))

(define (is-balanced? mob)
    (cond 
        ((null? mob) #t)
        ((not(pair? mob)) #t)
        ((is-branch-balanced? mob) (and (is-balanced? (branch-structure (left-branch mob))) (is-balanced? (branch-structure (right-branch mob)))))
        (else #f)))

(define m2 (make-mobile 
    (make-branch 4 6) 
    (make-branch 
        2 
        (make-mobile 
            (make-branch 5 8) 
            (make-branch 10 4))))) 

(is-balanced? m1)
(is-balanced? m2)

; d
; if we redefined the constructors, all we have to do is redefine the selectors in the same level of abstraction.
; (so we'd just have to change left-branch, right-branch, branch-length, branch-structure)