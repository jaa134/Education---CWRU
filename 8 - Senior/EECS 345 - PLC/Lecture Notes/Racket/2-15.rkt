#lang racket
; removeall*
(define removeall*-cps
  (lambda (x lis return)
    (cond
      [(null? lis) (return '())]
      [(list? (car lis)) (removeall*-cps x (car lis) (lambda (v1) (removeall*-cps x (cdr lis) (lambda (v2) (return (cons v1 v2))))))]
      [(eq? (car lis) x) (removeall*-cps x (cdr lis) return)]
      [else (removeall*-cps x (cdr lis) (lambda (v) (return (cons (car lis) v))))])))

(define removeall*
  (lambda (x lis)
    (removeall*-cps x lis (lambda (v) v))))
                                     
; flatten
(define append-cps
  (lambda (l1 l2 return)
    (if (null? l1)
        (return l2)
        (append-cps (cdr l1) l2 (lambda (v) (return (cons (car l1) v)))))))

(define flatten-cps
  (lambda (lis return)
    (cond
      [(null? lis) (return '())]
      [(list? (car lis)) (flatten-cps (car lis) (lambda (v1) (flatten-cps (cdr lis) (lambda (v2) (append-cps v1 v2 return)))))]
      [else (flatten-cps (cdr lis) (lambda (v) (return (cons (car lis) v))))])))
    
(define flatten
  (lambda (lis)
    (flatten-cps lis (lambda (v) v))))
    
; (split '(a b c d e f)) => ((a c e g) (b d f))
(define split-cps
  (lambda (lis return)
    (cond
      [(null? lis) (return '() '())]
      [(null? (cdr lis)) (return lis '())]
      [else (split-cps (cddr lis) (lambda (v1 v2) (return (cons (car lis) v1) (cons (cadr lis) v2))))])))

(define split
  (lambda (lis)
    (split-cps lis (lambda (v1 v2) (list v1 v2)))))

(define split2-cps
  (lambda (lis return)
    (if (null? lis)
        (return '() '())
        (split2-cps (cdr lis) (lambda (v1 v2) (return (cons (car lis) v2) v1))))))