(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                    (+ (upper-bound x) (upper-bound y))))

(define (mul-interval-new x y)
    (let (  (xl (lower-bound x))
            (xu (upper-bound x))
            (yl (lower-bound y))
            (yu (upper-bound y)))
    (cond 
        (((< xl 0) and (< xu 0))
            (cond 
                (((< yl 0) and (< yu 0)) (make-interval (* xu yu) (* xl yl)))
                (((< yl 0) and (> yu 0)) (make-interval (* xl yu) (* xl yl)))
                (((> yl 0) and (> yu 0)) (make-interval (* xl yu) (* xu yl)))))
        (((< xl 0) and (> xu 0)) 
            (cond 
                (((< yl 0) and (< yu 0)) (make-interval (* xu yl) (* xl yl)))
                ; we still have to test the one below
                (((< yl 0) and (> yu 0)) 
                    (let (
                        (p1 (* (lower-bound x) (lower-bound y)))
                        (p2 (* (lower-bound x) (upper-bound y)))
                        (p3 (* (upper-bound x) (lower-bound y)))
                        (p4 (* (upper-bound x) (upper-bound y))))
                    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
                (((> yl 0) and (> yu 0)) (make-interval (* xl yu) (* xu yu)))))
        (((> xl 0) and (> xu 0)) 
            (cond 
                (((< yl 0) and (< yu 0)) (make-interval (* xu yu) (* xl yl)))
                (((< yl 0) and (> yu 0)) (make-interval (* xu yl) (* xu yu)))
                (((> yl 0) and (> yu 0)) (make-interval (* xl yl) (* xu yu))))))))

(define (make-interval a b) 
    (if (< a b)
        (cons a b)
        (cons b a)))

(define (upper-bound i) (max (cdr i) (car i)))
(define (lower-bound i) (min (car i) (cdr i)))

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

(display (make-center-percent 50 10)) ; 45,55
(display (center (make-center-percent 50 10))) ; 50
(display (percent (make-center-percent 50 10))) ; 10
