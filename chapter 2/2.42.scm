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

; helper functions above
(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map 
                            ; add a queen in the new-row of the kth column
                            (lambda (new-row)
                                (adjoin-position new-row k rest-of-queens))
                            (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1))))))
    (queen-cols board-size))

(define (adjoin-position row col others)
    (cons (make-position row col) others))

(define (make-position row col)
    (list row col))

(define (get-row position)
    (car position))
(define (get-col position)
    (car (cdr position)))

(define empty-board `())

; my version was just poorly written in compairsion to this one
(define (safe? k positions) 
    (let ((trial (car positions)) 
        (trial-row (caar positions)) 
        (trial-col (cadar positions)) 
        (rest (cdr positions))) 
        (accumulate 
            (lambda (pos result) 
                (let ((row (car pos)) 
                    (col (cadr pos))) 
                (and (not (= (- trial-row trial-col) 
                                (- row col))) 
                        (not (= (+ trial-row trial-col) 
                                (+ row col))) 
                        (not (= trial-row row)) 
                        result))) 
            true 
            rest))) 

(queens 5)