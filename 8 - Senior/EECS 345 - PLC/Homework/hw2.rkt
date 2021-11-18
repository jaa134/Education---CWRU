#lang racket
;;Jacob Alspaw
;;jaa134@case.edu
;;2/27/2019

;;general helpers
(define append-cps
  (lambda (l1 l2 return)
    (if (null? l1)
        (return l2)
        (append-cps (cdr l1) l2 (lambda (v) (return (cons (car l1) v)))))))

(define call-append-cps
  (lambda (l1 l2)
    (append-cps l1 l2 (lambda (v) v))))


;;Q1
;;  choose takes two integers, say n and k, and returns C(n,k), the combinatorial "choose"
;;  function from discrete mathematics. Recall that C(n,k) = n/k * C(n-1,k-1), and
;;  C(n,0) = C(n,n) = 1.
(define choose
  (lambda (n k)
    (if (or (eq? n k) (zero? k))
        1
        (* (/ n k) (choose (- n 1) (- k 1))))))

(define choose-cps
  (lambda (n k return)
    (if (or (eq? n k) (zero? k))
        (return 1)
        (choose-cps (- n 1) (- k 1) (lambda (v) (return (* (/ n k) v)))))))

(define call-choose-cps
  (lambda (n k)
    (choose-cps n k (lambda (v) v))))


