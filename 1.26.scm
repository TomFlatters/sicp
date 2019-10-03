; Louis' method explicitly calculates the expmod twice at each step
; => doubling the size of the exponent doubles the number of steps because if...

; (expmod base exp m) has N steps

; then...

; (expmod base (* 2 exp) m) 
; --> (remainder (*
;                   (expmod base exp m)
;                   (expmod base exp m)) m)
; => at least 2N steps

; therefore...

; exp --> 2exp => N --> 2N
; => exp proportional to N
; => O(exp) time