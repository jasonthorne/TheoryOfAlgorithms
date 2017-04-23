#lang racket

;racker docs: https://docs.racket-lang.org/guide/index.html (1-4)
;iterations: https://docs.racket-lang.org/guide/for.html#%28part._for_and_for_%29

;Ian's racket examples: https://github.com/theory-of-algorithms/example-scheme


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

;cartesian-product combines each pair of opperators with each permutation of numbers in a list of lists
(define allOppsAndNumsList (cartesian-product permsOfNumbsList combsofOppsList))

;test print
;allOppsAndNumsList

;merge the numbers with opperators by flattening the list of lists into a single list
(define allOppsAndNumsFlattenedList (flatten allOppsAndNumsList))

;test print
;allOppsAndNumsFlattenedList

;grab 5 elmements at a time from the flattened list to make a list of every potential RPN sum
;sourced from: http://stackoverflow.com/a/23394290/1866373
(define (split-by lst n)
   (if (not (empty? lst))
       (cons (take lst n) (split-by (drop lst n) n))
       '() ))
(split-by allOppsAndNumsFlattenedList 5)
