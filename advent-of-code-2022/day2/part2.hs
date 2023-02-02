import Data.List

main = readFile "./input" >>= print . sum . map f . map words . lines

wldValue "X" = 0
wldValue "Y" = 3
wldValue "Z" = 6

f [ x, y ] = wldValue y + g (x,y)
g t 
  | elem t [("A","Y"),("B","X"),("C","Z")] = 1
  | elem t [("A","Z"),("B","Y"),("C","X")] = 2
  | elem t [("A","X"),("B","Z"),("C","Y")] = 3
   
