main = readFile "./input" >>= print . countIncrements 0 . map read . lines

countIncrements :: Int -> [Int] -> Int
countIncrements count (i1:i2:is) 
  | i1<i2 = countIncrements (count+1) (i2:is)
  | otherwise = countIncrements count (i2:is)

countIncrements count _ = count 
