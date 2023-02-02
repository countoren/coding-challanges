import Data.List
import Data.Maybe

main = readFile "./input" >>= print . sum . map (h . f . break (==',')). lines

f (i1, (_:i2)) = (g i1, g i2)

g :: String -> ( Int , Int)
g = g2 . break (=='-')
g2 (n1,(_:n2)) = (read n1, read n2)

h ((e1s1, e1s2), (e2s1,e2s2))
 | (e1s1 >= e2s1 && e1s2 <= e2s2) ||
   (e1s1 <= e2s1 && e1s2 >= e2s2) = 1
  | otherwise = 0
   
  
