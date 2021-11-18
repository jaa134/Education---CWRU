#lang racket

; write factorial in tail recursion with an accumulator
(define factorial_acc
  (lambda (n a)
    (if (zero? n)
      a
      (factorial_acc (- n 1) (* a n)))))

(define factorial
  (lambda (n)
    (factorial_acc n 1)))
  
; write append in tail recursion with an accumulator
(define append_acc
  (lambda (l1 l2 acc)
    (if (null? l1)
      acc
      (append_acc (cdr l1) l2 (cons (car l1) acc)))))

(define append*
  (lambda (l1 l2)
    (append_acc l1 l2 l2)))




(define factorial-cps
  (lambda (n return)
    (if (zero? n)
        (return 1)
        (factorial-cps (- n 1) (lambda (v) (return (* n v)))))))

(define factorial2
  (lambda (n)
    (factorial-cps n (lambda (v) v))))

; rmeove first continuation passign style
(define removefirst-cps
  (lambda (a lis return)
    (cond
      [(null? lis) (return '())]
      [(eq? a (car lis)) (return (cdr lis))]
      [else (removefirst-cps a (cdr lis) (lambda (v) (return (cons (car lis) v))))])))
                                  
(define removefirst
  (lambda (a lis)
    (removefirst-cps a lis (lambda (v) v))))

; append in continuation passing style

; removeall in conituation passig style