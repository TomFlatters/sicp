; for addition (as an example), the width can be defined:
;(a,b) + (c,d) --> (a+c,b+d) [width = b+d-a-c = width(a,b) + width(d,c)]
;(1,4) + (2,7) --> (3,11) 

; for multipcation:
;(a,b) * (c,d) --> (a*c,b*d) [width = b*d-a*c which is no function of original widths]
; proof by counterexample:
;  [0, 10] * [0, 2] = [0, 20]   (width = 10)
;  [-5, 5] * [-1, 1] = [-5, 5]   (width = 5)
; credit for counterexamples to jz
