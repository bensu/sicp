;; Chapter 1
;; =========

;; Excercise 1.3

(define (square-sum-larger a b c)
  (define (square x) (* x x))
  (define (sum-square a b) (+ (square a) (square b)))
  (define (min a b c) (and (< a b) (< a c)))
  (cond ((min a b c) (sum-square b c))
        ((min b a c) (sum-square a c))
        ((min c a b) (sum-square b a))))

(pp "Excercise 1.3")
(and (= (square-sum-larger 1 2 3) 13) (= (square-sum-larger 12 2 7) 193) (= (square-sum-larger 4 13 6) 205) (= (square-sum-larger 2 13 5) 194))

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
