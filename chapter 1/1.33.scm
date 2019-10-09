
 (define (prime? n) (miller-rabin n))
 
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

(define (accumulate-filter combiner null-value term a next b filter)
    (define (iter a result)
        (if (> a b)
            result
            (if(filter a)
            (iter (next a) (combiner (term a) result))
            (iter (next a) (combiner null-value result)))))
    (iter a null-value))

(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (identity x) x)

(define (gcd m n) 
    (cond ((< m n) (gcd n m)) 
         ((= n 0) m) 
         (else (gcd n (remainder m n))))) 
  
(define (relative-prime? m n) 
    (= (gcd m n) 1))

(define (product-of-relative-primes a b)
    (define (filter x)
        (relative-prime? x b))
    (accumulate-filter * 1 identity a inc b filter)) 

(define (sum-of-prime-squares a b)
    (accumulate-filter + 0 square a inc b prime?))

(sum-of-prime-squares 1 7)
(product-of-relative-primes 1 10)