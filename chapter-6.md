6.1


Hackage ... package registry ?
http://hackage.haskell.org/packages

cabal ... package manager ?

Prelude module

Hoogle ... search engine

```
ghci> :t nub

<interactive>:1:1: Not in scope: ‘nub’
ghci> import Data.List
ghci> :t nub
nub :: Eq a => [a] -> [a]
```

```
ghci> :t nub

<interactive>:1:1: Not in scope: ‘nub’
ghci> import Data.List (nub, sort)
ghci> :t nub
nub :: Eq a => [a] -> [a]
```

```
ghci> :t sort

<interactive>:1:1:
    Not in scope: ‘sort’
    Perhaps you meant ‘sqrt’ (imported from Prelude)
ghci> :t nub

<interactive>:1:1: Not in scope: ‘nub’
ghci> import Data.List hiding (nub)
ghci> :t sort
sort :: Ord a => [a] -> [a]
ghci> :t nub

<interactive>:1:1: Not in scope: ‘nub’
```

```
ghci> import qualified Data.List
ghci> :t nub

<interactive>:1:1:
    Not in scope: ‘nub’
    Perhaps you meant ‘Data.List.nub’ (imported from Data.List)
ghci> :t Data.List.nub
Data.List.nub :: Eq a => [a] -> [a]
```

```
ghci> import qualified Data.List as L
ghci> :t L.nub
L.nub :: Eq a => [a] -> [a]
```

6.2

```
ghci> import Data.List
ghci> words "hey these are the words in this sentence"
["hey","these","are","the","words","in","this","sentence"]
ghci> words "hey these            are    the words in this sentence"
["hey","these","are","the","words","in","this","sentence"]
```

```
ghci> import Data.List (group)
ghci> group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]
[[1,1,1,1],[2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]
ghci> group ["boom","bip","bip","boom","boom"]
[["boom"],["bip","bip"],["boom","boom"]]
ghci> import Data.List (sort)
ghci> group $ sort ["boom","bip","bip","boom","boom"]
[["bip","bip"],["boom","boom","boom"]]
ghci> sort [5,4,3,7,2,1]
[1,2,3,4,5,7]
```

```
ghci> :l chapter-6-2.hs
[1 of 1] Compiling Main             ( chapter-6-2.hs, interpreted )
Ok, modules loaded: Main.
ghci> wordNums "wa wa wee wa"
[("wa",3),("wee",1)]
```

```
ghci> import Data.List (tails)
ghci> tails "party"
["party","arty","rty","ty","y",""]
ghci> tails [1,2,3]
[[1,2,3],[2,3],[3],[]]
ghci> import Data.List (isPrefixOf)
ghci> "hawaii" `isPrefixOf` "hawaii joe"
True
ghci> "haha" `isPrefixOf` "ha"
False
ghci> "ha" `isPrefixOf "ha"

