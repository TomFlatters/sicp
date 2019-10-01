; the given functions are:

(define (sumone a b)
(if (= a 0) b (inc (sumone (dec a) b))))

(define (sumtwo a b)
(if (= a 0) b (sumtwo (dec a) (inc b))))

; helper functions are needed:

(define (inc a)
    (+ a 1))

(define (dec a)
    (- a 1))

; where we are to evaluate:
(sumone 4 5)
(sumtwo 4 5)

; SUMONE IS RECURSIVE - IT OCCURS IN LINEAR TIME AND LINEAR SPACE
; (sumone 4 5) -->
; (if (= 4 0) 5 (inc (sumone (dec 4) 5)))
; (if (= 4 0) 5 (inc (sumone (- 4 1) 5)))
; (if (= 4 0) 5 (inc (sumone 3 5)))
; ...
; (inc (if (= 3 0) 5 (inc sumone (- 3 1) 5)))
; ...
; (inc (inc (inc (inc 5))))
; 9

; SUMTWO IS ITERATIVE - IT OCCURS IN LINEAR TIME AND CONSTANT SPACE
; (sumtwo 4 5) --> 
; (if (= 4 0) 5 (sumtwo (dec 4) (inc 5)))
; (sumtwo 3 6)
; ...
; (sumtwo 0 9)
; (if (= 0 0) 9 (sumtwo (dec 0) (inc 9)))
; 9