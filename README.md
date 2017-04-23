# Theory Of Algorythms Project

## Countdown Numbers Game

This is a program based on the famous [Countdown numbers game](https://en.wikipedia.org/wiki/Countdown_(game_show)#Numbers_round), written in the [Racket functional programming language](https://racket-lang.org/). It takes 6 numbers and attempts to find a solution to the Countdown game from them.

## Requirements
It requires Racket Version 6.8 to run, found [here](https://racket-lang.org/download/). 
To run, open Dr Racket and navigate: 'file' > 'open' > 'Solution.rkt'. 

## Known Issues:
For the moment, the numbers and target are hardcoded. The intention however is to generate these just like the game of Countdown.

The solution is not as efficient as it could be:
It takes a list of opperations, coupled with the numbers and performs every calculation on them. It then extracts the index with the answer to display the sum.
One obvious optimisation would be to stop performing calculations as soon as it hits the answer. Another might be to remove any invalid opperations from the list before calculating them, for example a calculation with nothing but minus symbols will never be the solution.

Another issue is that the sample target must be a viable one. If it is not, the app will not handle that.
A solution to that would be to search for the closest answer in the list, rather than expecting an exact match (if it does not exist).

Because of the volume of calculations, there is a need to increase the memory for the app from 128mb to 1024mb which might be optimized with more shorthand and less list allocation.

Finally, it does not print the answers in strict RPN form.





