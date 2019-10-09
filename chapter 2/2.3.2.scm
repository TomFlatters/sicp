 ;; Point library 
 (define (make-point x y) (cons x y)) 
 (define (x-point p) (car p)) 
 (define (y-point p) (cdr p)) 
 (define (point-dist p1 p2) 
   (sqrt (+ (square (- (x-point p1) (x-point p2))) 
            (square (- (y-point p1) (y-point p2)))))) 
  
 ;; Segment library 
 (define (make-segment p1 p2) (cons p1 p2)) 
 (define (start-seg p) (car p)) 
 (define (end-seg p) (cdr p)) 
 (define (seg-len seg) (point-dist (start-seg seg) 
                                   (end-seg seg))) 

; we will now define a rectangle as two segments that are perpendicular sides.
; this approach means we can define rectangle differently but still use the same area & perimeter procedures.

(define (rectangle-1 p1 p2 p3 p4)
    (cons (make-segment p1 p2) (make-segment p1 p4)))
(define (rectangle-2 seg1 seg2)
    (cons seg1 seg2))
; etc...

;; Get rect. segments
(define (seg-1 r) (car r))
(define (seg-2 r) (cdr r))

(define (perimeter r)
    (* 2 (+ (seg-len (seg-1 r)) (seg-len (seg-2 r)))))
(define (area r)
    (abs (* (seg-len (seg-1 r)) (seg-len (seg-2 r)))))

(perimeter (rectangle-1 
            (make-point 0 0)
            (make-point 1 0)
            (make-point 1 1)
            (make-point 0 1)))
(area (rectangle-1 
            (make-point 0 0)
            (make-point 1 0)
            (make-point 1 1)
            (make-point 0 1)))
(perimeter (rectangle-2
            (make-segment (make-point 0 0) (make-point 1 0))
            (make-segment (make-point 0 0) (make-point 0 1))))
(area (rectangle-2
            (make-segment (make-point 0 0) (make-point 1 0))
            (make-segment (make-point 0 0) (make-point 0 1))))