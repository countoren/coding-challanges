import Data.List

main = readFile "./input" >>= print . sum . map f . map words . lines

elfsRPS = [ "A", "B", "C" ]
meRPS = [ "X", "Y", "Z" ]

rotateLeft i = take 3 . drop i . cycle
draw = zip elfsRPS meRPS
win = zip elfsRPS $ rotateLeft 1 meRPS
lose = zip elfsRPS $ rotateLeft 2 meRPS

rpsValue "X" = 1
rpsValue "Y" = 2
rpsValue "Z" = 3

f [ x, y ] = rpsValue y + g (x,y)
g t 
  | elem t draw = 3
  | elem t win = 6
  | elem t lose = 0
   
