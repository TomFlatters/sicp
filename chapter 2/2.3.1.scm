; represent rectangles in a plane
; rectangle are made of 4 points. given 3 of these points the 4th can be deduced
; a rectangle could be considered as 4 line segments joining the points, in the correct order
; we will assume the given points are correct representations of rectangles in our testing 

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

; pN is the Nth point
(define (rectangle p1 p2 p3 p4)
    (cons (cons p1 p2) (cons p3 p4)))
    
(define (get-p1 rect) (car (car rect)))
(define (get-p2 rect) (cdr (car rect)))
(define (get-p3 rect) (car (cdr rect)))
(define (get-p4 rect) (cdr (cdr rect)))

(define (perimeter rect)
    (+ (* 2 (length (make-segment (get-p1 rect) (get-p2 rect)))) (* 2 (length (make-segment (get-p1 rect) (get-p4 rect))))))

(define (length seg)
    (let (
        (x (- (x-point (start-segment seg)) (x-point (end-segment seg))))
        (y (- (y-point (end-segment seg)) (y-point (start-segment seg))))
    )
    (newline)
    (sqrt (+ (square x) (square y)))))

(define (square a) (* a a))

(define (area rect)
    (abs (* (length (make-segment (get-p1 rect) (get-p2 rect))) (length (make-segment (get-p1 rect) (get-p4 rect))))))

(perimeter (rectangle
    (make-point 1 1)
    (make-point 2 1)
    (make-point 2 2)
    (make-point 1 2))) ; should be 4

(area (rectangle
    (make-point 1 1)
    (make-point 2 1)
    (make-point 2 2)
    (make-point 1 2))) ; should be 1
