import Data.List
import Data.Maybe

main = readFile "./input" >>= print . sum . map (g . f) . lines
f r = uncurry intersect . splitAt ((length r) `div` 2) $ r
g (c:cs) = fromJust . lookup c $ zip (['a'..'z'] ++ ['A'..'Z']) [1..]



