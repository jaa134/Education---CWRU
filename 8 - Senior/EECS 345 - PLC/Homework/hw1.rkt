#lang racket

;; Jacob Alspaw
;; jaa134@case.edu
;; 1/30/2019
;; EECS 345 - PLC

;;1
;; choose takes two integers, say n and k, and returns C(n,k), the combinatorial "choose" function
;; from discrete mathematics. Recall that C(n,k) = n/k * C(n-1,k-1), and C(n,0) = C(n,n) = 1.
;; Behavior of the function simply follows the math depending on values n and k.
(define choose
  (lambda (n k)
    (if (or (zero? k) (eq? n k))
        1
        (* (/ n k) (choose (- n 1) (- k 1))))))

;;2
;; rotate takes three atoms and a list of atoms. It returns a list that is the same as the input
;; list except that each occurrence of the first atom is replaced by the second, the second atom is
;; replaced by the third, and the third is replaced by the first.
;; Any where we see a rotated variable, replace it in list with corresponding atom.
(define rotate
  (lambda (a b c lis)
    (cond
      [(null? lis)       '()]
      [(eq? a (car lis)) (cons b (rotate a b c (cdr lis)))]
      [(eq? b (car lis)) (cons c (rotate a b c (cdr lis)))]
      [(eq? c (car lis)) (cons a (rotate a b c (cdr lis)))]
      [else              (cons (car lis) (rotate a b c (cdr lis)))])))

;;3
;; moveXleft takes an atom (ex: X) and a list and returns the same list except that, every place
;; where the atom X appears in the list and is not the first element, its location in the list is
;; shifted one to the left
;;(moveXleft 'X '(a b c X a b c))
;; If the next atom is the atom to shift, shift it one to the right.
(define moveXleft
  (lambda (X lis)
    (cond
      [(null? lis)             '()]
      [(null? (cdr lis))       lis]
      [(eq? X (car (cdr lis))) (cons X (cons (car lis) (moveXleft X (cdr (cdr lis)))))]
      [else                    (cons (car lis) (moveXleft X (cdr lis)))])))
    
;;4
;; myfilter takes a function and a list. The input function should return true or false. myfilter
;; applies the function to each element of the list and returns a list that contains only those elements
;; on which the function returns true, in order.
;; Apply a predicate to atom. If the atom belongs in output, add it to the list.
(define myfilter
  (lambda (func lis)
    (if (null? lis)
        '()
        (if (func (car lis))
            (cons (car lis) (myfilter func (cdr lis)))
            (myfilter func (cdr lis))))))

;;;5
;; squareroot takes two numbers, a value and an iteration. The iteration will be an integer greater than
;; or equal to 0. The method will compute the squareroot of the value using iteration rounds of Newton's
;; method, starting with an initial value equal to the input value.
;; Newton's method is new = old - ((old * old) - value) / (2 * old)
(define squareroot
  (lambda (value iter)
    (cond
      [(zero? iter) value]
      [else         (- (squareroot value (- iter 1)) (/ (- (* (squareroot value (- iter 1)) (squareroot value (- iter 1))) value) (* 2 (squareroot value (- iter 1)))))])))

;;6
;; rotate* takes three atoms and a list that may contain sublists. It returns a list that is the same as
;; the input list except that each occurrence of the first atom is replaced by the second, the second
;; atom is replaced by the third, and the third is replaced by the first.
(define rotate*
  (lambda (a b c lis)
    (cond
      [(null? lis)       '()]
      [(eq? a (car lis)) (cons b (rotate* a b c (cdr lis)))]
      [(eq? b (car lis)) (cons c (rotate* a b c (cdr lis)))]
      [(eq? c (car lis)) (cons a (rotate* a b c (cdr lis)))]
      [(list? (car lis)) (cons (rotate* a b c (car lis)) (rotate* a b c (cdr lis)))]
      [else              (cons (car lis) (rotate* a b c (cdr lis)))])))

;;7
;; flattenN takes a number and list that may contain sublists. All parentheses are removed from any
;; sublist that is nested more than N deep, where N is the input value.
;;'(a b c a b c a b c)
(define flattenN
  (lambda (N lis)
    (cond
      [(null? lis)                      '()]
      [(and (list? (car lis)) (<= N 1)) (append (flattenN (- N 1) (car lis)) (flattenN N (cdr lis)))]
      [(and (list? (car lis)) (> N 1))  (cons (flattenN (- N 1) (car lis)) (flattenN N (cdr lis)))]
      [else                             (cons (car lis) (flattenN N (cdr lis)))])))

;;8
;; outerproduct takes two vectors and returns the matrix that is the outerproduct of the vectors.
;; A vector is a list of numbers. Represent the matrix as a list of column vectors.
;; The first function is a helper that will calcualte a scalar by a vector.
;; The second function will use the helper to calculate each column of the matrix.
(define multList
  (lambda (n lis)
    (if (null? lis)
        '()
        (cons (* n (car lis)) (multList n (cdr lis))))))
        
(define outerproduct
  (lambda (a b)
    (cond
      [(null? a) '()]
      [(null? b) '()]
      [else      (cons (multList (car b) a) (outerproduct a (cdr b)))])))
    
;;9
;; maxvalue* takes a list, that can contain numbes and sublists, and returns the largest number in
;; the list. If the list contains no numbers, then it should return the atom 'novalue.
;; Finds and returns the max of two atoms. If the atoms dont have a true max, then 'novalue is returned.
(define max*
  (lambda (a b)
    (cond
      [(and (not (number? a)) (not (number? b))) 'novalue]
      [(not (number? a))                         b]
      [(not (number? b))                         a]
      [else (if (< a b)
              b
              a)])))

(define maxvalue*
  (lambda (lis)
    (cond
      [(null? lis)       'novalue]
      [(list? (car lis)) (max* (maxvalue* (cdr lis)) (maxvalue* (car lis)))]
      [else              (max* (maxvalue* (cdr lis)) (car lis))])))

;;10
;; moveXleft* takes an atom (ex: X) and a list that may contain sublists and returns the same list
;; except that, every place where the atom X appears in the list and is not the first element, its
;; location in the list is shifted one to the left. If there is a parenthesis to the left of the atom,
;; then the atom is shifted immediately to the left of the parenthesis.
;; Depending on the current item in the list, and the next item, we may need to slide things around.
(define moveXleft*
  (lambda (X lis)
    (cond
      ;;null value
      [(null? lis) '()]
      
      ;;current is not a list + no next item
      [(and (not (list? (car lis))) (null? (cdr lis)))                                               lis]
      ;;current is not a list + next is a list with X as first
      [(and (not (list? (car lis))) (and (list? (car (cdr lis))) (eq? X (car (car (cdr lis))))))     (cons (car lis) (cons X (cons (moveXleft* X (cdr (car (cdr lis)))) '())))]
      ;;current is not a list + next is not X
      [(and (not (list? (car lis))) (not (eq? X (car (cdr lis)))))                                   (cons (car lis) (moveXleft* X (cdr lis)))]
      ;;current is not a list + next is X
      [(and (not (list? (car lis))) (eq? X (car (cdr lis))))                                         (cons X (cons (car lis) (moveXleft* X (cdr (cdr lis)))))]
      
      ;;current is a list + no next item
      [(and (list? (car lis)) (null? (cdr lis)))                                                     (cons (moveXleft* X (car lis)) '())]
      ;;current is a list + next is a list with X as first
      [(and (list? (car lis)) (and (list? (car (cdr lis))) (eq? X (car (car (cdr lis))))))           (cons (moveXleft* X (car lis)) (cons X (cons (moveXleft* X (cdr (car (cdr lis)))) '())))]
      ;;current is a list + next is not X
      [(and (list? (car lis)) (not (eq? X (car (cdr lis)))))                                         (cons (moveXleft* X (car lis)) (moveXleft* X (cdr lis)))]
      ;;current is a list + next is X
      [(and (list? (car lis)) (eq? X (car (cdr lis))))                                               (cons (append (moveXleft* X (car lis)) (cons X '())) (moveXleft* X (cdr (cdr lis))))]

      [else '(error)])))