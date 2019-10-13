(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
    (if(null? (car seqs))
        `()
        (cons
            (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))
(define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12))) 

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m))

(matrix-*-vector matrix (list 1 2 3))

(define (transpose mat)
    (accumulate-n cons `() mat))

(transpose matrix) 

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (row) (map (lambda (col) (dot-product col row)) cols)) m)))

(matrix-*-matrix (list (list 1 0) (list 0 1)) (list (list 99 32) (list 77 63))) ; identity check ;)