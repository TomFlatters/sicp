; (cc 100 us-coins)

(define (cc amount coin-list)
    (define (coin-iter val coin-types)
        (cond 
            ((= val 0) 1)
            ((or (< val 0) (null? coin-types)) 0)
            (else (+ 
                    (cc val (next coin-types))
                    (cc (- val (car coin-types)) coin-types)))))
    (coin-iter amount coin-list))

(define (next coin-types)
    (cdr coin-types))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins) ; 292
(cc 100 uk-coins) ; 104561

(define (cc-2 amount coin-values)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no-more? coin-values)) 0)
          (else
           (+ (cc-2 amount
                  (except-first-denomination coin-values))
              (cc-2 (- amount (first-denomination coin-values))
                  coin-values)))))

(define (first-denomination values)
    (car values))
(define (except-first-denomination values)
    (cdr values))
(define (no-more? values)
    (null? values))

(cc-2 100 us-coins) ; 292
(cc-2 100 uk-coins) ; 104561

; the order doesnt matter as the algorithm traverses every branch of the tree that is the possible combinations.
; however i think using the larger denominations first may improve speed.