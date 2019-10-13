(define (accumulate op initial sequence) 
    (if (null? sequence) 
        initial 
        (op (car sequence) 
            (accumulate op initial (cdr sequence))))) 

(define (triple-sum n s)
    (filter 
        triple?
        (flatmap
            (lambda (x) 
                (map 
                    (lambda (y) 
                        (list x y (if(> (- s x y) n) -1 (- s x y)))) 
                    (enumerate-interval 1 n)))
            (enumerate-interval 1 n))))

(define (flatmap proc seq)
    (accumulate append `() (map proc seq)))

(define (enumerate-interval low high) 
    (if (> low high) 
        `() 
        (cons low (enumerate-interval (+ low 1) high)))) 

(define (triple? list)
    (if(> (car (cdr (cdr list))) 0)
        #t
        #f))

(triple-sum 4 6)