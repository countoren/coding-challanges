import Data.Map as M

-- input = [ 1,3,2 ]
-- input = [ 3,1,2 ]
input = [5,1,9,18,13,8,0]

main =  print $ f (length input) (last input) 
              . fromList . (`zip` [1..] ) . init $ input

-- part2.nix will replace in file 2020 to 3000000 and run it with -O2 flat to get TCO
-- f 30000000 l _ = l
f 2020 l _ = l
f i l ls = f (succ i) (maybe 0 (i -) $ M.lookup l ls) (insert l i ls)
