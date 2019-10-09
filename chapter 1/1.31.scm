(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))

(define (product-recursion term a next b)
    (if (> a b)
        1
        (* (term a) (product-recursion term (+ a 1) next b))))

(define (identity x)
    x)

(define (inc y)
    (+ y 1))

(define (factorial a b)
    (product identity a inc b))

(factorial 1 5)

(define (pi-term z)
    (if(even? z)
        (/ (+ z 2) (+ z 1))
        (/ (+ z 1) (+ z 2))))

(* 4 (product pi-term 1 inc 100))
(* 4 (product-recursion pi-term 1 inc 100))
(* 4 (product pi-term 1 inc 1000))
(* 4 (product pi-term 1 inc 10000))

