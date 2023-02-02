import Text.ParserCombinators.ReadP
import Data.Char
import Data.List
import Control.Applicative ((<**>), (<|>))
main = readFile "./input" >>= print . f 

f = (>>= head) .
    fst . head . reverse .
    readP_to_S p

p = state >>= c
c s = choice [ s <$ eof, 
     (command <*> return s) >>= c
     ]

command = move <$
 string "move " <*> number
 <* string " from " <*> number
 <* string " to " <*> number <* char '\n'

move n f t s
    | f == t = s
    | f < t = reverse . fst . foldl m ([],([],n,f,t)) $ s
    | otherwise = fst . foldr (flip m) ([],([],n,(length s)+1-f,(length s)+1-t)) $ s

m (out,(c,n,1,t)) s = 
   ((drop n s):out,(take n s,n,0,t-1))
m (out,(c,n,f,1)) s = 
   (( c++s):out,([],n,f-1,0))
m (out,(c,n,f,t)) s = (s:out,(c,n,f-1,t-1))

number :: ReadP Int
number = fmap read $ many1 $ satisfy isDigit

state = do
   s <- many $ row <* char '\n'
   count 2 anyLine
   return $ map (filter (/="")) $ transpose s

anyLine = do
   skipMany $ satisfy (/='\n')
   char '\n'

row = sepBy bOrEmpty $ char ' '
bOrEmpty = choice [b , "" <$ string "   "]
b = (:[]) <$> (char '[' *> satisfy isAsciiUpper <* char ']')
