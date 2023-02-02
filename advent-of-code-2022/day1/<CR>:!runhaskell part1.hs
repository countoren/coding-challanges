main = readFile "./input" >>= print . max . f 0 . lines

f c ("":ns) = c : (f 0 ns)
f c (n:ns) = f (c + read n) ns
