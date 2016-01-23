```
ghci> 2 + 15
17
ghci> 49 * 1000
49000
ghci> 1892 - 1472
420
ghci> 5 / 2
2.5
ghci> (50 * 100) - 4999
1
ghci> 50 * 100 - 4999
1
ghci> 50 * (100 - 4999)
-244950
```

```
ghci> True && False
False
ghci> True && True
True
ghci> False || True
True
ghci> not False
True
ghci> not (True && True)
False
```

```
ghci> 5 == 5
True
ghci> 1 == 0
False
ghci> 5 /= 5
False
ghci> 5 /= 4
True
ghci> "hello" == "hello"
True
```

```
ghci> succ 8
9
ghci> min 9 10
9
ghci> min 3.4 3.2
3.2
ghci> max 100 101
101
ghci> succ 9 + max 5 4 + 1
16
ghci> (succ 9) + (max 5 4) + 1
16
ghci> succ 9 * 10
100
ghci> succ (9 * 10)
91
ghci> div 92 10
9
ghci> 92 `div` 10
9
```

See: baby.hs

```
ghci> :l baby.hs
[1 of 1] Compiling Main             ( baby.hs, interpreted )
Ok, modules loaded: Main.
ghci> doubleMe 9
18
ghci> doubleMe 8.3
16.6
ghci> doubleUs 4 9
26
ghci> doubleUs 2.3 34.2
73.0
ghci> doubleUs 28 88 + doubleMe 123
478
ghci> (doubleUs 28 88) + (doubleMe 123)
478
ghci> (doubleUs 28) 88 + (doubleMe 123)
478
ghci> (+) (doubleUs 28) 88 (doubleMe 123)
<interactive>:9:1:
    Non type-variable argument in the constraint: Num (a -> a)
    (Use FlexibleContexts to permit this)
    When checking that ‘it’ has the inferred type
      it :: forall a. (Num a, Num (a -> a)) => a
ghci> (+) ((doubleUs 28) 88) (doubleMe 123)
478
ghci> (+) (doubleUs 28 88) (doubleMe 123)
478
ghci> doubleSmallNumber 10
20
ghci> doubleSmallNumber 101
101
ghci> doubleSmallNumber' 10
21
ghci> doubleSmallNumber' 101
102
ghci> conanO'Brien
"It's a-me, Conan O'Brien!"
```

1.3

```
ghci> let lostNumbers = [4,8,15,16,23,42]
ghci> lostNumbers
[4,8,15,16,23,42]
```

1.3.1

```
ghci> [1,2,3,4] ++ [9,10,11,12]
[1,2,3,4,9,10,11,12]
ghci> "hello" ++ "world"
"helloworld"
ghci> "hello" ++ " " ++ "world"
"hello world"
ghci> ['w','o'] ++ ['o','t']
"woot"
ghci> ['w','o'] ++ "ot"
"woot"
```

1.3.2

```
ghci> 'A':"SMALL CAT"
"ASMALL CAT"
ghci> 'A':" SMALL CAT"
"A SMALL CAT"
ghci> 5:[1,2,3,4,5]
[5,1,2,3,4,5]
ghci> 5++[1,2,3,4,5]

<interactive>:38:1:
    Non type-variable argument in the constraint: Num [a]
    (Use FlexibleContexts to permit this)
    When checking that ‘it’ has the inferred type
      it :: forall a. (Num a, Num [a]) => [a]
ghci> [5]++[1,2,3,4,5]
[5,1,2,3,4,5]
ghci> [1,2,3,4] ++ [5]
[1,2,3,4,5]
ghci> [1,2,3,4] ++ 5

<interactive>:41:1:
    Non type-variable argument in the constraint: Num [a]
    (Use FlexibleContexts to permit this)
    When checking that ‘it’ has the inferred type
      it :: forall a. (Num a, Num [a]) => [a]
```

1.3.3

```
ghci> "Steve Buscemi" !! 6
'B'
ghci> [9.4,33.2,96.2,11.2,23.25] !! 1
33.2
ghci> [1,2,3] !! 0
1
ghci> [1,2,3] !! 2
3
ghci> [1,2,3] !! 3
*** Exception: Prelude.!!: index too large
ghci> [1,2,3] !! -1

<interactive>:47:1:
    Precedence parsing error
        cannot mix ‘!!’ [infixl 9] and prefix `-' [infixl 6] in the same infix expression
```

1.3.4

```
ghci> [3,2,1] > [2,1,0]
True
ghci> [3,2,1] > [2,10,100]
True
ghci> [3,4,2] < [3,4,2]
False
ghci> [3,4,2] < [3,4,3]
True
ghci> [3,4,2] > [2,4]
True
ghci> [3,4,2] == [3,4,2]
True
```

1.3.5

```
ghci> head [5,4,3,2,1]
5
ghci> tail [5,4,3,2,1]
[4,3,2,1]
ghci> last [5,4,3,2,1]
1
ghci> init [5,4,3,2,1]
[5,4,3,2]
ghci> head []
*** Exception: Prelude.head: empty list
ghci> length [5,4,3,2,1]
5
ghci> null []
True
ghci> null [1,2,3]
False
ghci> reverse [5,4,3,2,1]
[1,2,3,4,5]
ghci> reverse reverse [5,4,3,2,1]

