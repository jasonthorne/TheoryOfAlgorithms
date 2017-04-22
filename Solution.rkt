#lang racket

;racker docs: https://docs.racket-lang.org/guide/index.html (1-4)
;iterations: https://docs.racket-lang.org/guide/for.html#%28part._for_and_for_%29

;Ian's racket examples: https://github.com/theory-of-algorithms/example-scheme

;avaliable opperators:
;(define ops '(+-*/))

;temp values for testing:
;(define a 5)
;(define b 25)

;target number:
;(define t 125)

;all possibilities for 2 numbers:
;(+ a b)
;(+ b a)

;(- a b)
;(- b a)

;(* a b)
;(* b a)

;(/ a b)
;(/ b a)


;list of lists
;(define l (permutations (list 1 2 3)))

;l

;ops

;(cartesian-product '(l) '(ops))

;(permutations '(+ 2 3))

;make permuation lists from all numbers and opperators.
;(permutations '(+ / * 1 2 3))




;++++++++++++++++++++++++++++++++++++++++++++++++++++++
;make a list of all numbers and opperators.
;(define testList (list + / * 1 2 3))  ; - Takes in opperators as '#<procedure:+>'

;testList

;make permuation lists from list of all numbers and opperators:

;(define permList (permutations (testList))) ;- doesnt like testList being predefined! 

;(define permList (permutations (define testList2 (list + / * 1 2 3))))  - Doesnt like list being defined here!
;(define testList2 (list 1 2 3))

;(define permList (permutations (list 1 2 3)))

;permList

;grab each element from the list of lists, defined as their own lists.

;(car permList)

;(define firstList (car permList))

;firstlist

;(for ([i (in-list '(1 2 3))])
;(display i))


;(define z (list null))

;(for ([i (in-list (list permList))])
   ;(cons z i )
   ;(display i))
;z


;++++++++++++++++++++++++++++
;list holding opperators
(define opperatorsList (list '+'-'*'/))

;sample numbers
(define numbersList (list 2 3 5))

;sample target number
(define sampleTarget 25)

;get all combinations of opperators (in lists of 2 because numbers list has 3 elements, so 2 calculations required)
(define combsofOppsList (combinations opperatorsList 2))

;get permutations of the numbers
(define permsOfNumbsList (permutations numbersList))

;test print
combsofOppsList
permsOfNumbsList

