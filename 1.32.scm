(define (accumulate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner (term a) result))))
    (iter a null-value))

(define (accumulate-recursion combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate-recursion combiner null-value term (next a) next b))))

(define (sum term a next b)
    (accumulate + 0 identity a inc b))
(define (sum-recursion term a next b)
    (accumulate-recursion + 0 identity a inc b))

(define (product term a next b)
    (accumulate * 1 identity a inc b))
(define (product-recursion term a next b)
    (accumulate-recursion * 1 identity a inc b))

(define (identity x) x)
(define (inc x) (+ x 1))

(sum identity 1 inc 10)
(sum-recursion identity 1 inc 10)
(product identity 1 inc 5)
(product-recursion identity 1 inc 5)
