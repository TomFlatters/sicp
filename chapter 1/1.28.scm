
 (define (miller-rabin n) 
   (miller-rabin-test (- n 1) n)) 
  
 (define (miller-rabin-test a n) 
   (cond ((= a 0) true) 
         ; expmod is congruent to 1 modulo n 
         ((= (expmod a (- n 1) n) 1) (miller-rabin-test (- a 1) n)) 
         (else false))) 
  
 (define (expmod base exp m) 
   (cond ((= exp 0) 1) 
         ((even? exp) 
          (let ((x (expmod base (/ exp 2) m))) 
            (if (non-trivial-sqrt? x m) 0 (remainder (square x) m)))) 
         (else 
          (remainder (* base (expmod base (- exp 1) m)) 
                     m)))) 
  
 (define (non-trivial-sqrt? n m) 
   (cond ((= n 1) false) 
         ((= n (- m 1)) false) 
         ; book reads: whose square is equal to 1 modulo n 
         ; however, what was meant is square is congruent 1 modulo n 
         (else (= (remainder (square n) m) 1)))) 

(miller-rabin 3)
(miller-rabin 30)