<interactive>:63:1:
    Couldn't match expected type ‘[Integer] -> t’
                with actual type ‘[a0]’
    Relevant bindings include it :: t (bound at <interactive>:63:1)
    The function ‘reverse’ is applied to two arguments,
    but its type ‘[a0] -> [a0]’ has only one
    In the expression: reverse reverse [5, 4, 3, 2, ....]
    In an equation for ‘it’: it = reverse reverse [5, 4, 3, ....]

<interactive>:63:9:
    Couldn't match expected type ‘[a0]’ with actual type ‘[a1] -> [a1]’
    Probable cause: ‘reverse’ is applied to too few arguments
    In the first argument of ‘reverse’, namely ‘reverse’
    In the expression: reverse reverse [5, 4, 3, 2, ....]
ghci> reverse (reverse [5,4,3,2,1])
[5,4,3,2,1]
ghci> take 3 [5,4,3,2,1]
[5,4,3]
ghci> take 1 [3,9,3]
[3]
ghci> take 5 [1,2]
[1,2]
ghci> take 0 [6,6,6]
[]
ghci> drop 3 [8,4,2,1,6]
[1,6]
ghci> drop 3 [8,4,2,1,5,6]
[1,5,6]
ghci> drop 0 [1,2,3,4]
[1,2,3,4]
ghci> drop 100 [1,2,3,4]
[]
ghci> maximum [1,9,2,3,4]
9
ghci> minimum [8,4,2,1,5,6]
1
ghci> sum [5,2,1,6,3,2,5,7]
31
ghci> product [6,2,1,2]
24
ghci> product [1,2,5,6,7,9,2,0]
0
ghci> elm 4 [3,4,5,6]

<interactive>:78:1:
    Not in scope: ‘elm’
    Perhaps you meant ‘elem’ (imported from Prelude)
ghci> elem 4 [3,4,5,6]
True
ghci> 4 `elem` [3,4,5,6]
True
ghci> 10 `elem` [3,4,5,6]
False
```

1.4

```
ghci> [1..20]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
ghci> ['a'..'20']

<interactive>:83:8: parse error on input ‘20’
ghci> ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"
ghci> ['K'..'Z']
"KLMNOPQRSTUVWXYZ"
ghci> ['K'..'z']
"KLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz"
ghci> [2,4..20]
[2,4,6,8,10,12,14,16,18,20]
ghci> [3,6..20]
[3,6,9,12,15,18]
ghci> [13,26..24*13]
[13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]
ghci> take 24 [13,26..]
[13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]
ghci> take 10 (cycle [1,2,3])
[1,2,3,1,2,3,1,2,3,1]
ghci> take 12 (cycle "LOL ")
"LOL LOL LOL "
ghci> take 10 (repeat 5)
[5,5,5,5,5,5,5,5,5,5]
ghci> replicate 3 10
[10,10,10]
ghci> [0.1,0.3..1]
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]
```

1.5

```
ghci> [x*2 | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]
ghci> [x * 2 | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]
ghci> [x * 2 | x <- [1..10], x * 2 >= 12]
[12,14,16,18,20]
ghci> [x | x <- [50..100], x `mod` 7 == 3]
[52,59,66,73,80,87,94]
ghci> boomRanges xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

<interactive>:100:15: parse error on input ‘=’
ghci> let boomRanges xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
ghci> let boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
ghci> boomBangs [7..13]
["BOOM!","BOOM!","BANG!","BANG!"]
ghci> [ x | x <- [10..20], x /= 13, x /= 15, x /= 19 ]
[10,11,12,14,16,17,18,20]
ghci> [ x + y | x <- [1,2,3], y <- [10,100,1000] ]
[11,101,1001,12,102,1002,13,103,1003]
ghci> [x * y | x <- [2,5,10], y <- [8,10,11]]
[16,20,22,40,50,55,80,100,110]
ghci> [x * y | x <- [2,5,10], y <- [8,10,11], x * y > 50]
[55,80,100,110]
ghci> let nouns = ["hobo","frog","pope"]
ghci> let adjectives = ["lazy","grouchy","scheming"]
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog","grouchy pope","scheming hobo","scheming frog","scheming pope"]
ghci> let length' xs = sum [1 | _ <- xs]
ghci> length' [1..3]
3
ghci> length' [1,2,3,4,5]
5
ghci> let removeNonUpcase st = [c | c <- st, c `elem` ['A'..'Z']]
ghci> removeNonUpcase "Hahaha! Ahahaha!"
"HA"
ghci> removeNonUpcase "IdontLIKEFROGS"
"ILIKEFROGS"
ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
ghci> [[x | x <- xs, even x] | xs <- xxs]
[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
```
