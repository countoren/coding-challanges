import Control.Monad
import Data.Foldable
import Debug.Trace

example = 
    [ "L.LL.LL.LL"
    , "LLLLLLL.LL"
    , "L.L.L..L.."
    , "LLLL.LL.LL"
    , "L.LL.LL.LL"
    , "L.LLLLL.LL"
    , "..L.L....."
    , "LLLLLLLLLL"
    , "L.LLLLLL.L"
    , "L.LLLLL.LL"
    ]

main = readFile "./input" >>= print . untilTheSameCountOcp [] . iterate (f []) . lines

untilTheSameCountOcp s1 (s2:ss) 
    | s1 == s2 = sum . map (length . filter (=='#') ) $ s2
    | otherwise = untilTheSameCountOcp s2 ss

f pRow (row:rows) = g row [pRow , join $ take 1 rows] "" : f row rows 
f _ [] = []

g:: String -> [String] -> String -> String
g (c:cs) rows lc = 
    (: g cs (map (drop (1-colToDrop)) rows) [c])
    . newSitState c 
    $ lc <> take 1 cs <> (rows >>= take (3-colToDrop))
    where colToDrop = if null lc then 1 else 0

g [] _ _ = []

newSitState 'L' = maybe '#' (const 'L') . find (=='#')
newSitState '.' = const '.'
newSitState '#' = 
    maybe '#' (const 'L')
    . find (>=4) . Just . length . filter (=='#')


