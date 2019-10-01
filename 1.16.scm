; even? is a builtin function - great!

(define (square x)
    (* x x))

(define (exp b n)
    (fast-exp b n 1))

(define (fast-exp b n counter)
    (cond 
        ((= b 0) 0)
        ((= n 0) 1)
        ((= n 1) (* counter b))
        ((even? n) (fast-exp 
                        (square b)
                        (/ n 2)
                        counter
                        ))
        (else (fast-exp
                    b
                    (- n 1)
                    (* b counter)))))

(exp 2 7)