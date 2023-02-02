import Data.List
import Data.Maybe

main = readFile "./input" >>= print . sum . map g . f . lines

f :: [ String ] -> [[Char]]
f [] = []
f (r1:r2:r3:rs) = (intersect r1 (intersect r2 r3)) : f rs
g (c:cs) = fromJust . lookup c $ zip (['a'..'z'] ++ ['A'..'Z']) [1..]



