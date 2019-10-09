(define (fast-prime? n times)
    (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
    (cond 
        ((= exp 0) 1)
        ((even? exp)
        (remainder
        (square (expmod base (/ exp 2) m))
        m))
    (else
        (remainder
        (* base (expmod base (- exp 1) m))
        m))))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 10)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

; from 1.21
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (search-for-primes number counter)
    (cond 
        ((> counter 2) )
        ((even? number) (search-for-primes (+ number 1) counter))
        ((prime? number) 
            (timed-prime-test number)
            (search-for-primes (+ number 2) (+ counter 1)))
        (else (search-for-primes (+ number 2) counter))))

(search-for-primes 1000000000000 0) 
(search-for-primes 10000000000000 0) 

; i get time is zero... modern PC too quick
; the time complexity of fast-primes is based on that of the fermat-test method
; so there is O(log(n)) growth