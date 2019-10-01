; sin(x) = 3sin(x/3) - 4sin^3(x/3)
; sin(x) = x for x < 0.1 rads

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
(if (not (> (abs angle) 0.1))
angle
(p (sine (/ angle 3.0)))))

; a: (sine 12.15) - how many times is p applied?
; (p (sine (/ 12.15 3.0)))
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p 0.05)))))
; = 5 times (by my rough calculations)

; b: what is the order of growth in space and number of steps as 'a' grows for (sine a)?
; if 'a' --> '3a' then one step is added (given 3a > 0.1).
; mathematically: 
; a/3^n < 0.1 yields n = O(log(a)) for space complexity
; #steps is proportional to growth in space therefore they are both the same

