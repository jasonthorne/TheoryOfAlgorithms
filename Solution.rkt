#lang racket

;racker docs: https://docs.racket-lang.org/guide/index.html (1-4)
;iterations: https://docs.racket-lang.org/guide/for.html#%28part._for_and_for_%29

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
(define l (permutations (list 1 2 3)))

l

ops

(cartesian-product '(l) '(ops))

(permutations '(+ 2 3))

;make permuation lists from all numbers and opperators.
(permutations '(+ / * 1 2 3))

;make a list of permuations

;grab each element from the list of lists, defined as their own lists.
