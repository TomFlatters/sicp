; Pascal's Triangle
(define (pascal row col)
    (if (= col 0)
        1
        (if(= col row) 
        1
        (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

(pascal 1 1)
(pascal 1 0)
(pascal 4 3)
(pascal 3 2)

;1:1
;2:1  1
;3:1  2   1
;4:1  3   3   1
;5:1  4   6   4   1