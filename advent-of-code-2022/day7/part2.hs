import Text.ParserCombinators.ReadP
import Data.Char

main = readFile "./input" >>= print . take 1 . reverse . readP_to_S p

p = collect <$ cd <*> (many $ choice [ 0 <$ dir, file]) <*> many p <* choice [ () <$ up, eof ]


collect fs = c $ foldl1 (+) fs
c fs ds = addDir . foldl1 sumTup . (:ds) $ (99999999999,fs)

sumTup (x,y) (a,b) = (min x a,y+b)
addDir (x,y) 
  | y > (30000000-(70000000-46592386)) = (min x y,y)
  | otherwise = (x,y)

word = munch $ not . isSpace
cd = string "$ cd " *> word <* string "\n$ ls\n"
dir = string "dir " *> word <* char '\n' 
file = number <* char ' ' <* word <* char '\n'
up = string "$ cd ..\n"

number :: ReadP Int
number = read <$> munch isDigit