<interactive>:8:18: parse error on input ‘"’
ghci> "ha" `isPrefixOf` "ha"
True
ghci> "ha" `isPrefixOf` "a ha"
False
ghci> import Data.List (any)
ghci> any (> 4) [1,2,3]
False
ghci> any (> 4) [1,2,3,5]
True
ghci> any (== 'F') "Frank Sobotka"
True
ghci> any (\x -> x > 5 && x < 10) [1,4,11]
False
ghci> any (\x -> x > 5 && x < 10) [1,4,6,11]
True
```

```
ghci> :l chapter-6-2.hs
[1 of 1] Compiling Main             ( chapter-6-2.hs, interpreted )
Ok, modules loaded: Main.
ghci> "art" `isIn` "party"
True
ghci> [1,2] `isIn` [1,3,5]
False
```

```
ghci> import Data.Char (ord, chr)
ghci> ord 'a'
97
ghci> chr 97
'a'
ghci> map ord "abcdefgh"
[97,98,99,100,101,102,103,104]
```

```
ghci> :l chapter-6-2.hs
[1 of 1] Compiling Main             ( chapter-6-2.hs, interpreted )
Ok, modules loaded: Main.
ghci> encode 3 "hey mark"
"kh|#pdun"
ghci> encode 5 "please instruct your men"
"uqjfxj%nsxywzhy%~tzw%rjs"
ghci> encode 1 "to party hard"
"up!qbsuz!ibse"
ghci> :l chapter-6-2.hs
[1 of 1] Compiling Main             ( chapter-6-2.hs, interpreted )
Ok, modules loaded: Main.
ghci> decode 3 "kh|#pdun"
"hey mark"
ghci> decode 5 "uqjfxj%nsxywzhy%~tzw%rjs"
"please instruct your men"
ghci> decode 1 "up!qbsuz!ibse"
"to party hard"
```

```
ghci> foldl (+) 0 (replicate 100 1)
100
ghci> foldl (+) 0 (replicate 1000000 1)
1000000
ghci> foldl (+) 0 (replicate 100000000 1)
100000000
ghci> import Data.List (fold')

<interactive>:1:19: Module ‘Data.List’ does not export ‘fold'’
ghci> import Data.List
ghci> foldl' (+) 0 (replicate 100000000 1)
100000000
ghci>
```

動いちゃったよ……

```
ghci> import Data.Char (digitToInt)
ghci> digitToInt '2'
2
ghci> digitToInt 'F'
15
ghci> digitToInt 'z'
*** Exception: Char.digitToInt: not a digit 'z'
```

```
ghci> Nothing
Nothing
ghci> Just "hey"
Just "hey"
ghci> Just 3
Just 3
ghci> :t Just "hey"
Just "hey" :: Maybe [Char]
ghci> :t Just True
Just True :: Maybe Bool
ghci> import Data.List (find)
ghci> find (> 4) [3,4,5,6,7]
Just 5
ghci> find odd [2,4,6,8,9]
Just 9
ghci> find (=='z') "mjolnir"
Nothing
```

```
ghci> :l chapter-6-2.hs
[1 of 1] Compiling Main             ( chapter-6-2.hs, interpreted )
Ok, modules loaded: Main.
ghci> firstTo40
Just 49999
ghci> firstTo 27
Just 999
ghci> firstTo 1
Just 1
ghci> firstTo 13
Just 49
```

6.3

```
ghci> :l chapter-6-3.hs
[1 of 1] Compiling Main             ( chapter-6-3.hs, interpreted )
Ok, modules loaded: Main.
ghci> findKey "penny" phoneBook
Just "853-2492"
ghci> findKey "betty" phoneBook
Just "555-2938"
ghci> findKey "wilma" phoneBook
Nothing
```

```
ghci> import qualified Data.Map as Map
ghci> Map.fromList [(3,"shoes"),(4,"trees"),(9,"bees")]
fromList [(3,"shoes"),(4,"trees"),(9,"bees")]
ghci> Map.fromList [("kima","greggs"),("jimmy","mcnulty"),("jay","landsman")]
fromList [("jay","landsman"),("jimmy","mcnulty"),("kima","greggs")]
ghci> Map.fromList [("MS",1),("MS",2),("MS",3)]
fromList [("MS",3)]
ghci> :t Map.fromList
Map.fromList :: Ord k => [(k, a)] -> Map.Map k a
```

```
ghci> :l chapter-6-3.hs
[1 of 1] Compiling Main             ( chapter-6-3.hs, interpreted )
Ok, modules loaded: Main.
ghci> :t Map.lookup
Map.lookup :: Ord k => k -> Map.Map k a -> Maybe a
ghci> Map.lookup "betty" phoneBook
Just "555-2938"
ghci> Map.lookup "wendy" phoneBook
Just "939-8282"
ghci> Map.lookup "grace" phoneBook
Nothing
ghci> :t Map.insert
Map.insert :: Ord k => k -> a -> Map.Map k a -> Map.Map k a
ghci> Map.lookup "grace" phoneBook
Nothing
ghci> let newBook = Map.insert "grace" "341-9021" phoneBook
ghci> Map.lookup "grace" newBook
Just "341-9021"
ghci> :t Map.size
Map.size :: Map.Map k a -> Int
ghci> Map.size phoneBook
6
ghci> Map.size newBook
7
```

```
ghci> :l chapter-6-3.hs
[1 of 1] Compiling Main             ( chapter-6-3.hs, interpreted )
Ok, modules loaded: Main.
ghci> string2digits "948-9282"
[9,4,8,9,2,8,2]
ghci> let intBook = Map.map string2digits phoneBook
ghci> :t intBook
intBook :: Map.Map String [Int]
ghci> Map.lookup "betty" intBook
Just [5,5,5,2,9,3,8]
```

```
ghci> :l chapter-6-3.hs
[1 of 1] Compiling Main             ( chapter-6-3.hs, interpreted )
Ok, modules loaded: Main.
ghci> Map.lookup "patsy" $ phoneBookToMap phoneBook
Just "827-9162, 943-2929, 493-2928"
ghci> Map.lookup "wendy" $ phoneBookToMap phoneBook
Just "939-8282"
```

Maybe が返される (本の中では値を直接返している)

```
ghci> import qualified Data.Map as Map
ghci> Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
fromList [(2,100),(3,29),(4,22)]
ghci> Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
fromList [(2,108),(3,62),(4,37)]
```

6.4
