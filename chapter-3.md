3.1

```ghci> lucky 8
"Sorry, you're out of luck, pal!"
ghci> lucky 7
"LUCKY NUMBER SEVEN!"
ghci> sayMe 1
"One!"
ghci> sayMe 2
"Two!"
ghci> sayMe 3
"Three!"
ghci> sayMe 4
"Four!"
ghci> sayMe 5
"Five!"
ghci> sayMe 6
"Not between 1 and 5"
ghci> factorial 1
1
ghci> factorial 2
2
ghci> factorial 3
6
ghci> charName 'a'
"Albert"
ghci> charName 'h'
"*** Exception: chapter-3-1.hs:(18,1)-(20,22): Non-exhaustive patterns in function charName
ghci> let xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]
ghci> [a+b | (a,b) <- xs]
[4,7,6,8,11,4]
ghci> [x*100+3 | (x,3) <- xs]
[103,403,503]
ghci> head' [4,5,6]
4
ghci> head' "Hello!"
'H'
ghci> tell [1]
"The list has one element: 1"
ghci> tell [True,False]
"The list has two elements: True and False"
ghci> tell [1,2,3,4]
"This list is long. The first two elements are: 1 and 2"
ghci> tell []
"The list is empty"
ghci> badAdd [1,2]
*** Exception: chapter-3-1-2.hs:12:1-29: Non-exhaustive patterns in function badAdd
ghci> firstLetter "Dracula"
"The first letter of Dracula is D"
ghci> bmiTell 85 1.90
"You're supposedly normal. Pffft, I bet you're ugly!"
ghci> 3 `myCompare` 2
GT
ghci> max 3 2
3
```
