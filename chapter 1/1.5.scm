(define(p) (p))
(define(test x y)(if(= x 0) 0 y))
(test 0 (p))

; under applicative order - we must resolve the arguments before we resolve the expression.
; this means we must resolve (p)
; but this just tells us to resolve (p) again, and a recursion occurs
; the result is an infinite loop

; under evaluative order, we expand the procedure into its elemental form
; this means we get: 
; (test 0 (p))
; (if(= 0 0) 0 (p))
; 0
; [and 0 is returned]