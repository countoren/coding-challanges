module Calculator where
import Text.ParserCombinators.ReadP

evaluate :: String -> Double
evaluate = fst . last . readP_to_S p . filter (/=' ')

p = (`chainl1` add) . (`chainl1` mul) $ choice [ number, between (char '(') (char ')') p]

number :: ReadP Double
number = read <$> munch1 (\c-> (elem c ['0'..'9']) || c == '.')

add = choice [(+) <$ char '+', (-) <$ char '-']
mul = choice [(*) <$ char '*', (/) <$ char '/']
