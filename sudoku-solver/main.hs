import Control.Monad
import Data.List
import Data.Maybe
import Data.Char

--Coding Games:
main = interact $ unlines 
    . map (concat. map show) . sudoku
    . map (map digitToInt) . lines


--CodeWars:
sudoku :: [[Int]] -> [[Int]]
sudoku p = maybe [[]] (reverse . map reverse) $ sudoku' (length p) p [[]]

sudoku' boardSize ((0:row):rows) (pRow:pRows) =
        join . find isJust
        . map (sudoku' boardSize (row:rows) . (:pRows) . (:pRow)) 
        $ getPosabilities boardSize pRows pRow row rows

sudoku' bs ((n:ns):rows) ([]:pRows) = sudoku' bs (ns:rows) (pure n:pRows)
sudoku' bs ((n:ns):rows) (pRow:pRows) = sudoku' bs (ns:rows) ((n:pRow):pRows)
sudoku' _ [[]] p = Just p
sudoku' bs ([]:rows) p = sudoku' bs rows ([]:p)

getPosabilities boardSize pRows pRow row rows = 
    [1..boardSize] \\ concat [pRow , row, boxValues, map (!!x) nonBoxRows, map (!!(boardSize-x-1)) nonBoxPRows]
    where
        x = length pRow
        y = length pRows
        (nonBoxPRows, nonBoxRows, boxValues) = getBox (round.sqrt.fromIntegral$boardSize) boardSize x y pRows rows

getBox boxSize boardSize x y pRows rows =
        (,,) nonBoxPRows nonBoxRows $
            take boxSize =<<
            (drop (boardSize - boxSize - (x-mod x boxSize)) <$>  bPRows)
            ++ (drop (x - mod x boxSize) <$> bRows)
    where
        (bPRows, nonBoxPRows) = splitAt (mod y boxSize) pRows
        (bRows, nonBoxRows) = splitAt (boxSize - mod y boxSize -1) rows


-- pRows = [[5,3,0,0,7,0,0,0,0],
--            [6,0,0,1,9,5,0,0,0]
--            ]

-- rows :: [[Int]]
-- rows = [
--            [8,0,0,0,6,0,0,0,3],
--            [4,0,0,8,0,3,0,0,1],
--            [7,0,0,0,2,0,0,0,6],
--            [0,6,0,0,0,0,2,8,0],
--            [0,0,0,4,1,9,0,0,5],
--            [0,0,0,0,8,0,0,7,9]]

-- -- [0,9,8,0,0,0,0,6,0],
-- pRow :: [Int]
-- pRow = [0,9,8,0,0,0,0,6,0]


-- row :: [Int]
-- row = []


puzzle = [[5,3,0,0,7,0,0,0,0],
          [6,0,0,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,0,0,0,8,0,0,7,9]]


-- puzzle = [[5,3,0,0,7,0,0,0,0],
--           [6,0,0,1,9,5,0,0,0],
--           [0,9,8,0,0,0,0,6,0],
--           [8,0,0,0,6,0,0,0,3],
--           [4,0,0,8,0,3,0,0,1],
--           [7,0,0,0,2,0,0,0,6],
--           [0,6,0,0,0,0,2,8,0],
--           [0,0,0,4,1,9,0,0,5],
--           [0,0,0,0,8,0,0,7,9]]
-- puzzle = [[5,3,4,6,7,8,9,1,2],
--    [6,7,2,1,9,5,3,4,8],
--    [1,9,8,3,4,2,5,6,7],
--    [8,5,9,7,6,1,4,2,3],
--    [4,2,6,8,5,3,7,9,1],
--    [7,1,3,9,2,4,8,5,6],
--    [9,6,1,5,3,7,2,8,4],
--    [2,8,7,4,1,0,6,3,5],
--    [3,4,5,2,8,6,1,0,0]]



pRows :: [[Int]]
pRows = 
    [[5,3,6,9,1,4,7,8,2]
    ,[4,8,2,7,3,5,1,6,9]
    ,[6,5,8,4,2,9,3,1,7]
    ,[1,9,7,3,5,8,6,2,4]
    ,[3,2,4,1,6,7,9,5,8]
    ,[7,6,5,2,4,3,8,9,1]
    ,[8,4,3,5,9,1,2,7,6]
    ,[2,1,9,8,7,6,4,3,5]]


pRowsN :: [[Int]]
pRowsN = [[5,3,4,6,7,8,9,1,2],
 [6,7,2,1,9,5,3,4,8],
 [1,9,8,3,4,2,5,6,7],
 [8,5,9,7,6,1,4,2,3],
 [4,2,6,8,5,3,7,9,1],
 [7,1,3,9,2,4,8,5,6],
 [9,6,1,5,3,7,2,8,4],
 [2,8,7,4,1,9,6,3,5]]

rows :: [[Int]]
rows = []


pRow :: [Int]
pRow = [7,1,6,8,2,5,4,3]

pRowN :: [Int]
pRowN = [3,4,5,2,8,6,1,7]

row :: [Int]
row = []

solutionM1 :: [[ Int ]]
solutionM1 = [[5,3,4,6,7,8,9,1,2],
   [6,7,2,1,9,5,3,4,8],
   [1,9,8,3,4,2,5,6,7],
   [8,5,9,7,6,1,4,2,3],
   [4,2,6,8,5,3,7,9,1],
   [7,1,3,9,2,4,8,5,6],
   [9,6,1,5,3,7,2,8,4],
   [2,8,7,4,1,9,6,3,5],
   [3,4,5,2,8,6,1,7,0]]


{- Should return
[[5,3,4,6,7,8,9,1,2],
 [6,7,2,1,9,5,3,4,8],
 [1,9,8,3,4,2,5,6,7],
 [8,5,9,7,6,1,4,2,3],
 [4,2,6,8,5,3,7,9,1],
 [7,1,3,9,2,4,8,5,6],
 [9,6,1,5,3,7,2,8,4],
 [2,8,7,4,1,9,6,3,5],
 [3,4,5,2,8,6,1,7,9]]
-}
