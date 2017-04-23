#lang racket

;Theory of Algorithms
;Countdown Numbers game

;Jason Thorne
;G00317349

;list of numbers for generating six random numbers
(define pickNumbersList (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;sample numbers
(define numbersList (list 3 7 21 1 5 2))

;list holding opperators
(define opperatorsList (list '+ '+ '+ '+ '+ '- '- '- '- '- '* '* '* '* '* '/ '/ '/ '/ '/))

;randomly generated target number (between 101 and 999)
;(define targetNumber (random 101 1000))
(define targetNumber 218)

(define numberOfOpperators 5)
(define numberOfNumbers 6)
(define numberOfOppsandNumbs (+ numberOfOpperators numberOfNumbers))

'Calculating....

;get all combinations of opperators (in lists of 2 because numbers list has 3 elements, so 2 calculations required)
;(define combsofOppsList (combinations opperatorsList 2))
(define combsofOppsList (remove-duplicates (combinations opperatorsList numberOfOpperators)))

;get every permutation of each opperator, with duplicates removed. So (+ -) will add (- +) etc
(define permsOfOppsList3d (map (lambda (ls) 
       (remove-duplicates (permutations ls)))
       combsofOppsList))

;test print
;permsOfOppsList3d

;permsOfOppsList3d is a 3 dimensional list. Needs to be a list of lists for the cartesian-product calculation
;sourced from: http://stackoverflow.com/a/20147937/1866373
(define (flatten-once lst)
  (apply append lst))

(define permsOfOppsList (flatten-once permsOfOppsList3d)) 

;get permutations of the numbers
(define permsOfNumbsList (permutations numbersList))

;test print
;permsOfOppsList
;permsOfNumbsList

;cartesian-product combines each pair of opperators with each permutation of numbers in a list of lists
(define allOppsAndNumsList (cartesian-product permsOfNumbsList permsOfOppsList))

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
(define allRPNSumsList (split-by allOppsAndNumsFlattenedList numberOfOppsandNumbs))
;(define allRPNSumsList (split-by allOppsAndNumsFlattenedList 11))

;test print
;allRPNSumsList

;the following algorithm takes a list of opperators and numbers and calculates them using RPN
;sourced from: https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket

(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y (if (equal? x 0) 1 x)) s)] ;set denominator to 1 if 0
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

(define (calculate-RPN-with-print expr)
  (for/fold ([stack '()]) ([token expr])
    (printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y (if (equal? x 0) 1 x)) s)] ;set denominator to 1 if 0
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

;make list of results from each RPN sum (many of which are invalid)
(define allRPNResultsList (map calculate-RPN allRPNSumsList))

;test print
;allRPNResultsList

;flatten the results as they're in lists, to then retrieve the index of the element which equals the target answer
(define indexOfCorrectAnswer (index-of (flatten allRPNResultsList) targetNumber))

;index is used to find the target RPN expression from the list
(define correctAnswer (list-ref allRPNSumsList indexOfCorrectAnswer))

;print calculation of correct answer
(printf "Target Number: ") targetNumber
'---------------------
'Answer:
correctAnswer
(calculate-RPN-with-print correctAnswer)