(define (map proc items)
    (if (null? items)
        `()
        (cons 
            (proc (car items))
            (map proc (cdr items)))))

(define (square-list-1 items)
    (if (null? items)
        `()
        (cons 
            (square (car items))
            (square-list-1 (cdr items)))))

(define (square x) (* x x))

(define (square-list-2 items)
    (map square items))

(define (square-tree-1 tree)
    (cond 
        ((null? tree) `())
        ((not (pair? tree)) (square tree))
        (else (cons 
                (square-tree-1 (car tree))
                (square-tree-1 (cdr tree))))))

(define mytree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree-2 tree)
    (map 
        (lambda (sub-tree) 
            (if(pair? sub-tree)
                (square-tree-2 sub-tree)
                (square sub-tree)))
        tree))

(square-tree-1 mytree)
(square-tree-2 mytree)