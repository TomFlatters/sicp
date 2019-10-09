(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b)
)

; calling the procedure first evaluates the if statement. this is because we must eval the operators and operands before the expression
; then we have a simple compound expression

(a-plus-abs-b 2 3)
(a-plus-abs-b 2 -4)