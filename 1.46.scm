(define (iterative-improve good-enough? improve-guess)
    (lambda (x) 
        (define (try guess) 
            (if (good-enough? guess) 
                guess
                (try (improve-guess guess))))
        (try x)))

(define (close-enough? v1 v2) 
    (< (abs (- v1 v2)) 0.001)) 

(define (fixed-point f first-guess) 
   ((iterative-improve 
     (lambda (x) (close-enough? x (f x))) 
     f) 
     first-guess)) 

(define (average x y) (/ (+ x y) 2))
  
(define (sqrt x) 
   ((iterative-improve 
     (lambda (i) 
       (< (abs (- (square i) x)) 
          0.0001)) 
     (lambda (i) 
       (average i (/ x i)))) 
    1.0)) 
  
(sqrt 7)