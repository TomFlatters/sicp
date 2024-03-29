(define (accumulate op initial sequence) 
    (if (null? sequence) 
        initial 
        (op (car sequence) 
            (accumulate op initial (cdr sequence))))) 

(define (flatmap proc seq)
    (accumulate append `() (map proc seq)))

(define (enumerate-interval low high) 
    (if (> low high) 
        `() 
        (cons low (enumerate-interval (+ low 1) high)))) 

(define (unique-pairs n)
        (flatmap 
            (lambda (i) (map 
                            (lambda (j) (list i j)) 
                            (enumerate-interval 1 (- n 1))))
            (enumerate-interval 1 n)))

(unique-pairs 5)

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))

 (define (prime? x) 
   (define (test divisor) 
     (cond ((> (* divisor divisor) x) true) 
           ((= 0 (remainder x divisor)) false) 
           (else (test (+ divisor 1))))) 
   (test 2)) 

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum?
                (unique-pairs n))))

(prime-sum-pairs 4)