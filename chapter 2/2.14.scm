(define (par1 r1 r2)
    (div-interval (mul-interval r1 r2)
                  (add-interval r1 r2)))

(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
        (div-interval 
            one 
            (add-interval 
                (div-interval one r1) 
                (div-interval one r2)))))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                    (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
    (if (>= 0 (* (lower-bound y) (upper-bound y)))
        (error "Division error (interval spans 0)" y) 
        (mul-interval 
            x
            (make-interval 
                (/ 1.0 (upper-bound y))
                (/ 1.0 (lower-bound y))))))

(define (make-interval a b) 
    (if (< a b)
        (cons a b)
        (cons b a)))

(define (upper-bound i) (max (cdr i) (car i)))
(define (lower-bound i) (min (car i) (cdr i)))

(define (test)
    (let ( 
        (int1 (make-interval 80 82))
        (int2 (make-interval 47 55)))
    (div-interval int2 int2)))

(display (test)) ; A/A≠1

(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))
(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
    (make-interval (* center (/ (- 100 percent) 100)) (* center (/ (+ 100 percent) 100))))
(define (percent i)
    (- (* (/ (upper-bound i) (center i)) 100) 100))

(display (par1 (make-interval 1 3) (make-interval 3 5))) ; (3/8, 3/8)
(display (percent (par1 (make-interval 1 3) (make-interval 3 5)))) ; 82%
(display (par2 (make-interval 1 3) (make-interval 3 5))) ; (3/4, 15/16)
(display (percent (par2 (make-interval 1 3) (make-interval 3 5)))) ; 43%