module Calculator where

import Text.ParserCombinators.ReadP

-- | Evaluate an expression
-- From: https://www.codewars.com/kata/5235c913397cbf2508000048
--
-- given the following expression, the result is...
-- >>> evaluate "10 + (30 * 2) + 3"
-- 73.0
--
-- >>> evaluate "(10 + 30) * (2 + 3)"
-- 200.0
--
evaluate :: String -> Double
evaluate = fst . last . readP_to_S p . filter (/=' ')

-- | Expression parser
-- >>> ( \[(_,_),(op,_)] -> op ) $ readP_to_S p "3+4"
-- 7.0
--
p = (`chainl1` add) . (`chainl1` mul) $ choice [ number, between (char '(') (char ')') p]

number :: ReadP Double
number = read <$> munch1 (\c-> (elem c ['0'..'9']) || c == '.')

-- | Add parser
-- >>> ( \[(op, "")] -> op 3 4 ) $ readP_to_S add "+"
-- 7.0
--
-- >>> ( \[(op, "")] -> op 4 3 ) $ readP_to_S add "-"
-- 1.0
--
add = choice [(+) <$ char '+', (-) <$ char '-']

mul = choice [(*) <$ char '*', (/) <$ char '/']
