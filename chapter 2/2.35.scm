(define (count-leaves x)
    (cond 
        ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ 
                (count-leaves (car x))
                (count-leaves (cdr x))))))

 (define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

(define (count-leaves-acc x)
    (accumulate 
        (lambda (a b) 
            (+ 
                b 
                (cond 
                    ((null? a) 0)
                    ((not (pair? a)) 1)
                    (else (count-leaves-acc a)))))
        0
        x))

(define mytree (list 1 2 (list 3 (list (list 4 5 6) 7 8) 9) 10 (list 11)))

(count-leaves mytree)
(count-leaves-acc mytree)