(define (make-point n d) 
    (cons n d))

(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

; segment is just a pair of points which is a pair of pairs.
(define (make-segment start end)
    (cons start end))

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment line-segment)
    (let ((sum-point (add-points (start-segment line-segment) (end-segment line-segment))))
    (make-point (/ (x-point sum-point) 2) (/ (y-point sum-point) 2))))

(define (add-points a b)
    (make-point (+ (x-point a) (x-point b)) (+ (y-point a) (y-point b))))

(print-point (midpoint-segment (make-segment (make-point 1 3) (make-point -4 0) ))) ; change values and answer is correct still!