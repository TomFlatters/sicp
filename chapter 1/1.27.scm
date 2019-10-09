(define (has-fooled-the-test? cur n)
    (cond
        ((>= cur n) true)
        ((fermat-test cur n) (has-fooled-the-test? (+ cur 1) n))
        (else false)))

(define (fermat-test cur n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it cur))

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

; 561, 1105, 1729, 2465, 2821, and 6601
(has-fooled-the-test? 1 561)
(has-fooled-the-test? 1 1105)
(has-fooled-the-test? 1 1729)
(has-fooled-the-test? 1 2465)
(has-fooled-the-test? 1 2821)
(has-fooled-the-test? 1 6601)