#lang racket
;; to see the syntax of an argument
;; (syntax (+ 3 5))

;; to see the syntax of individual components
;; (syntax->list (syntax (+ 3 5)))

;; to see scheme syntax as data
;; (syntax->datum (syntax (+ 3 5))
;; or to see the conversion from data to syntax
;; (datum->syntax #f '(+ 3 5))


;; create a debug syntax
(define-syntax debug
  (lambda (syn)
    (define slist (syntax->list syn))
    (datum->syntax syn `(let ((result ,(cadr slist)))
                          (begin (print result) (newline) result)))))

(define factorial
  (lambda (n)
    (if (zero? n)
        1
        (* n (debug (factorial (- n 1)))))))


(define-syntax Just
  (lambda (syn)
    (define slist (syntax->list syn))
    (datum->syntax syn `(list 'Just ,(cadr slist)))))

(define-syntax Nothing
  (lambda (syn)
    (syntax 'Nothing)))