; ( define (new-if predicate then-clause  else-clause)
;     (cond(predicate then-clause)(else else-clause))
; )

; the above code, when called in the following context:

; ( define (sqrt-iter guess x)
;     ( new-if (good-enough? guess x)
;              guess
;              ( sqrt-iter (improveguess x) x)))

; the new-if function will not work if it is immediately evaluated (i.e. applicative order)
; because this will cause an infinite loop
; because the new-if procedure is a function
; and so the sqrt-iter (last argument) will need to be evaluated
; but this argument calls itself infinitely