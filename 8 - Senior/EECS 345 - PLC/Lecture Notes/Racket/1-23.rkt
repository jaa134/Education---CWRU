#lang racket

(define member*?
  (lambda (a lis)
    (cond
      [(null? lis) #f]
      [(pair? (car lis)) (or (member*? a (car lis)) (member*? a (cdr lis)))]
      [(eq? a (car lis)) #t]
      [else (member*? a (cdr lis))])))

;; (replaceall* 'x 'y '(a x ((b x c) d x e))) => '(a y ((b y c) d y e))
(define replaceall*
  (lambda (x y lis) 
    (cond
      [(null? lis) '()]
      [(eq? x (car lis)) (cons y (replaceall* x y (cdr lis)))]
      [(list? (car lis)) (cons (replaceall* x y (car lis)) (replaceall* x y (cdr lis)))]
      [else (cons (car lis) (replaceall* x y (cdr lis)))])))
    
;; (removeleftmost* 'x '(((a v) (x c))) x d) =? '(((a v) (c))) x d)
(define removeleftmost*
  (lambda (x lis)
    (cond
      [(null? lis) '()]
      [(eq? x (car lis)) (cdr lis)]
      [(and (list? (car lis)) (member*? x (car lis))) (cons (removeleftmost* x (car lis)) (cdr lis))]
      [else (cons (car lis) (removeleftmost* x (cdr lis)))])))
    
;; (emptylists '(a (b c) ((d e) (f)))) => '(() (() ()))
;;(define emptylists
;;  (lambda (lis)
    
;; (flatten '(a (b c) ((d e) (f)))) => '(a b c d e f)
;;(define flatten
;;  (lambda ()
