main = readFile "./input" >>= print . maximum . f 0 . lines

f :: Int -> [ String ] -> [ Int ]
f c [] = [ c ]
f c ("":ns) = c : (f 0 ns)
f c (n:ns) = f (c + read n) ns
