2.1

```
ghci> :t 'a'
'a' :: Char
ghci> :t True
True :: Bool
ghci> :t "Hello!"
"Hello!" :: [Char]
ghci> :t (True, 'a')
(True, 'a') :: (Bool, Char)
ghci> :t 4 == 5
4 == 5 :: Bool
```

2.2

```
ghci> circumference' 4
25.132741228718345
ghci> circumference 4
25.132742
```

2.3

```
ghci> :t head
head :: [a] -> a
ghci> :t fst
fst :: (a, b) -> a
```

2.4

```
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool
ghci> 5 == 5
True
ghci> 5 /= 5
False
ghci> 'a' == 'a'
True
ghci> "Ho Ho" == "Ho Ho"
True
ghci> 3.432 == 3.432
True
ghci> :t (>)
(>) :: Ord a => a -> a -> Bool
ghci> "Abrakadabra" < "Zebra"
True
ghci> "Abrakadabra" `compare` "Zebra"
LT
ghci> 5 >= 2
True
ghci> 5 `compare` 3
GT
ghci> 'b' > 'a'
True
ghci> show 3
"3"
ghci> show 5.334
"5.334"
ghci> show True
"True"
ghci> read "True" || False
True
ghci> read "8.2" + 3.8
12.0
ghci> read "5" - 2
3
ghci> read "[1,2,3,4]" ++ [3]
[1,2,3,4,3]
ghci> read "4"
*** Exception: Prelude.read: no parse
ghci> :t read
read :: Read a => String -> a
ghci> read "5" :: Int
5
ghci> read "5" :: Float
5.0
ghci> (read "5" :: Float) * 4
20.0
ghci> read "[1,2,3,4]" :: [Int]
[1,2,3,4]
ghci> [read "True", False, True, False]
[True,False,True,False]
ghci> ['a'..'e']
"abcde"
ghci> [LT .. GT]
[LT,EQ,GT]
ghci> [3 .. 5]
[3,4,5]
ghci> succ 'B'
'C'
ghci> minBound :: Int
-9223372036854775808
ghci> maxBound :: Char
'\1114111'
ghci> maxBound :: Bool
True
ghci> minBound :: Bool
False
ghci> maxBound :: (Bool, Int, Char)
(True,9223372036854775807,'\1114111')
ghci> :t 20
20 :: Num a => a
ghci> 20 :: Int
20
ghci> 20 :: Float
20.0
ghci> 20 :: Integer
20
ghci> 20 :: Double
20.0
ghci> :t (*)
(*) :: Num a => a -> a -> a
ghci> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
ghci> :t length
length :: Foldable t => t a -> Int
ghci> length [1,2,3] + 3.2

<interactive>:76:18:
    No instance for (Fractional Int) arising from the literal ‘3.2’
    In the second argument of ‘(+)’, namely ‘3.2’
    In the expression: length [1, 2, 3] + 3.2
    In an equation for ‘it’: it = length [1, 2, 3] + 3.2
ghci> fromIntegral (length [1,2,3]) + 3.2
6.2
```
