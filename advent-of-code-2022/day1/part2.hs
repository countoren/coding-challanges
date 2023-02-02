main = readFile "./input" >>= print . countIncrements 0 . group3 . map read . lines

group3 (i1:i2:i3:is) = (i1+i2+i3) : group3 (i2:i3:is)
group3 _ = []

countIncrements :: Int -> [Int] -> Int
countIncrements count (i1:i2:is) 
  | i1<i2 = countIncrements (count+1) (i2:is)
  | otherwise = countIncrements count (i2:is)

countIncrements count _ = count 
