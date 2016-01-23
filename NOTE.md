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
