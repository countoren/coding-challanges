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

main = readFile "./input" >>= print . f . lines

f report@(n:ns) = uncurry (*) $ g (2^(length n -1)) [] [] report 

g :: Int -> [String] -> [String] -> [String] -> (Int,Int)
g msb [] [] [x]  = let a = h msb x in (a,a)
g msb os zs (('1':bs):bns) = g msb (bs:os) zs bns 
g msb os zs (('0':bs):bns) = g msb os (bs:zs) bns 
g _ [] [] []  = (0,0)
g msb os zs [] 
  | length os >= length zs = ( msb + fst ( g (div msb 2) [] [] os) , snd $ g (div msb 2) [] [] zs)
  | otherwise = (fst $ g (div msb 2) [] [] zs, msb + snd ( g (div msb 2) [] [] os))

h msb ('1':bits) = msb + h (div msb 2) bits
h msb ('0':bits) = h (div msb 2) bits
h _ [] = 0
