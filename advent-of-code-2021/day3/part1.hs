import Data.List

example = 
    [ "00100"
    , "11110"
    , "10110"
    , "10111"
    , "10101"
    , "01111"
    , "00111"
    , "11100"
    , "10000"
    , "11001"
    , "00010"
    , "01010"
    ]

main = readFile "./input" >>= print . (\counts -> f (0,0) (2^(length counts-1)) counts) . map g . transpose . lines

--main = print . (\counts -> f (0,0) (2^(length counts-1)) counts) .  map g . transpose $ example

--main = print . map g . transpose $ example

f (gamma,epsilon) base (n:ns) 
  | n > 0 = f (gamma+base, epsilon) (base/2) ns 
  | otherwise = f (gamma, epsilon+base) (base/2) ns
f (gamma,epsilon) _ [] = gamma*epsilon

g ('1':bits) = 1 + (g bits)
g ('0':bits) = -1 + (g bits)
g [] = 0

