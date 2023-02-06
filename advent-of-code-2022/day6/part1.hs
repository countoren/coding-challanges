import Text.ParserCombinators.ReadP
import Data.Char
import Data.List

main = readFile "./input" >>= print . uncurry (f 4) . splitAt 4

f i a@(c:cs) (x:xs) 
  | (length $ nub $ a) == length a = i
  | otherwise = f (i+1) (cs++[x]) xs
