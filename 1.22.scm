(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
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

(search-for-primes 1000000000000 0) ;1.2s each
(search-for-primes 10000000000000 0) ;4.1s each, sqrt(10)≈4.1/1.2 :)

; the O(sqrt(n)) time estimate becomes more accurate the larger the numbers we use