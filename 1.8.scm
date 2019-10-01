; y is ≈ cube root of x
; we will write procedure(s) to find y, given x

(define (cuberoot x)
    (cbrt-iter 1.0 x)
)

(define (cbrt-iter guess x)
    (
        if(good-now? guess x)
            guess
            (cbrt-iter (improve guess x) x )
    )
)

(define (good-now? guess x) 
    (<
        (abs (- (* guess guess guess) x))
        (abs (* x 0.001))))

(define (improve guess x)
    (/ (+ (/ x (* guess guess)) (* guess 2)) 3)
)

(cuberoot 64)
(cuberoot 10000000)