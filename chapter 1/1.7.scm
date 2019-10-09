; Let's recall the old square root method:

( define(sqrt x)
 (sqrt-iter 1.0 x) )

( define(sqrt-iter guess x)
    (if(good-enough? guess x)
        guess
        ( sqrt-iter (improve guess x) x ) ) )

(define(improve guess x)
    (average guess (/ x guess) ) )

(define(average x y)
    (/ (+ x y) 2) )

(define(good-enough? guess x)
    (< (abs (- (squareguess) x)) 0.001) )

; And summarise it by saying:
; 1. the square root is guessed to be 1.
; 2. we call an iterative process with a guess and the number to find the root of.
; 3. if the predicate - that the guess is good enough - is true, then we return the guess. else, we improve the guess and call the function again
; 4. to improve the guess, we call procedure "improve", which takes the average of the guess and x/guess.
; 5. the average function must also be defined.
; 6. the predicate to the iterative process is a separate procedure that returns a boolean.

; small numbers will not work effectively with this method because the precision is too low for a reasonable degree of accuracy.
; large number will not work effectively because of the precision of the computer.

; we will improve this method by stopping our search when the next guess is within 0.1% of the old guess

(define (good-now? guess x) 
    (<
        (abs (- (improve guess x) guess))
        (abs (* guess 0.001))))

(define (new-sqrt-iter guess x)
    (if(good-now? guess x)
        guess
        ( new-sqrt-iter (improve guess x) x )
    ))

(define (new-sqrt x)
    (new-sqrt-iter 1.0 x)
)

(new-sqrt 0.00354)
(new-sqrt 32463446)

; the new-sqrt procedure will always stop within a percentage of truth, so it is better for small numbers,
; it means we avoid lag with large numbers, too