```
ghci> max 4 5
5
ghci> (max 4) 5
5
ghci> :t max
max :: Ord a => a -> a -> a

ghci> multThree 3 4 5
60
ghci> multThree 3 5 9
135
ghci> ((multThree 3) 5) 9
135
ghci> let multTwoWithNine = multThree 9
ghci> multTwoWithNine 2 3
54
ghci> divideByTen 200
20.0
ghci> 200 / 10
20.0
ghci> (/ 10) 200
20.0
ghci> :t (/10)
(/10) :: Fractional a => a -> a
ghci> isUpperAlphanum 'A'
True
ghci> isUpperAlphanum '+'
False
ghci> (-4)
-4
ghci> :t (-4)
(-4) :: Num a => a
ghci> (-4) 5

<interactive>:29:1:
    Non type-variable argument in the constraint: Num (a -> t)
    (Use FlexibleContexts to permit this)
    When checking that ‘it’ has the inferred type
      it :: forall a t. (Num a, Num (a -> t)) => t
ghci> :t (subtract 4)
(subtract 4) :: Num a => a -> a
ghci> (subtract 4) 5
1
ghci> multThree 3 4

<interactive>:33:1:
    No instance for (Show (Int -> Int))
      (maybe you haven't applied enough arguments to a function?)
      arising from a use of ‘print’
    In a stmt of an interactive GHCi command: print it

ghci> applyTwice (+3) 10
16
ghci> applyTwice (++ "HAHA") "HEY"
"HEYHAHAHAHA"
ghci> applyTwice (++ " HAHA") "HEY"
"HEY HAHA HAHA"
ghci> applyTwice ("HAHA " ++) "HEY"
"HAHA HAHA HEY"
ghci> applyTwice (multThree 2 2) 9
144
ghci> applyTwice (3:) [1]
[3,3,1]
ghci> zipWith' (+) [4,2,5,6] [2,6,2,3]
[6,8,7,9]
ghci> zipWith' max [6,3,2,1] [7,3,1,5]
[7,3,2,5]
ghci> zipWith' (++) ["foo ","bar ","baz "] ["fighters","hoppers","aldrin"]
["foo fighters","bar hoppers","baz aldrin"]
ghci> zipWith' (*) (replicate 2 5) [1..]
[5,10]
ghci> zipWith' (*) (replicate 5 2) [1..]
[2,4,6,8,10]
ghci> zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]
[[3,4,6],[9,20,30],[10,12,12]]
ghci> zip [1,2,3,4,5] "hello"
[(1,'h'),(2,'e'),(3,'l'),(4,'l'),(5,'o')]
 ghci> flip' zip [1,2,3,4,5] "hello"
[('h',1),('e',2),('l',3),('l',4),('o',5)]
ghci> zipWith div [2,2..] [10,8,6,4,2]
[0,0,0,0,1]
ghci> zipWith (flip' div) [2,2..] [10,8,6,4,2]
[5,4,3,2,1]
ghci> map (+3) [1,5,3,1,6]
[4,8,6,4,9]
ghci> map (++ "!") ["BIFF","BANG","POW"]
["BIFF!","BANG!","POW!"]
ghci> map (replicate 3) [3..6]
[[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
ghci> map (map (^2)) [[1,2],[3,4,5,6],[7,8]]
[[1,4],[9,16,25,36],[49,64]]
ghci> map fst [(1,2),(3,5),(6,3),(2,6),(2,5)]
[1,3,6,2,2]

ghci> filter (>3) [1,5,3,2,1,6,4,3,2,1]
[5,6,4]
ghci> filter (== 3) [1,2,3,4,5]
[3]
ghci> filter even [1..10]
[2,4,6,8,10]
ghci> let notNull x = not (null x) in filter notNull  [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
[[1,2,3],[3,4,5],[2,2]]
ghci> filter (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diiFfeRent"
"uagameasadiifeent"
ghci> filter (`elem` ['A'..'Z']) "i LAuGh at you bEcause u R all the same"
"LAGER"
ghci> filter (<15) (filter even [1..20])
[2,4,6,8,10,12,14]
ghci> [x | x <- [1..20], x < 15, even x]
[2,4,6,8,10,12,14]
ghci> takeWhile (/=' ') "elephants know how to party"
"elephants"
ghci> sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
166650
ghci> sum (takeWhile (<10000) [m | m <- [n^2 | n <- [1..]], odd m])
166650
ghci> chain 10
[10,5,16,8,4,2,1]
ghci> chain 1
[1]
ghci> chain 30
[30,15,46,23,70,35,106,53,160,80,40,20,10,5,16,8,4,2,1]
ghci> let listOfFuns = map (*) [0..]
ghci> (listOfFuns !! 4) 5
20
ghci> map (+3) [1,6,3,2]
[4,9,6,5]
ghci> map (\x -> x + 3) [1,6,3,2]
[4,9,6,5]
ghci> zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
[153.0,61.5,31.0,15.75,6.6]
ghci> map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]
[3,8,9,8,7]
ghci> zipWith (flip (++)) ["love you","love me"] ["i ", "you "]
["i love you","you love me"]
ghci> map (flip subtract 20) [1,2,3,4]
[19,18,17,16]
ghci> :t foldl
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
ghci> sum' [3,5,2,1]
11
ghci> :t (&&)
(&&) :: Bool -> Bool -> Bool
ghci> and' (repeat False)
False
ghci> scanl (+) 0 [3,5,2,1]
[0,3,8,10,11]
ghci> scanr (+) 0 [3,5,2,1]
[11,8,3,1,0]
ghci> scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
[3,4,5,5,7,9,9,9]
ghci> scanl (flip (:)) [] [3,2,1]
[[],[3],[2,3],[1,2,3]]
ghci> sqrtSums
131
ghci> sum (map sqrt [1..131])
1005.0942035344083
ghci> sum (map sqrt [1..130])
993.6486803921487
ghci> :t ($)
($) :: (a -> b) -> a -> b
ghci> sum (filter (> 10) (map (*2) [2..10]))
80
ghci> sum $ filter (> 10) (map (*2) [2..10])
80
ghci> sum $ filter (> 10) $ map (*2) [2..10]
80
ghci> map ($ 3) [(4+), (10*), (^2), sqrt]
[7.0,30.0,9.0,1.7320508075688772]
ghci> :t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c
ghci> (negate . (*3)) 5
-15
ghci> map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
[-5,-3,-6,-7,-3,-2,-19,-24]
ghci> map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
[-5,-3,-6,-7,-3,-2,-19,-24]
ghci> map (negate . sum . tail) [[1..5],[3..6],[1..7]]
[-14,-15,-27]
ghci> sum (replicate 5 (max 6.7 8.9))
44.5
ghci> (sum . replicate 5) (max 6.7 8.9)
44.5
ghci> sum . replicate 5 $ max 6.7 8.9
44.5
ghci> replicate 2 (product (map (*3) (zipWith max [1,2] [4,5])))
[180,180]
ghci> replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]
[180,180]
```
