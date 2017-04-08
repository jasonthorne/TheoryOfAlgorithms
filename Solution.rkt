#lang racket

;avaliable opperators:
(define ops '(+-*/))

;temp values for testing:
(define a 5)
(define b 25)

;target number:
(define t 125)

;all possibilities for 2 numbers:
(+ a b)
(+ b a)

(- a b)
(- b a)

(* a b)
(* b a)

(/ a b)
(/ b a)


;list of lists
(define l (permutations (list 1 2 3 4 5)))

l