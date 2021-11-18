#lang racket
; squareroot function using Newton's method
;   new = old - (old * old - value) / (2 * old)
(define squareroot2
  (lambda (x n)
    (if (zero? n)
        x
        (let ((old (squareroot2 x (- n 1))))
          (- old (/ (- (* old old) x) (* 2 old)))))))

(define squareroot3
  (lambda (x n)
    (if (zero? n)
        x
        ((lambda (old) (- old (/ (- (* old old) x) (* 2 old))))
           (squareroot3 x (- n 1))))))


; calculate the length of a list
(define len
  (lambda (lis)
    (if (null? lis)
        0
        (+ 1 (len (cdr lis))))))

;calculate the length of a list using an accumulator and tail recursion
; tail recursion is the last step in the function body is the recursive call.
; The function returns whatever the recursive call returns.
; On tail recursion, stack frames are replaced by the next function call.
(define len-acc
  (lambda (lis acc)
    (if (null? lis)
        acc
        (len-acc (cdr lis) (+ 1 acc)))))

(define len2
  (lambda (lis)
    (len-acc lis 0)))

;sum the numbers in a list of atoms
(define sumnumbers
  (lambda (lis)
    (cond
      ((null? lis) 0)
      ((number? (car lis)) (+ (car lis) (sumnumbers (cdr lis))))
      (else (sumnumbers (cdr lis))))))

;sum using accumulator
(define sumnumbers-acc
  (lambda (lis acc)
    (cond
      ((null? lis) acc)
      ((number? (car lis)) (sumnumbers-acc (cdr lis) (+ (car lis) acc)))
      (else (sumnumbers-acc (cdr lis) acc)))))

(define sumnumbers2
  (lambda (lis)
    (sumnumbers-acc lis 0)))

(define sumnumbers-cps
  (lambda (lis return)
    (cond
      ((null? lis) (return 0))
      ((number? (car lis)) (sumnumbers-cps (cdr lis) (lambda (v) (return (+ (car lis) v)))))
      (else (sumnumbers-cps (cdr lis) return)))))