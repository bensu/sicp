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

;; Counting Change
;; How many different ways can we make change of $1.00 given 0.5,
;; 0.25, 0.1, 0.05, and 0.01.

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)  ;; If I got the right change +1
        ;; If I've missed 0 by substracting or out of coins +0
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        ;; Else try the same amount with less coins and
        ;; substract the coin once and keep trying with all the coins
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (nth xs i)
  (if (= i 0)
      (car xs)
      (nth (cdr xs) (- i 1))))

(define (first-denomination kinds-of-coins)
  (let ((coins '(1 5 10 25 50)))
    (nth coins (- kinds-of-coins 1))))

(count-change 100)
