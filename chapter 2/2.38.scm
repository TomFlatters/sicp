(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter 
                (op result (car rest))
                (cdr rest))))
    (iter initial sequence))

(define (accumulate op initial sequence) 
    (if (null? sequence) 
        initial 
        (op (car sequence) 
            (accumulate op initial (cdr sequence))))) 
(define (fold-right op initial sequence) 
    (accumulate op initial sequence)) 

(fold-right / 1 (list 1 2 3)) ; 1/acc(2 3) --> .. --> 3/2
(fold-left / 1 (list 1 2 3)) ; (((1/1)/2)/3) --> 1/6
(fold-right list `() (list 1 2 3)) ; (list 1 acc(2 3)) --> .. --> (1 (2 (3 ())))
(fold-left list `() (list 1 2 3)) ; (list `() 1) --> (list (`() 1) 2) --> (list ((`() 1) 2) 3)

; the difference in the division problem was - mathematically - due to where the brackets were
; (the order of evaluation)

; the difference in the list problem was the order of evaluation also, but this time just due to 
; the way lists are constructed

; if the property is commutative and associative the result will be equal, i.e.

(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3)) 
(fold-right + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3)) 

; the reason we need commutative behaviour because we order our elements in reverse (left/right)
; the reason we need associative behaviour is due to the order of evaluation (i.e. (f f(a b) c) = (f a (f b c))