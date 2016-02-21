import Data.Char (chr, ord, digitToInt)
import Data.List (sort, group, words, length, tails, isPrefixOf, any, find)

wordNums :: String -> [(String,Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

-- isIn equal isInfixOf
isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

encode :: Int -> String -> String
-- encode offset msg = map (\c -> chr $ ord c + offset) msg
encode offset = map (\c -> chr $ ord c + offset)

decode :: Int -> String -> String
decode shift = encode $ negate shift

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]
