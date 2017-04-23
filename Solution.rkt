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
(define allRPNSumsList (split-by allOppsAndNumsFlattenedList 5))

;test print
;allRPNSumsList


;the following algorithm takes a list of opperators and numbers and calculates them using RPN
;sourced from: https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket

(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    (printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y x) s)]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))


;make list of results from each RPN sum (many of which are invalid)
(define allRPNResultsList (map calculate-RPN allRPNSumsList))

;test print
;allRPNResultsList

;flatten the results as they're in lists, to then retrieve the index of the element which equals the target answer
(define indexOfCorrectAnswer (index-of (flatten allRPNResultsList) sampleTarget))

;index is used to find the target RPN expression from the list
(define correctAnswer (list-ref allRPNSumsList indexOfCorrectAnswer))

;print calculation of correct answer
(calculate-RPN correctAnswer)