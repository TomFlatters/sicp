 (define (average x y) 
   (/ (+ x y) 2)) 

; (x + f(x)) / 2
 (define (average-damp f) 
   (lambda (x) (average x (f x)))) 
  
 (define tolerance 0.00001) 
  
; find the fixed point of a given function such f(x)=x, with some first-guess
 (define (fixed-point f first-guess) 
   (define (close-enough? v1 v2) 
     (< (abs (- v1 v2)) tolerance)) 
   (define (try guess) 
     (let ((next (f guess))) 
       (if (close-enough? guess next) 
           next 
           (try next)))) 
   (try first-guess)) 
  
; return a procedure that applies f 'n' times to some argument 'x'
 (define (repeated f n) 
   (if (= n 1) 
       f 
       (lambda (x) (f ((repeated f (- n 1)) x))))) 

;   
 (define (get-max-pow n) 
   (define (iter p r) 
     (if (< (- n r) 0) 
         (- p 1) 
         (iter (+ p 1) (* r 2)))) 
   (iter 1 2)) 
  
; raise b to power p and return the result ('res')
 (define (pow b p)
    ; helper functions
   (define (even? x) 
     (= (remainder x 2) 0)) 
   (define (square x) 
     (* x x)) 
   (define (iter res a n) 
     (if (= n 0) 
         res 
         ; use log time with the half power technique depending on the power 'n'
         (if (even? n) 
             (iter res (square a) (/ n 2)) 
             (iter (* res a) a (- n 1))))) 
   (iter 1 b p)) 
  
  ; repeat the average-damp function 'get-max-pow' number of times
  ; to a function that calculates the fixed point of y^(n-1)
 (define (nth-root n x) 
   (fixed-point ((repeated average-damp (get-max-pow n)) 
                 (lambda (y) (/ x (pow y (- n 1))))) 
                1.1)) 

(nth-root 5 10)