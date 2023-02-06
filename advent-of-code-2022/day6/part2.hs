import Text.ParserCombinators.ReadP
import Data.Char
import Data.List

main = readFile "./input" >>= print . uncurry (f 14) . splitAt 14

f i a@(c:cs) (x:xs) 
  | (length $ nub $ a) == length a = i
  | otherwise = f (i+1) (cs++[x]) xs