;;Q2
;;  rotate takes three atoms and a list of atoms. It returns a list that is the same as the input list
;;  except that each occurrence of the first atom is replaced by the second, the second atom is
;;  replaced by the third, and the third is replaced by the first.
(define rotate
  (lambda (a b c lis)
    (cond
      [(null? lis)       '()]
      [(eq? a (car lis)) (cons b (rotate a b c (cdr lis)))]
      [(eq? b (car lis)) (cons c (rotate a b c (cdr lis)))]
      [(eq? c (car lis)) (cons a (rotate a b c (cdr lis)))]
      [else              (cons (car lis) (rotate a b c (cdr lis)))])))

(define rotate-cps
  (lambda (a b c lis return)
    (cond
      [(null? lis)       (return '())]
      [(eq? a (car lis)) (rotate-cps a b c (cdr lis) (lambda (v) (return (cons b v))))]
      [(eq? b (car lis)) (rotate-cps a b c (cdr lis) (lambda (v) (return (cons c v))))]
      [(eq? c (car lis)) (rotate-cps a b c (cdr lis) (lambda (v) (return (cons a v))))]
      [else              (rotate-cps a b c (cdr lis) (lambda (v) (return (cons (car lis) v))))])))
      
(define call-rotate-cps
  (lambda (a b c lis)
    (rotate-cps a b c lis (lambda (v) v))))


;;Q3
;;  squareroot takes two numbers, a value and an iteration. The iteration will be an integer greater
;;  than or equal to 0. The method will compute the squareroot of the value using iteration rounds
;;  of Newton's method, starting with an initial value equal to the input value.
(define squareroot
  (lambda (value iter)
    (if (zero? iter)
        value
        (- (squareroot value (- iter 1)) (/ (- (* (squareroot value (- iter 1)) (squareroot value (- iter 1))) value) (* 2 (squareroot value (- iter 1))))))))

(define squareroot-cps
  (lambda (value iter return)
    (if (zero? iter)
        (return value)
        (squareroot-cps value (- iter 1) (lambda (v) (return (- v (/ (- (* v v) value) (* 2 v)))))))))

(define call-squareroot-cps
  (lambda (value iter)
    (squareroot-cps value iter (lambda (v) v))))


;;Q4
;;  partition takes a list and a value returns a pair of sublists. The first contains all elements
;;  of the inupt list smaller than the value, and the other contains all the elements of the input
;;  that are larger than the value.
(define partition
  (lambda (lis n)
    (cond
      [(null? lis)
       '(() ())]
      [(and (number? (car lis)) (< (car lis) n))
       (list (cons (car lis) (car (partition (cdr lis) n))) (cadr (partition (cdr lis) n)))]
      [(and (number? (car lis)) (>= (car lis) n))
       (list (car (partition (cdr lis) n)) (cons (car lis) (cadr (partition (cdr lis) n))))]
      [else
       (partition (cdr lis) n)])))

(define partition-cps
  (lambda (lis n return)
    (cond
      [(null? lis)
       (return '() '())]
      [(and (number? (car lis)) (< (car lis) n))
       (partition-cps (cdr lis) n (lambda (v1 v2) (return (cons (car lis) v1) v2)))]
      [(and (number? (car lis)) (>= (car lis) n))
       (partition-cps (cdr lis) n (lambda (v1 v2) (return v1 (cons (car lis) v2))))]
      [else
       (partition-cps (cdr lis) n (lambda (v1 v2) (return v1 v2)))])))

(define call-partition-cps
  (lambda (lis n)
    (partition-cps lis n (lambda (v1 v2) (list v1 v2)))))


;;Q5
;;  rotate* takes three atoms and a list that may contain sublists. It returns a list that is the same
;;  as the input list except that each occurrence of the first atom is replaced by the second, the
;;  second atom is replaced by the third, and the third is replaced by the first.
(define rotate*
  (lambda (a b c lis)
    (cond
      [(null? lis)       '()]
      [(eq? a (car lis)) (cons b (rotate* a b c (cdr lis)))]
      [(eq? b (car lis)) (cons c (rotate* a b c (cdr lis)))]
      [(eq? c (car lis)) (cons a (rotate* a b c (cdr lis)))]
      [(list? (car lis)) (cons (rotate* a b c (car lis)) (rotate* a b c (cdr lis)))]
      [else              (cons (car lis) (rotate* a b c (cdr lis)))])))

(define rotate*-cps
  (lambda (a b c lis return)
    (cond
      [(null? lis)
       (return '())]
      [(eq? a (car lis))
       (rotate*-cps a b c (cdr lis) (lambda (v) (return (cons b v))))]
      [(eq? b (car lis))
       (rotate*-cps a b c (cdr lis) (lambda (v) (return (cons c v))))]
      [(eq? c (car lis))
       (rotate*-cps a b c (cdr lis) (lambda (v) (return (cons a v))))]
      [(not (list? (car lis)))
       (rotate*-cps a b c (cdr lis) (lambda (v) (return (cons (car lis) v))))]
      [else
       (rotate*-cps a b c (cdr lis) (lambda (v1) (rotate*-cps a b c (car lis) (lambda (v2) (return (cons v2 v1))))))])))
      
(define call-rotate*-cps
  (lambda (a b c lis)
    (rotate*-cps a b c lis (lambda (v) v))))


;;Q6
;;  myfilter takes a function that is in CPS form and a list. The input function should return true
;;  or false. myfilter applies the function to each element of the list and returns a list that
;;  contains only those elements on which the function returns true, in order.
(define myfilter
  (lambda (func lis)
    (cond
      [(null? lis)                     '()]
      [(func (car lis) (lambda (v) v)) (cons (car lis) (myfilter func (cdr lis)))]
      [else                            (myfilter func (cdr lis))])))

(define myfilter-cps
  (lambda (func lis return)
    (cond
      [(null? lis) (return '())]
      [else        (myfilter-cps func (cdr lis)
                     (lambda (l)
                       (func (car lis)
                         (lambda (r)
                           (return (if r (cons (car lis) l) l))))))])))

(define call-myfilter-cps
  (lambda (func lis)
    (myfilter-cps func lis (lambda (v) v))))


;;Q7
;;  quicksort takes a list of numbers and returns a sorted version. If you recall the quick sort
;;  algorithm, you use the partition function above with the car of the list as the value to partition
;;  on. Then you recursively quicksort each sublist, and append the sorted lists back together (with
;;  the partition value added back in between the two lists).
(define quicksort
  (lambda (lis)
    (if (null? lis)
      '()
      (quicksort-helper (partition (cdr lis) (car lis)) (car lis))))) 
    
(define quicksort-helper
  (lambda (plis mid)
    (call-append-cps (quicksort (car plis)) (cons mid (quicksort (cadr plis))))))

(define quicksort-cps
  (lambda (lis return)
    (cond
      [(null? lis) (return '())]
      [(partition-cps (cdr lis) (car lis)
          (lambda (pl pr) (quicksort-cps pl
              (lambda (spl) (quicksort-cps pr
                  (lambda (spr) (append-cps spl (cons (car lis) spr) return)))))))])))

(define call-quicksort-cps
  (lambda (lis)
    (quicksort-cps lis (lambda (v) v))))


;;Q8
;;  replaceatoms takes two lists. The first list can contain sublists, but the second list is a single
;;  list of atoms. The output should be the first list, but each atom of the first list, from left to
;;  right, is replaced by the corresponding atom of the second list, until the second list runs out of atoms.
(define replaceatoms
  (lambda (lis reps)
    (replaceatoms-helper lis reps (lambda (l r) l))))

(define replaceatoms-helper
  (lambda (lis reps return)
    (cond
      [(null? lis)       (return '() reps)]
      [(null? reps)
       (replaceatoms-helper (cdr lis) '() (lambda (l r) (return (cons (car lis) l) '())))]
      [(list? (car lis))
       (replaceatoms-helper (car lis) reps (lambda (li ri) (replaceatoms-helper (cdr lis) ri (lambda (lo ro) (return (cons li lo) ro)))))]
      [else
       (replaceatoms-helper (cdr lis) (cdr reps) (lambda (l r) (return (cons (car reps) l) r)))])))


;;Q9
;;  suffix takes an atom and a list and returns a list containing all elements that occur after the last
;;  occurrence of the atom.
(define suffix
  (lambda (a lis)
    (call/cc
      (lambda (k)
        (suffix-cc a lis k)))))

(define suffix-cc
  (lambda (a lis break)
    (cond
      [(null? lis)       '()]
      [(eq? (car lis) a) (break (suffix-cc a (cdr lis) break))]
      [else              (cons (car lis) (suffix-cc a (cdr lis) break))])))


;;Q10
;;  xindex takes an atom and a list containing sublists. The output list should be the same as the input
;;  list except that any sublist (including the main list) that contains the given atom should be emptied
;;  of all contents (atoms, lists, etc.), and instead, the only content of that sublist should be the index
;;  of the first occurrence of the atom in that list.
(define xindex
  (lambda (a lis)
    (call/cc
      (lambda (k)
        (xindex-cc a lis 1 k)))))

(define xindex-cc
  (lambda (a lis n break)
    (cond
      [(null? lis)       '()]
      [(eq? (car lis) a) (break (list n))]
      [(list? (car lis)) (cons (call/cc (lambda (k) (xindex-cc a (car lis) 1 k))) (xindex-cc a (cdr lis) (+ n 1) break))]
      [else              (cons (car lis) (xindex-cc a (cdr lis) (+ n 1) break))])))
    