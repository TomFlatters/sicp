 (define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 

(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) `() sequence))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))

(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(append (list 1 2) (list 3 4))
(map (lambda (i) (+ i 1)) (list 1 2 3 4))
(length (list 1 2 3 4))