#lang racket

;; create the fuction duplicate that takes an atom and a number and creates a list
;; with that many copies of the atom in it
;; (duplicate 'x 5) => (x x x x)
(define duplicate
  (lambda (a n)
    (if (zero? n)
        '()
        (cons a (duplicate a (- n 1))))))

;; cretae myremove that takes an atom and a list and removes the first occurence
;; of the atom in the list

(define myremove
  (lambda (a lis)
    (cond
      [(null? lis)      '()]
      [(eq? a (car lis)) (cdr lis)]
      [else              (cons (car lis)(myremove a (cdr lis)))])))

;; remove all occurences of an atom from a list
(define removeall
  (lambda (a lis)
    (cond
      [(null? lis)      '()]
      [(eq? a (car lis)) (removeall a (cdr lis))]
      [else              (cons (car lis)(removeall a (cdr lis)))])))

;; (replaceall 'x 'y '(a b x c x d)) => '(a b y c y d)
(define replaceall
  (lambda (a b lis)
    (cond
      [(null? lis)      '()]
      [(eq? a (car lis)) (cons b (replaceall a b (cdr lis)))]
      [else              (cons (car lis)(replaceall a b (cdr lis)))])))

;; (squares '(4 7 10)) => '(16 49 100)
(define squares
  (lambda (lis)
    (if (null? lis)
        '()
        (cons (* (car lis) (car lis))(squares (cdr lis))))))

;; (myappend '(a b c) '(d e f g)) => '(a b c d e f g)
(define myappend
  (lambda (lis1 lis2)
    (if (null? lis1)
        lis2
        (cons (car lis1) (myappend (cdr lis1) lis2)))))
        
;; (myreverse '(a b c d)) => '(d c b a)
(define myreverse
  (lambda (lis)
    (if (null? lis)
        '()
        (myappend (myreverse (cdr lis)) (cons (car lis) '())))))
        
;; (mymap (lambda (x) (* x x)) '(4 5 6)) => (16 25 36)
(define mymap
  (lambda (func lis)
    (if (null? lis)
        '()
        (cons (func (car lis)) (mymap func (cdr lis))))))
    
;; (transpose '((a b c) (d e f) (g h i))) => '((a d g) (b e h) (c f i))
(define transpose
  (lambda (lis)
    (if (null? lis)
        '()
        '())))