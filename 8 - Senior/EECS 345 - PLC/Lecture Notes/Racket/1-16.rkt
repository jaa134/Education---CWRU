#lang racket

;; returns the length of a list
(define len
  (lambda (lis)
    (if (null? lis)
      0
      (+ 1 (len (cdr lis))))))

;; determine if an atom is a member of a list
(define if_member?
  (lambda (a lis)
    (if (null? lis)
      #f
      (if (eq? a (car lis))
        #t
        (if_member? a (cdr lis))))))


;; rewrite member? but use cond instead of if
(define cond_member?
  (lambda (a lis)
    (cond
      [(null? lis)        #f]
      [(eq? a (car lis))  #t]
      [else               (cond_member? a (cdr lis))])))


;; factorial (factorial 4) => 24
;; zero? test if a number is 0
(define factorial?
  (lambda (a)
    (cond
      [(zero? a)  1]
      [else       (* a factorial? (- a 1))]))) 
                   
;; countnums (countnums '(a b 4 c 5 d 6 e)) => 3
;; returns the number of numbers in a list
;; number?
(define countnums
  (lambda (lis)
    (cond
      [(null? lis)          0]
      [(number? (car lis))  (+ 1 (countnums (cdr lis)))]
      [else                 (countnums (cdr lis))])))
    
;; sumnums (sumnums '(a b 4 c 5 d 6 e)) => 15
;; sum the numbers in a list
(define sumnums
  (lambda (lis)
    (cond
      [(null? lis)          0]
      [(number? (car lis))  (+ (car lis) (sumnums (cdr lis)))]
      [else                 (sumnums (cdr lis))])))