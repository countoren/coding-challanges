import Control.Monad
import Data.Foldable
import Data.List
import Control.Arrow
import Control.Applicative


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

example2 = 
    [ "1##9##7"
    , "#2#8#6#"
    , "##345##"
    , "...L..."
    , "##...##"
    , "#.#.#.#"
    , ".##.##."
    ]


main = readFile "./input" >>= print . untilTheSameCountOcp [] . iterate (processRows []) . lines

untilTheSameCountOcp s1 (s2:ss) 
    | s1 == s2 = sum . map (length . filter (=='#') ) $ s2
    | otherwise = untilTheSameCountOcp s2 ss

processRows pRows (row:rows) = 
    processCols 1 row [pRows , rows] "." : processRows (row:pRows) rows 
processRows _ [] = []

processCols :: Int -> String -> [[String]] -> String -> String
processCols ix (c:cs) rows lastSeeLeft = 
    (: processCols (ix+1) cs rows (if elem c ['L', '#'] then [c] else lastSeeLeft))
    . newSitState c 
    . (lastSeeLeft <>)
    . join . map (take 1 . dropWhile (=='.')).(cs :) $ rows >>=   getDiagonals ix 

processCols _ [] _ _ = []

newSitState 'L' = maybe '#' (const 'L') . find (=='#')
newSitState '.' = const '.'
newSitState '#' = 
    maybe '#' (const 'L')
    . find (>=5) . Just . length . filter (=='#')

getDiagonals :: Int -> [String] -> [String]
getDiagonals n = transpose . zipWith ($) ((\x-> getElemsByDistance  [n-x,if n-x <= 0 then n else x ,x] ) <$>  [1..])

getElemsByDistance :: [Int] -> String -> String
getElemsByDistance (i:is) = uncurry (:) 
    . ((head . (<> ['.'])) *** getElemsByDistance is)
    . splitAt (fromEnum (i>0)) . drop (i-1) 

getElemsByDistance [] = const []

