(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                    (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

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