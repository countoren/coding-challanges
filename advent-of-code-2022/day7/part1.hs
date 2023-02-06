import Text.ParserCombinators.ReadP
import Data.Char

main = readFile "./input" >>= print . take 2 . reverse . readP_to_S p

p = collect <$ cd <*> (many $ choice [ 0 <$ dir, file]) <*> many p <* choice [ () <$ up, eof ]

collect fs ds = addDir . foldl1 sumTup . (:ds) . toTuple . foldl1 (+) $ fs

toTuple s = (0,s)
sumTup (x,y) (a,b) = (x+a,y+b)
addDir (x,y) | y < 100000 = (x+y,y)
      | otherwise = (x,y)

word = munch $ not . isSpace
cd = string "$ cd " *> word <* string "\n$ ls\n"
dir = string "dir " *> word <* char '\n' 
file = number <* char ' ' <* word <* char '\n'
up = string "$ cd ..\n"

number :: ReadP Int
number = fmap read $ many1 $ satisfy isDigit
