#lang racket
; multiple a list of numvers
(define multiply
  (lambda (lis)
    (if (null? lis)
        1
        (* (car lis) (multiply (cdr lis))))))


(define multiply2
  (lambda (lis)
    (cond
      [(null? lis) 1]
      [(zero? (car lis)) 0]
      [else (* (car lis)) (multiply2 (cdr lis))])))

; acc
(define multiply3
  (lambda (lis acc)
    (if (null? lis)
        acc
        (* acc (multiply3 (cdr lis))))))


; cps
(define multiply-cps
  (lambda (lis return)
    (cond
      [(null? lis) (return 1)]
      [(zero? (car lis)) (return 0)]
      [else (multiply-cps (cdr lis) (lambda (v) (return (* (car lis) v))))])))

; cps
(define multiply-cps-break
  (lambda (lis return break)
    (cond
      [(null? lis) (return 1)]
      [(zero? (car lis)) (break 0)]
      [else (multiply-cps-break (cdr lis) (lambda (v) (return (* (car lis) v))) break)])))

(define multiply4
  (lambda (lis)
    (multiply-cps-break lis (lambda (v) v) (lambda (v) v))))

(define goodmultiply
  (lambda (lis break)
    (cond
      [(null? lis) 1]
      [(zero? (car lis)) (break 0)]
      [else (* (car lis) (goodmultiply (cdr lis) break))])))

(define multiply5
  (lambda (lis)
    (call/cc
     (lambda (k)
       (goodmultiply lis k)))))

