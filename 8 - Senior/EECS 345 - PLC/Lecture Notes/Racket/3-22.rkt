#lang racket


(define crash (lambda (n) (error 'crash)))

(define fact1
  (lambda (n)
    (if (zero? n)
        1
        (* n ((lambda (n)
                       (if (zero? n)
                           1
                           (* n ((lambda (n)
                                   (if (zero? n)
                                       1
                                       (* n (crash (- n 1)))))
                                 (- n 1)))))
              (- n 1))))))

(define fact2
  ((lambda (f)
     (lambda (n)
       (if (zero? n)
           1
           (* n (f (- n 1))))))
     ((lambda (f)
        (lambda (n)
          (if (zero? n)
              1
              (* n (f (- n 1))))))
      ((lambda (f)
        (lambda (n)
          (if (zero? n)
              1
              (* n (f (- n 1))))))
       crash))))

(define fact3
  ((lambda (mkf)
     (mkf (mkf (mkf (mkf crash)))))
   (lambda (f)
     (lambda (n)
       (if (zero? n)
           1
           (* n (f (- n 1))))))))

(define fact4
  ((lambda (mkf)
     (mkf mkf))
   (lambda (f)
     (lambda (n)
       (if (zero? n)
           1
           (* n ((f f) (- n 1))))))))

; append
(define myAppend
  ((lambda (mka)
     (mka mka))
   (lambda (a)
     (lambda (l1 l2)
       (if (null? l1)
           l2
           (cons (car l1) ((a a) (cdr l1) l2)))))))

; reverse
(define myReverse
  ((lambda (mkr mka)
     (mkr mkr mka))
   (lambda (f g) ; reverse function
      (lambda (l)
        (if (null? l)
            l
            ((g g) ((f f g) (cdr l)) (list (car l))))))
   (lambda (f) ; append function
     (lambda (l1 l2)
       (if (null? l1)
           l2
           (cons (car l1) ((f f) (cdr l1) l2)))))))

