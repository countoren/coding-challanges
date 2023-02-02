import Data.List

main = readFile "./input" >>= print . sum . take 3 . reverse . sort . f 0 . lines

f :: Int -> [ String ] -> [ Int ]
f c [] = [ c ]
f c ("":ns) = c : (f 0 ns)
f c (n:ns) = f (c + read n) ns
