(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))))
    (iter a 0))

(define (cube x)
    (* x x x))

(define (inc y)
    (+ y 1))

(define (sum-of-cubes a b)
    (sum cube a inc b))

(sum-of-cubes 1 10)