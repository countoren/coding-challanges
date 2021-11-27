module Kata.KnightTour where

import Data.Maybe
import Data.List
import Control.Monad

type Dim = (Int,Int) -- Dimensions of the chessboard (width,height)
type Pos = (Int,Int) -- Position (x,y), 1 based, (1,1) being top left corner
type Solution = [Pos] -- Solution is a list of positions

solve :: Dim -> Pos -> Maybe Solution
solve = f []

knightMovesDirection = [(2,1),(1,2)] >>= \(x',y')-> [(x',y'),(-x',-y'),(-x',y'),(x',-y')]
knightMoves (x,y) = (\(x1,y1)-> (x+x1,y+y1)) <$> knightMovesDirection

f s (w,h) p@(x,y) 
  | length s == w*h = Just $ reverse s
  | x>w || x<1 || y>h || y < 1 = Nothing
  | otherwise = join . find isJust . map (f (p:s) (w,h)) $ knightMoves p \\ s

